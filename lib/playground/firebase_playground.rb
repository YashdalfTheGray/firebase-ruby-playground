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
      @firestore = Google::Cloud::Firestore.new project_id: config[:project_id]
    end
  end
end
