class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :airline

  validates :rating, presence: true
  validates :airline_id, presence: true
end
