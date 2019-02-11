class SocialAccount < ApplicationRecord

  # belongs_to :user
  validates :title, :body, :presence => true
  validates :login, :presence => true
  validates :password, :presence => true

  belongs_to :user

end
