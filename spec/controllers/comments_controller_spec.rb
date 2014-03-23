require 'spec_helper'

describe CommentsController do
  let!(:user) { create :user, :confirmed }
  let(:post_object) { create :post }
  let(:comment) { create :comment, post_id: post_object.id }
  let(:comment_params) { attributes_for(:comment).slice(:title, :text) }

  before do
    sign_in(user)

    controller.stub(:post) { post_object }
    controller.stub(:comment) { comment }
  end

  describe 'POST #create' do
    before do
      post 'create',
      post_id: post_object.id,
        comment: comment_params
    end

    it 'redirects to post page' do
      expect(response).to redirect_to post_object
    end
  end

  describe 'DELETE #destroy' do

    before do
      allow(comment).to receive(:delete)

      delete 'destroy',
        post_id: post_object.id,
        id: comment.id
    end

    it 'redirects to post page' do
      expect(response).to redirect_to post_object
    end

    it 'removes a comment' do
      expect(comment).to have_received(:delete)
    end
  end
end
