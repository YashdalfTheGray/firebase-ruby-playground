# frozen_string_literal: true

require 'dotenv'
Dotenv.load

require 'google/cloud/firestore'

require_relative 'firestore_mixin'

module Playground
  # FirebasePlayground holds a firestore reference and is able to
  # act on it.
  class FirebasePlayground
    include FirestoreMixin

    # creates a new instance of the FirebasePlayground. Proper access is
    # required to interact with the project
    #
    # @param config [Hash{String=>String}] the config to pass to firebase.
    #   So far, config only has 1 valid property, `:project_id`,
    #   which is the project id for the firebase database you want to access
    def initialize(config)
      raise ArgumentError, 'the config provided is not valid' unless config_valid?(config)

      @firestore = Google::Cloud::Firestore.new project_id: config[:project_id]
    end

    private

    # validates a configuration passed to the constructor
    #
    # @param config [Hash{String=>String}] the config to validate
    def config_valid?(config)
      valid_keys = ['project_id']

      return false if config.keys.empty? || config.keys.length != valid_keys.length

      valid_keys.reduce(true) do |valid, key|
        valid && config.key?(key.to_sym)
      end
    end
  end
end
