class Keep < ActiveRecord::Base
    
  belongs_to :user
  has_many :keepers, dependent: :destroy
  
  validates :title, length: { minimum: 1 }, presence: true 
end
