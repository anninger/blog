require "spec_helper"

describe "create posts" do
  let(:user) { create :user }

  before do
    sign_in_as(user)
    post 'posts', { post: post_params }, format: :json
  end

  context "with valid params" do
    let(:post_params) { attributes_for :post }

    it "responds with a post" do
      expect(response.status).to eq(201)
    end
  end

  #context "with invalid params" do
    #let(:post) {}

    #it "responds with errors" do

    #end
  #end
end
