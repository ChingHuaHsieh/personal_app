class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :mother_language
  belongs_to_active_hash :learning_language

  has_one_attached :image
  has_many :a_cards
  has_many :q_cards
  has_many :comments

end
