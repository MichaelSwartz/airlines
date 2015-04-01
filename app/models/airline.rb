class Airline < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  validates :name, presence: true
  validates :name, uniqueness: true
end
