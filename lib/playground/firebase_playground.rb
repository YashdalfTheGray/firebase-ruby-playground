# frozen_string_literal: true

require 'dotenv'
Dotenv.load

require 'google/cloud/firestore'

module Playground
  # FirebasePlayground holds a firestore reference and is able to
  # act on it.
  class FirebasePlayground
    def initialize(config)
      @firestore = Google::Cloud::Firestore.new project_id: config[:project_id]
    end
  end
end
