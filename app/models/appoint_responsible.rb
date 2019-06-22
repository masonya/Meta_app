class AppointResponsible < ApplicationRecord

  belongs_to :transmitter, class_name: "User", foreign_key: "transmitter_id", optional: true
  belongs_to :inheritor, class_name: "User", foreign_key: "inheritor_id", optional: true
  validates :inheritor_email, presence: true
  # validates :file, presence: true, on: :update


  # belongs_to :user
  # has_many :responsibility_transfers, as: :r_transferable, dependent: :destroy
end
