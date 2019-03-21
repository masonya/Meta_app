class Document < ApplicationRecord
  belongs_to :user
  mount_uploader :cover, CoverUploader
  mount_uploader :image, ImageUploader
  validates :title, :body, :presence => true
  validates :title, :length => { :minimum => 2 }
  validates :title, :uniqueness => { :massage => "Already Taken" }
  #has_many :account_transfers, as: :transferable, foreign_key: "transferable_id", dependent: :destroy

  end
