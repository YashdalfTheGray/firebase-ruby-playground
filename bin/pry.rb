# frozen_string_literal: true

require 'dotenv'
Dotenv.load

require 'pry'

require_relative '../lib/playground/firebase_playground.rb'

binding.pry # rubocop:disable Lint/Debugger
