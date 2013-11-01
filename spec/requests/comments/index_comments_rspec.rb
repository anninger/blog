require "spec_helper"

describe "List all the comments for the Post" do
  let (:user) { create :user }

  before do
    3.times { create(:comment) }
    sign_in_as(user)
    get "/comments"
  end

  it "responds with valid body" do
    comment_pattern = {
      id: Integer,
      content: String,
      post_id: Integer,
      created_at: String,
      updated_at: String
    }

    pattern = {
      meta: { total: 3 },
      comments: [
        comment_pattern,
        comment_pattern,
        comment_pattern
      ]
    }

    response.body.should match_json_expression(pattern)
  end
end
