class Record < ApplicationRecord

  validates :title, presence: true
  validates :date, presence: true
  validates :amount, presence: true

end
