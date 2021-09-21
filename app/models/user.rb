class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum is_active: { 有効: true, 退会: false }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, dependent: :destroy
         has_many :post_comments, dependent: :destroy
         has_many :favorites, dependent: :destroy

         enum sex: { man: 0, woman: 1}
         attachment :image

         def active_for_authentication?
           super && (self.is_active == "有効")
         end


end
