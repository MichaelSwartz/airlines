class Airline < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  validates :name, presence: true
  validates :name, uniqueness: true

  def self.search(query)
    where("name ilike :q or description ilike :q", q: "%#{query}%")
  end
  def default_img
    if self.logo_url.empty?
      self.logo_url = "https://s3.amazonaws.com/frqntflyr-production/uploads/admin/default+photo/frqntflyr.jpg"
      self.save
    end
  end
end
