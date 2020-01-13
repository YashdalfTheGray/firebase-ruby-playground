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
  end
end
