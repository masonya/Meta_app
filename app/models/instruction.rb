class Instruction < ApplicationRecord
  # belongs_to :user
  validates :title, :body, :presence => true
  validates :title, :length => { :minimum => 2 }
  validates :title, :uniqueness => { :massage => "Already Taken" }
end
