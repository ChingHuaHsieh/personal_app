class ACard < ApplicationRecord
  belongs_to :user
  belongs_to :q_card
  has_many :comments, dependent: :destroy

  def nickname
    self.user.nickname
  end
end