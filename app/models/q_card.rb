class QCard < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :language

  belongs_to :user
  has_many :a_cards, dependent: :destroy
end
