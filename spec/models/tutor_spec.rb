require 'rails_helper'

RSpec.describe Tutor, type: :model do
  before(:each) do
    @tutor = create(:tutor)
  end

  # test all validations for tutor model.
  describe 'validations' do
    it "is valid with valid attributes" do 
      expect(@tutor).to be_valid
    end

    it "is not valid without a first_name" do 
      @tutor.first_name = nil
      expect(@tutor).to be_invalid
    end

    it "is not valid without a phone_number" do
      @tutor.phone_number = nil
      expect(@tutor).to be_invalid
    end

    it "is not valid with a duplicate phone_number" do
      course = Course.create(name: "Networking", code: "NW901")
      tutor_one = Tutor.create(first_name: "Rahul", phone_number: "9980197812", course_id: course.id) # Create Tutor with phone_number.
      @tutor.phone_number = tutor_one.phone_number # Use old tutor's phone_number for new tutor.
      expect(@tutor).to be_invalid
    end
  end

  # test associations of tutor model.
  describe 'associations' do
    it 'belongs to course' do
      association = described_class.reflect_on_association(:course)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
