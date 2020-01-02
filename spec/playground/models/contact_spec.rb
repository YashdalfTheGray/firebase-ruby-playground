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
    end
  end
end
