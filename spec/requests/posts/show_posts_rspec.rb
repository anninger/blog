require "spec_helper"

describe "show post" do
  let (:user) { create :user }
  let (:post) { create :post, user: user }

  before do
    sign_in_as(user)
    get "/posts/#{post.id}", format: :json
  end

  context "by a guest" do
    it "responds with valid body" do
      pattern = {
        post: {
          id: post.id,
          title: String,
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
