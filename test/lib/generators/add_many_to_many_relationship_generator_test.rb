require 'test_helper'
require 'generators/add_many_to_many_relationship/add_many_to_many_relationship_generator'

class AddManyToManyRelationshipGeneratorTest < Rails::Generators::TestCase
  tests AddManyToManyRelationshipGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
