class Airline < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  validates :name, presence: true
  validates :name, uniqueness: true

  def self.search(query)
    where("name @@ plainto_tsquery(?)", query)
    #
    # search_condition = "%" + query + "%"
    # find(:all, conditions: ['name ILIKE ?', search_condition])
  end
end
