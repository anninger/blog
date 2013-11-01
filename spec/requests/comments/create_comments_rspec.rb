require "spec_helper"

describe "Create comments" do
  let (:user) { create :user }
  let (:test_post) { create :post, user: user }

  before do
    sign_in_as(user)

    post "comments", { comment: comment_params }, format: :json
  end

  context "with the right params" do
    let (:comment_params) { attributes_for(:comment) }

    it "responds with a comment" do
      expect(response.status).to eq(201)
    end

    it "responds with valid body" do
      pattern = {
        comment: {
          id: Integer,
          content: String,
          post_id: Integer,
          created_at: String,
          updated_at: String
        }
      }

      response.body.should match_json_expression(pattern)
    end
  end
end
