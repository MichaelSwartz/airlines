class Airline < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  validates :name, presence: true
  validates :name, uniqueness: true

  def self.search(query)
    where("name ilike :q or description ilike :q", q: "%#{query}%")
  end

  def default_img
    if logo_url.empty?
      self.logo_url = "https://s3.amazonaws.com/frqntflyr-production/uploads/admin/default+photo/frqntflyr.jpg"
      self.save
    end
  end

  def average_rating
    return 0 if reviews.empty?
    sum = reviews.all.inject(0) { |running_total, review| running_total += review.rating  }
    count = reviews.count
    sum.to_f / count
  end

  def self.sort_by_rating
    all.sort { |x, y| y.average_rating <=> x.average_rating }
  end
end
