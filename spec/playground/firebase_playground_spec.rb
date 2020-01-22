# frozen_string_literal: true

require 'playground/firebase_playground'

module Playground
  describe FirebasePlayground, unless: ENV['CI'] == 'true' do
    it 'news up a new playground' do
      playground = FirebasePlayground.new(project_id: ENV['project_id'])
      expect(playground).to be_truthy
    end
  end

  describe "#{FirebasePlayground} validation" do
    it 'raises an error for an invalid property name' do
      expect { FirebasePlayground.new(stuff: 'things') }.to raise_error ArgumentError
    end

    it 'raises an error for an empty config' do
      expect { FirebasePlayground.new }.to raise_error ArgumentError
    end

    it 'raises an error for a config that has additional properties' do
      config = { project_id: ENV['project_id'], test_key: 'test' }
      expect { FirebasePlayground.new config }.to raise_error ArgumentError
    end
  end
end
