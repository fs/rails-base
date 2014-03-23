require 'spec_helper'

describe PostsController do
  let!(:user) { create :user, :confirmed }
  let(:post_object) { create :post }
  let(:posts) { [] }
  let(:post_params) { attributes_for(:post).slice(:title, :content) }

  before do
    sign_in(user)

    controller.stub(:post) { post_object }
    posts.stub(:where) { posts }
    posts.stub(:find) { post_object }
    Post.stub(:scoped) { posts }
  end

  describe 'GET #index' do
    let(:posts) { [post_object] }
    before do
      get 'index'
    end

    it 'renders index template' do
      expect(response).to render_template :index
    end

    it 'assigns posts' do
      expect(controller.posts).to eq([post_object])
    end
  end

  describe 'POST #create' do
    before do
      post 'create',
        post: post_params
    end

    it 'redirects to new post' do
      expect(response).to redirect_to Post.last
    end
  end

  describe 'GET #new' do
    before do
      get 'new',
        id: post_object.id
    end

    it 'renders new template' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before do
      get 'edit',
        id: post_object.id
    end

    it 'renders edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do
    before do
      get 'show',
        id: post_object.id
    end

    it 'renders show template' do
      expect(response).to render_template :show
    end
  end

  describe 'PUT #update' do
    let!(:post_params) do
      attributes_for(
        :post,
          title: "Awesome",
          content: "Post"
      )
    end

    before do
      put 'update',
        id: post_object.id,
        post: post_params
    end

    it 'assigns posts' do
      expect(controller.posts).to eq([post_object])
    end

    it 'changes contact attributes' do
      expect(post_object.reload.title).to eq("Awesome")
      expect(post_object.reload.content).to eq("Post")
    end

    it 'redirects to the updated post' do
      expect(response).to redirect_to post_object
    end
  end

  describe 'DELETE #destroy' do
    let(:posts) { [post_object] }

    before do
      delete 'destroy',
        id: post_object.id
    end

    it 'redirects to all posts' do
      expect(response).to redirect_to posts
    end

    it 'not assigns posts' do
      expect(controller.posts).not_to include(post_object)
    end
  end
end
