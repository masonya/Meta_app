class AccountTransfer < ApplicationRecord
  belongs_to :transmitter, class_name: "User", foreign_key: "transmitter_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  belongs_to :transferable, polymorphic: true
end
