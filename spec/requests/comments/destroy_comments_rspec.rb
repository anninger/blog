require "spec_helper"

describe "Destroy comments" do
  let (:user) { create :user }
  let (:comment) { create :comment }

  before do
    sign_in_as(user)
    delete "/comments/#{comment.id}", format: :json
  end

  it "deleted a comment" do
    Comment.count.should == 0
  end
end
