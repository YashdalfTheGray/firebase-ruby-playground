# frozen_string_literal: true

require 'playground/firebase_playground'

module Playground
  describe FirebasePlayground, unless: ENV['CI'] == 'true' do
    it 'news up a new playground' do
      playground = FirebasePlayground.new(project_id: ENV['project_id'])
      expect(playground).to be_truthy
    end
  end
end
