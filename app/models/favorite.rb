class Favorite < ApplicationRecord
  belongs_to :user
  validates :uri, uniqueness: true
end
