class Book < ApplicationRecord
  
  belongs_to :user
  
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, length: { maximum: 200 }, presence: true
end
