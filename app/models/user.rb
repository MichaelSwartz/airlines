class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  # :omniauthable mount_uploader :profile_photo, ProfilePhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews
  has_many :airlines
  mount_uploader :profile_photo, ProfilePhotoUploader
  scope :ordered_by_admin_and_created_at, -> { order(admin: :desc, created_at: :asc) }

  def self.search(query)
    where("email ilike :q", q: "%#{query}%")
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
