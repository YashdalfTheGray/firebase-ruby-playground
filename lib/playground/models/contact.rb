# frozen_string_literal: true

require 'securerandom'
require 'date'

module Playground
  module Models
    # Contact represents a person's data in a contact book
    class Contact
      attr_reader :id, :created_at, :updated_at, :name, :email, :phone

      def initialize(name, email, phone)
        @id = SecureRandom.uuid
        @created_at = DateTime.now
        @updated_at = DateTime.now
        @name = name
        @email = email
        @phone = phone
      end
    end
  end
end
