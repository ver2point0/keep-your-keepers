class Keeper < ActiveRecord::Base
  
  belongs_to :keep
  has_many :likes, dependent: :destroy
  
  validates :url, length: { minimum: 1 }, presence: true 

end
