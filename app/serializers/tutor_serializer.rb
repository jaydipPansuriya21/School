class TutorSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :phone_number
  belongs_to :course
  
  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
