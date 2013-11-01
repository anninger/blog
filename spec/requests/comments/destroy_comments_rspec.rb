require "spec_helper"

describe "Destroy comments" do
  let (:user) { create :user }
  let (:post) { create :post, user: user }
  let (:comment) { create :comment, post: post }

  before do
    sign_in_as(user)
    delete "/posts/#{post.id}/comments/#{comment.id}", format: :json
  end

  it "deleted a comment" do
    post.comments.count.should == 0
  end
end
