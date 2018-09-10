require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  require 'test_helper'

  class UsersSignupTest < ActionDispatch::IntegrationTest

    test "valid signup information" do
      get signup_path
      # assert_no_difference 'User.count' do
      assert_difference 'User.count', 1 do
        post signup_path, params: { user: { name:  "Example User",
                                           email: "user@example.com",
                                           password:              "password",
                                           password_confirmation: "password" } }
      end
      follow_redirect!
      assert_template 'users/show'
      assert_not flash.empty?
      # assert_select 'div#error_explanation', 'The form contains 4 errors.'
      # assert_select 'div.alert', 'The form contains 4 errors.'
      # assert_select "form[action=?]", signup_path
    end
  end
end
