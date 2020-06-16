require 'test_helper'

class DebateAVeganControllerTest < ActionDispatch::IntegrationTest
  test "should get debate" do
    get debate_a_vegan_debate_url
    assert_response :success
  end

end
