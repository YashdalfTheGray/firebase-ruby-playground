# frozen_string_literal: true

require 'dotenv'
Dotenv.load

require 'pry'

firebase_config = {
  project_id: ENV['PROJECT_ID'],
}

require_relative '../lib/playground/firebase_playground'
require_relative '../lib/playground/models/contact.rb'

binding.pry # rubocop:disable Lint/Debugger
