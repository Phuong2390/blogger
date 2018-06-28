class CommentsController < ApplicationController
    before_filter :get_parent
    def new
        @comment = @parent.comments.build
    end
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:name, :content))
        redirect_to post_path(@post)
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end
    protected
   
    def get_parent
    @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
     
    redirect_to root_path unless defined?(@parent)
  end
end
