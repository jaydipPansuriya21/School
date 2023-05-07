class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :active, :created_at_date
  has_many :tutors

  def created_at_date
    object.created_at.to_date.to_s
  end
end
