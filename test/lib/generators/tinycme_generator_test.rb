require 'test_helper'
require 'generators/tinycme/tinycme_generator'

class TinycmeGeneratorTest < Rails::Generators::TestCase
  tests TinycmeGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
