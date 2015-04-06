class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :airlines

  def self.admins
    User.where(admin: true)
  end

  def self.non_admins
    User.where(admin: false)
  end

  def reviews_by_airline
    reviews_hash = Hash.new

    self.reviews.each do |review|
      if reviews_hash.has_key?(review.airline)
        reviews_hash[review.airline] << review
      else
        reviews_hash[review.airline] = [review]
      end
    end

    reviews_hash
  end
end
