class CommentsController < ApplicationController
  before_action :set_a_card,  only: :create

  def create
    @comment = @a_card.comments.new(comment_params)
    @q_card = @a_card.q_card
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(@q_card) }
        format.json
      end
    else
      @comment = @a_card.comments.includes(:user)
      render post_path(@q_card)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy if @comment.user_id == current_user.id
    redirect_to post_path(@comment.a_card.q_card.id)
  end

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, a_card_id: params[:a_card_id])
  end

  def set_a_card
    @a_card = ACard.find(params[:post_id])
  end
end
