class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :vote, numericality: { greater_than_or_equal_to: -1 }
  validates :vote, numericality: { less_than_or_equal_to: 1 }

 end
