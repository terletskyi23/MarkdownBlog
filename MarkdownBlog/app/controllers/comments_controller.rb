class CommentsController < ApplicationController
  def post_comment
    @user_id = current_user.id # before_action :authenticate_user, only: [:likes]
    @body = params[:body]
    @post_id = params[:post_id]

    #comment_params ???????????

    @comment = Comment.new(:body => @body, :user_id => @user_id, :post_id => @post_id) 
    
    if @comment.save 
      redirect_to :back, notice: "Your comment was added"
    else 
      redirect_to :back, alert: "ERROR: For some reason we can't save your comment"
    end 
  end

  def remove_comment
  	Comment.find(params[:id]).destroy

    #flash[:success] = "post was deleted"
    redirect_to :back, notice: "Your comment was deleted"
  end

  private 
  def comment_params 
    params.require(:comment).permit(:post_id, :body) 
  end
end
