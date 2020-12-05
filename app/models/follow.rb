class Follow < ApplicationRecord
  validates :followed_by, presence: true
  validates :followed_to, presence: true
end
