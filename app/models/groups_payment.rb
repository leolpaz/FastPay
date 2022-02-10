class GroupsPayment < ApplicationRecord
  belongs_to :group
  belongs_to :payment
  validates :group, presence: true
  validates :payment, presence: true
end
