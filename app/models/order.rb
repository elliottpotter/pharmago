class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :driver, optional: true
  has_many :order_products, inverse_of: :order
  has_many :products, through: :order_products

  monetize :amount_cents

  accepts_nested_attributes_for :order_products

  include AASM

  aasm do
    state :unclaimed, initial: true
    state :claimed
    state :shopping
    state :processed
    state :delivered

    event :unclaim do
      transitions from: [ :claimed, :shopping, :processed, :delivered, :unclaimed ], to: :unclaimed
    end

    event :claim do
      transitions from: :unclaimed, to: :claimed
    end

    event :shop do
      transitions from: :claimed, to: :shopping
    end

    event :process do
      transitions from: :shopping, to: :processed
    end

    event :deliver do
      transitions from: :processed, to: :delivered
    end

  end

end
