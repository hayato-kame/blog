class Entry < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 80 }
  validates :body, presence: true
  
end
