class Tutor < ApplicationRecord
  belongs_to :course
  validates :phone_number, uniqueness: true, presence: true
  validates :first_name, presence: true
end
