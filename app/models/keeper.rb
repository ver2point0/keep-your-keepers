class Keeper < ActiveRecord::Base
  
  belongs_to :keep
  
  validates :url, length: { minimum: 1 }, presence: true 
end
