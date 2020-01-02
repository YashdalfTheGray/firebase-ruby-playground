# frozen_string_literal: true

require 'faker'

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
    end
  end
end
