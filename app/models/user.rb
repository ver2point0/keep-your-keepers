class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :keeps, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  def liked(keeper)
    likes.where(keeper_id: keeper.id).first
  end
end
