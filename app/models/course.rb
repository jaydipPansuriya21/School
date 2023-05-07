class Course < ApplicationRecord
  has_many :tutors, dependent: :destroy
  accepts_nested_attributes_for :tutors

  validates :code, uniqueness: true, presence: true
  validates :name, presence: true
end
