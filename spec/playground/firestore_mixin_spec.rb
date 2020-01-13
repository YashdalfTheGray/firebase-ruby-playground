# frozen_string_literal: true

require 'google/cloud/firestore/client'
require 'google/cloud/firestore/document_reference'
require 'playground/firestore_mixin'
require 'playground/models/contact'

module Playground
  describe FirestoreMixin do
    class FirestoreMixinTestDummy
      include FirestoreMixin

      attr_accessor :firestore
      def initialize(dummy)
        @firestore = dummy
      end
    end

    let(:dummy) { FirestoreMixinTestDummy.new instance_double(Google::Cloud::Firestore::Client) }

    context '.write' do
      it 'serializes a document into the firestore' do
        firestore_doc_double = instance_double(Google::Cloud::Firestore::DocumentReference)
        data_doc_double = instance_double(Playground::Models::Contact)

        expect(dummy.firestore).to receive('doc').and_return firestore_doc_double
        # If necessary, it can return Google::Cloud::Firestore::CommitResponse::WriteResult
        expect(firestore_doc_double).to receive('set').and_return true
        expect(data_doc_double).to receive('serialize').and_return({})
        expect(data_doc_double).to receive('id').and_return 'data_doc_double_id'

        expect(dummy.write('contacts', data_doc_double)).to eq true
      end

      it 'raises an error if the document cannot be serialized' do
        firestore_doc_double = instance_double(Google::Cloud::Firestore::DocumentReference)
        data_doc_double = instance_double(Playground::Models::Contact)

        expect(dummy.firestore).to receive('doc').and_return firestore_doc_double
        # If necessary, it can return Google::Cloud::Firestore::CommitResponse::WriteResult
        expect(firestore_doc_double).not_to receive 'set'
        expect(data_doc_double).to receive('serialize').and_raise NoMethodError
        expect(data_doc_double).to receive('id').and_return 'data_doc_double_id'

        expect { dummy.write('contacts', data_doc_double) }.to raise_error ArgumentError
      end
    end
  end
end
