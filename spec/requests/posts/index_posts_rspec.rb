require "spec_helper"

describe "list all the posts" do
  let (:user) { create :user }

  before do
    3.times { create(:post, user: user) }
    sign_in_as(user)
    get '/posts'
  end

  it "responds with valid body" do
    post_pattern = {
      id: Integer,
      title: String,
      body: String,
      user_id: Integer,
      tag_list: String,
      created_at: String,
      updated_at: String
    }

    pattern = {
      meta: { total: 3 },
      posts: [
        post_pattern,
        post_pattern,
        post_pattern
      ]
    }

    response.body.should match_json_expression(pattern)
  end
end
