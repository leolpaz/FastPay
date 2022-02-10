class Group < ApplicationRecord
  belongs_to :user
  has_many :groups_payments
  has_many :payments, through: :groups_payments
  validates :name, presence: true
  validates :icon, presence: true
end
