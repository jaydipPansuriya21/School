require 'rails_helper'

RSpec.describe Course, type: :model do
  before(:each) do
    @course = create(:course)
  end

  # test all validations for course model.
  describe 'validations' do
    it "is valid with valid attributes" do 
      expect(@course).to be_valid
    end

    it "is not valid without a code" do 
      @course.code = nil
      expect(@course).to be_invalid
    end

    it "is not valid without a name" do
      @course.name = nil
      expect(@course).to be_invalid
    end

    it "is not valid with duplicate code" do
      course_one = Course.create(name: "Networking", code: "NW901") # Create course with code and name.
      @course.code = course_one.code # Use old course's code for new course.
      expect(@course).to be_invalid
    end
  end

  # test associations of course model.
  describe 'associations' do
    it 'has many tutors' do
      association = described_class.reflect_on_association(:tutors)
      expect(association.macro).to eq(:has_many)
    end
  end
end
