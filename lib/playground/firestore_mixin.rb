# frozen_string_literal: true

module Playground
  # FirestoreMixin holds all of the oeprations that
  # we can perform on the data
  module FirestoreMixin
    def write(collection, doc)
      document_ref = @firestore.doc "#{collection}/#{doc.id}"
      begin
        document_ref.set doc.serialize
      rescue NoMethodError
        raise ArgumentError 'Document is not serializable'
      end
    end
  end
end
