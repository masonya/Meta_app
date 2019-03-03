class Subscription < ApplicationRecord

  # belongs_to :user
  validates :title, :body, :password, :login, :presence => true
  validates :title, :length => { :minimum => 2 }
  validates :title, :uniqueness => { :massage => "Already Taken" }

  belongs_to :user

end
