class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true
  has_many :tweets, class_name: "TweetContent", inverse_of: :user

  def follow(user_id)
    Follow.create(followed_by: id, followed_to: user_id)
  end

  def unfollow(user_id)
    Follow.find_by(followed_by: id, followed_to: user_id).destroy
  end

  def followed?(user_id)
    Follow.find_by(followed_by: id, followed_to: user_id).present?
  end

  def followers
    user_ids = Follow.where(followed_to: id).pluck(:followed_by)
    User.where(id: user_ids)
  end

  def followings
    user_ids = Follow.where(followed_by: id).pluck(:followed_to)
    User.where(id: user_ids)
  end
end
