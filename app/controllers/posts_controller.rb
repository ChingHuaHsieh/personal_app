class PostsController < ApplicationController
  
  before_action :authenticate_user!
    
  def index
    @q_cards_mother_language = QCard.includes(:user).where(language_id: current_user.mother_language.id).order("id DESC")
    @q_cards_same = QCard.includes(:user).where(language_id: current_user.learning_language.id).order("id DESC")
  end

  def new
    @q_card = QCard.new
  end

  def create
    @q_card = QCard.new(q_card_params)
    if @q_card.save
      redirect_to user_info_post_path(current_user.id)
    else
      render new_post_path unless @q_card.valid?
    end
  end

  def edit
  end

  def destroy
    @q_card = QCard.find(params[:id])
    @q_card.destroy if @q_card.user_id == current_user.id
    redirect_to action: 'index'
  end

  def update
  end

  def show
    @q_card = QCard.find(params[:id])
    @a_cards = @q_card.a_cards.includes(:user, :comments)
    @a_card = @q_card.a_cards.new
    @comment = Comment.new
  end

  def a_card_create
    @q_card = QCard.find(params[:id])
    @a_card = @q_card.a_cards.new(a_card_params)
    if @a_card.save
      redirect_to action: 'show'
    else
      render action: 'show' unless @a_card.valid?
    end
  end

  def user_info
    @user = User.find(params[:id])
    @q_cards = @user.q_cards.order("id DESC")
    @q_cards_for_answer = QCard.joins(:a_cards).where(a_cards: {user_id: current_user.id}).order("id DESC").uniq
  end

  private
  def q_card_params
    params.require(:q_card).permit(
      :language_id,
      :theme,
      :description,
      :m_description
      ).merge(user_id: current_user.id)
  end

  def a_card_params
    params.require(:a_card).permit(
      :description,
      :when_to_use1,
      :when_to_use2,
      :when_to_use3,
      :when_to_use4,
      :when_to_use5,
      :relation1_description,
      :relation1_when_to_use1,
      :relation1_when_to_use2,
      :relation1_when_to_use3,
      :relation2_description,
      :relation2_when_to_use1,
      :relation2_when_to_use2,
      :relation2_when_to_use3,
      :relation3_description,
      :relation3_when_to_use1,
      :relation3_when_to_use2,
      :relation3_when_to_use3
      ).merge(q_card_id: params[:q_card_id], user_id: current_user.id)
  end
end
