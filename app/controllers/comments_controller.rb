class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:destroy]

  def index
    @comments = Comment.all.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @comment.post, notice: 'Comment was successfully created.'
    else
      redirect_to @comment.post
    end

  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.post, notice: 'Comment was successfully updated.'
    else
      redirect_to @comment.post
    end
  end

  def destroy
    @post = @comment.post
    @comment.destroy
    redirect_to @post, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
