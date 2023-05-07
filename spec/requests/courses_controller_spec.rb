RSpec.describe 'Course', type: :request do
  describe 'GET /courses' do
    before do
      FactoryBot.create_list(:course, 10)
      get '/api/v1/courses'
    end
    
    it 'returns all Courses present in system' do
      expect(JSON.parse(response.body).size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /tutors' do
    before do
      FactoryBot.create_list(:tutor, 10)
      get '/api/v1/tutors'
    end
    
    it 'returns all Tutors present in system' do
      expect(JSON.parse(response.body).size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /courses" do
    context "with valid parameters" do
      let(:valid_params) { { name: "Mathematics", code: "MATH101", active: true, "tutors_attributes": [{ "first_name": "vinay", "last_name": "shah", "phone_number": "9889176210" }] }}

      it "creates a new course and it's tutor" do
        expect {
          post '/api/v1/courses', params: { course: valid_params }
        }.to change(Course, :count).by(1).and(change(Tutor, :count).by(1))
      end

      it "returns the newly created course" do
        post '/api/v1/courses', params: { course: valid_params }

        expect(response).to have_http_status(:success)

        created_course = Course.last
        response_body = JSON.parse(response.body)
        expected_response_body = ActiveModelSerializers::SerializableResource.new(created_course).as_json.deep_stringify_keys

        expect(response_body).to eq(expected_response_body)
      end
    end

    context "with invalid parameters" do
      let(:invalid_params) { { name: "", code: "", active: true } }

      it "does not create a new course" do
        expect {
          post '/api/v1/courses', params: { course: invalid_params }
        }.to_not change(Course, :count)
      end

      it "returns the errors" do
        post '/api/v1/courses', params: { course: invalid_params }
        course = Course.new 
        course.save
        
        response_body = JSON.parse(response.body)
        expected_errors_message = { "errors": course.errors.full_messages }.deep_stringify_keys
        
        expect(response).to have_http_status(422)
        expect(response_body).to eq(expected_errors_message)
      end
    end
  end
end
