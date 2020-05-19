require 'test_helper'
require 'generators/add_cover/add_cover_generator'

class AddCoverGeneratorTest < Rails::Generators::TestCase
  tests AddCoverGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
