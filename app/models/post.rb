class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image

  validates :title, presence: true
  validates :review, presence: true, length: { maximum: 200 }

  def favorited_by?(user)
    self.favorites.where(user_id: user.id).exists?
  end


end
