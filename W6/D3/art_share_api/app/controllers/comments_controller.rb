class CommentsController < ApplicationController

  # def index
  #   if !params.has_key?(:comment)
  #     comments = Comment.all
  #   elsif comment_params[:user_id].nil? && comment_params[:artwork_id]
  #     comments = Comment.where(artwork_id: comment_params[:artwork_id])
  #   elsif comment_params[:user_id] && comment_params[:artwork_id].nil?
  #     comments = Comment.where(user_id: comment_params[:user_id])
  #   end
  #   render json: comments
  # end
  
  def index
    comments = 
      Comment.where(artwork_id: params[:artwork_id])
      .or(Comment.where(user_id: params[:user_id]))

    render json: comments
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: 422
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end
  
  
  private
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end

end