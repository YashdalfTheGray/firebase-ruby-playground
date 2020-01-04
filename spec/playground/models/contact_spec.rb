# frozen_string_literal: true

require 'faker'
require 'json'

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

      it 'has the ability to be converted into a hash' do
        expect(test_contact.to_h).to have_key 'name'
        expect(test_contact.to_h).to have_key 'email'
        expect(test_contact.to_h).to have_key 'phone'
        expect(test_contact.to_h).to have_key 'id'
        expect(test_contact.to_h).to have_key 'created_at'
        expect(test_contact.to_h).to have_key 'updated_at'
      end

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

      it 'can be converted to valid json' do
        json_string = test_contact.serialize

        expect { JSON.parse(json_string) }.not_to raise_error
      end
    end
  end
end
