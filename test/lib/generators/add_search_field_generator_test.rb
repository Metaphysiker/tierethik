require 'test_helper'
require 'generators/add_search_field/add_search_field_generator'

class AddSearchFieldGeneratorTest < Rails::Generators::TestCase
  tests AddSearchFieldGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
