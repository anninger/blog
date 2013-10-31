module DeviseTestHelper
  def sign_in_as(user)
    post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
  end

  def sign_out
    delete destroy_user_session_path
  end
end
