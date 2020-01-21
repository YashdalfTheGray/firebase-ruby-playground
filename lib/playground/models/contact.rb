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

      # Creates a new contact object
      #
      # @param name [String] the name of the contact
      # @param email [String] the email of the contact
      # @param phone [String] the phone number of the contact
      # @return [Contact] a new contact with the given information
      def initialize(name, email, phone)
        @id = SecureRandom.uuid
        @created_at = DateTime.now
        @updated_at = DateTime.now

        validate_email email

        @name = name
        @email = email
        @phone = phone
      end

      def name=(name)
        @name = name
        @updated_at = DateTime.now
      end

      def email=(email)
        validate_email email

        @email = email
        @updated_at = DateTime.now
      end

      def phone=(phone)
        validate_phone phone

        @phone = phone
        @updated_at = DateTime.now
      end

      # returns a hash representation of the contact so
      # that it can be serialized
      #
      # @return [Hash{String=>String}] a hash with all the
      #   properties from the contact
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

      # returns a JSON string representation of the contact
      # @see #to_h
      #
      # @return [String] the JSON string that represents
      #   this contact
      def serialize
        JSON.generate(to_h)
      end

      def self.deserialize(json_string)
        details = JSON.parse(json_string)

        validate(details)

        contact = new(details['name'], details['email'], details['phone'])
        contact.instance_variable_set('@id', details['id'])
        contact.instance_variable_set('@created_at', DateTime.parse(details['created_at']))
        contact.instance_variable_set('@updated_at', DateTime.parse(details['updated_at']))

        contact
      end

      def self.validate(json_hash)
        %w[name email phone id created_at updated_at].each do |key|
          raise ArgumentError, "cannot deserialize given object, missing key #{key}" unless json_hash.key? key
        end

        true
      end

      private

      def validate_email(email)
        raise ArgumentError, "invalid email provided: #{email}" if (email =~ URI::MailTo::EMAIL_REGEXP).nil?

        true
      end

      def validate_phone(phone)
        phone_regex = /(?:\+1-)?\(?\d{3}(?:\)|-)?\d{3}-?\d{4}/
        raise ArgumentError, "invalid phone provided: #{phone}" if (phone =~ phone_regex).nil?

        true
      end
    end
  end
end
