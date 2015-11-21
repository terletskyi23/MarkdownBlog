class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params.merge(user_id: current_user.id)) 
    
    if @comment.save 
      redirect_to :back, notice: "Your comment was added"
    else 
      redirect_to :back, alert: "ERROR: For some reason we can't save your comment"
    end 
  end

  def destroy
  	Comment.find(params[:id]).destroy
    redirect_to :back, notice: "Your comment was deleted"
  end

  private 
  def comment_params 
    params.permit(:post_id, :body) 
  end
end
