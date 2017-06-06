class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy, :new, :like]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.page(params[:page]).per(10).order(views: :desc)
  end

  def show
    @post = set_post
    @post.views = @post.views + 1
    @post.save!
    @comments = Comment.where(post_id: @post.id).order(:created_at).page(params[:page]).per(5)
    @comment = Comment.new
    @comment.post = @post
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end
  
  def like
    @post = set_post
    @post.likes = @post.likes + 1
    @post.save!
  end
  
  def dislike
    @post = set_post
    @post.likes = @post.likes - 1
    @post.save!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
