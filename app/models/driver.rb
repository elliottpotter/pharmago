class Driver < ApplicationRecord
  belongs_to :user
  has_many :orders

  include AASM

  aasm :column => :status do
    state :inactive, :initial => true
    state :active

    event :activate do
      transitions :from => :inactive, :to => :active
    end

    event :deactivate do
      transitions :from => :active, :to => :inactive
    end

  end

  aasm :column => :verification_status do
    state :unverified, :initial => true
    state :verified

    event :verify do
      transitions :from => :unverified, :to => :verified
    end

  end
end
