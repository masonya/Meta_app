class ResponsibilityTransfer < ApplicationRecord
  # belongs_to :transmitter, class_name: "User", foreign_key: "transmitter_id"
  # belongs_to :inheritor, class_name: "User", foreign_key: "inheritor_id", optional: true
  # belongs_to :r_transferable, polymorphic: true, optional: true
end
