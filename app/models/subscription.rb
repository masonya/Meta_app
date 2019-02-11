class Subscription < ApplicationRecord

  # belongs_to :user
  validates :title, :body, :presence => true
  validates :title, :length => { :minimum => 2 }
  validates :title, :uniqueness => { :massage => "Already Taken" }
  validates :login, :presence => true
  validates :password, :presence => true


  belongs_to :user

end
