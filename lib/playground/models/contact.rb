# frozen_string_literal: true

require 'securerandom'
require 'date'
require 'json'

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

      def to_h
        instance_variables.reduce({}) do |hash, v|
          name = v.to_s[1..-1]
          value = send(name) if respond_to? name
          hash[name] = if value.is_a? DateTime
            value.to_s
          else
            value
          end
        end
      end

      def serialize
        JSON.generate(self)
      end
    end
  end
end
