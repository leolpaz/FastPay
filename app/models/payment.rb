class Payment < ApplicationRecord
  attribute :amount, :money
  belongs_to :author, class_name: 'User'
  has_many :groups_payments
  has_many :groups, through: :groups_payments
  validates :name, presence: true
  validates :amount, presence: true
end
