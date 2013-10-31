require "spec_helper"

describe "update a post" do
  let (:user) { create :user }
  let (:post) { create :post, user: user }
  let (:post_attributes) {{ title: "a very important post" }}

  before do
    sign_in_as(user)
    put "/posts/#{post.id}", post: post_attributes, format: :json
  end

  context "by the user" do
    it 'responds with valid body' do
      pattern = {
        post: {
          id: Integer,
          title: "a very important post",
          body: String,
          user_id: user.id,
          created_at: String,
          updated_at: String 
        }
      }
      response.body.should match_json_expression(pattern)
    end

  end
end
