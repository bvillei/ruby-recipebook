require 'test_helper'

class EditUserProfileTest < ActionDispatch::IntegrationTest
  setup do
    @valaki = users(:two)
    @recipe = recipes(:two)
  end

  test "upload attachment for user profile" do
    get welcome_path
    assert_response :success
    assert_select 'legend', 'Login'

    post login_path, params: {email: @valaki.email, password: 'titok'},
         headers: {"HTTP_REFERER": "http://localhost:3001#{welcome_path}"}
    assert_equal session[:user], @valaki.id
    assert_response :redirect

    get edit_recipe_path(@recipe.id)
    assert_response :success

    upload_file = fixture_file_upload('test/fixtures/files/burger.jpg', 'image/jpg')
    put '/recipes/456',
        params: {recipe:
                     {name: '', category: '', ingredients: '', description: '',
                      attachment: upload_file}
        }
    assert File.exists? Rails.root.join("public", "data", @recipe.attachment.id.to_s)

  end
end
