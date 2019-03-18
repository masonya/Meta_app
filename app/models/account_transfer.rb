class AccountTransfer < ApplicationRecord
  belongs_to :transmitter, class_name: "User", foreign_key: "transmitter_id"
  belongs_to :inheritor, class_name: "User", foreign_key: "inheritor_id", optional: true

  belongs_to :social_account, foreign_key: "transferable_id", dependent: :destroy

  # belongs_to :transferable, polymorphic: true
  # belongs_to :social_account, as: :transferable
end
