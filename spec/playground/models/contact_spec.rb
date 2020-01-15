# frozen_string_literal: true

require 'faker'
require 'json'
require 'date'
require 'securerandom'

require 'playground/models/contact'

module Playground
  module Models
    describe Contact do
      let(:test_contact) do
        Contact.new(
          Faker::Name.name,
          Faker::Internet.email,
          Faker::PhoneNumber.cell_phone
        )
      end

      it 'creates a new contact' do
        expect(test_contact.name).to be_a(String)
        expect(test_contact.email).to be_a(String)
        expect(test_contact.phone).to be_a(String)
        expect(test_contact.created_at).to be_a(DateTime)
        expect(test_contact.updated_at).to be_a(DateTime)
      end

      context 'properties' do
        it 'tracks the updated datetime when updating name' do
          original_update_time = test_contact.updated_at
          sleep 0.01 # so that udpate times are different
          test_contact.name = 'Guybrush Threepwood'
          expect(test_contact.name).to eq 'Guybrush Threepwood'
          expect(test_contact.updated_at).to happen_after original_update_time
        end

        it 'tracks the updated datetime when updating email' do
          original_update_time = test_contact.updated_at
          sleep 0.01 # so that udpate times are different
          test_contact.email = 'guybrush@threepwood.io'
          expect(test_contact.email).to eq 'guybrush@threepwood.io'
          expect(test_contact.updated_at).to happen_after original_update_time
        end

        it 'throws an error if given an incorrect email format' do
          expect { test_contact.email = 'stuff' }.to raise_error ArgumentError
        end

        it 'tracks the updated datetime when updating phone' do
          original_update_time = test_contact.updated_at
          sleep 0.01 # so that udpate times are different
          test_contact.phone = '888-867-5309'
          expect(test_contact.phone).to eq '888-867-5309'
          expect(test_contact.updated_at).to happen_after original_update_time
        end
      end

      context 'serialization' do
        it 'has the ability to be converted into a hash' do
          expect(test_contact.to_h).to have_key 'name'
          expect(test_contact.to_h).to have_key 'email'
          expect(test_contact.to_h).to have_key 'phone'
          expect(test_contact.to_h).to have_key 'id'
          expect(test_contact.to_h).to have_key 'created_at'
          expect(test_contact.to_h).to have_key 'updated_at'
        end

        it 'can be converted to valid json' do
          json_string = test_contact.serialize

          expect { JSON.parse(json_string) }.not_to raise_error
          expect(JSON.parse(json_string)).to eq test_contact.to_h
        end
      end

      context 'deserialization' do
        it 'validation returns true for a hash that can be deserialized' do
          hash_to_test = {
            'name' => 'stuff',
            'phone' => '888-867-5309',
            'email' => 'stuff@foo.com',
            'id' => SecureRandom.uuid,
            'created_at' => DateTime.now.iso8601(9),
            'updated_at' => DateTime.now.iso8601(9),
          }

          expect(Contact.validate(hash_to_test)).to eq true
        end

        it 'raises an error for a hash that cannot be deserialized' do
          hash_to_test = {
            'name' => 'stuff',
            'phone' => '888-867-5309',
            'email' => 'stuff@foo.com',
            'id' => SecureRandom.uuid,
          }

          expect { Contact.validate(hash_to_test) }.to raise_error ArgumentError
        end
      end
    end
  end
end
