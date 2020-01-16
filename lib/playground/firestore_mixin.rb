# frozen_string_literal: true

module Playground
  # FirestoreMixin holds all of the oeprations that
  # we can perform on the data
  module FirestoreMixin
    # Write a document that is serializable to the firestore. The document
    # being stored needs to be able to be JSON serializable.
    #
    # @param collection [String] the collection to put this document into
    # @param doc [Object, #serialize] the object to put in the document
    def write(collection, doc)
      document_ref = @firestore.doc "#{collection}/#{doc.id}"
      begin
        document_ref.set doc.serialize
      rescue NoMethodError
        raise ArgumentError, 'Document is not serializable'
      end
    end
  end
end
