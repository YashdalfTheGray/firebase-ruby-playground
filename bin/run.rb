require 'dotenv'
Dotenv.load

require 'playground/firebase_playground'

firebase_config = {
  project_id: ENV.PROJECT_ID
}

playground = Playground::FirebasePlayground.new firebase_config
