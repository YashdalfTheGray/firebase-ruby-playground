require 'dotenv'
Dotenv.load

require "google/cloud/firestore"

module Playground
  class FirebasePlayground
    def initialize(config)
      @firestore = Google::Cloud::Firestore.new project_id: config.project_id
    end
  end
end