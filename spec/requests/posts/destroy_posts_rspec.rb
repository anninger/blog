require "spec_helper"

describe "Destroying post" do
  let (:user) { create :user }
  let (:post) { create :post, user: user }

  before do
    sign_in_as(user)
    delete "/posts/#{post.id}", format: :json
  end

  it "deleted post" do
    Post.count.should == 0
  end
end
