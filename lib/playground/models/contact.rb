# frozen_string_literal: true

require 'date'
require 'json'
require 'securerandom'
require 'uri'

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

      def name=(name)
        @name = name
        @updated_at = DateTime.now
      end

      def email=(email)
        raise ArgumentError, "invalid email provided: #{email}" if (email =~ URI::MailTo::EMAIL_REGEXP).nil?

        @email = email
        @updated_at = DateTime.now
      end

      def phone=(phone)
        @phone = phone
        @updated_at = DateTime.now
      end

      def to_h
        instance_variables.each_with_object({}) do |v, hash|
          name = v.to_s[1..-1]
          value = send(name)
          hash[name] = if value.is_a? DateTime
            value.iso8601(9)
          else
            value
          end
        end
      end

      def serialize
        JSON.generate(to_h)
      end
    end
  end
end
