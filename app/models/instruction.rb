class Instruction < ApplicationRecord
  
  validates :title, :body, :presence => true
  validates :title, :length => { :minimum => 2 }
  validates :title, :uniqueness => { :massage => "Already Taken" }

  belongs_to :user
end
