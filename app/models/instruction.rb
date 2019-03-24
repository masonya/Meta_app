class Instruction < ApplicationRecord
  validates :title, :body, :presence => true
  validates :title, :length => { :minimum => 2 }
  validates :title, :uniqueness => { :massage => "Already Taken" }
  has_many :account_transfers, as: :transferable, dependent: :destroy
  belongs_to :user
end
