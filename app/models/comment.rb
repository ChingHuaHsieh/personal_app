class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :a_card
end
