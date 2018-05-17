require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valaki = users(:two)
  end

  test "login" do
    post "http://localhost:3000#{login_path}", params: { email: @valaki.email, password: 'titok'}, as: :html,
         headers: { "HTTP_REFERER": "http://localhost:3000#{welcome_path}" }
    assert_response :redirect
    follow_redirect!
    assert_equal @valaki.id, session[:user]
    assert_select 'div#content'
  end

  test "logout" do
    post "http://localhost:3000#{login_path}", params: { email: @valaki.email, password: 'titok'},
         headers: { "HTTP_REFERER": "http://localhost:3000#{welcome_path}" }
    assert_equal @valaki.id, session[:user]
    get "http://localhost:3000#{logout_path}"
    assert_response :redirect
    follow_redirect!
    assert_select "h1", "Welcome"
    assert_nil session[:user]
  end
end
