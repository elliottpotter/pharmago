class Prescription < ApplicationRecord
  belongs_to :customer

  validates :interval, inclusion: { in: [ "weekly", "monthly", "bimonthly", "yearly" ] }
end
