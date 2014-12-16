require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
		test "create course" do
			user = FactoryGirl.create(:user)
			sign_in user
		assert_difference 'Course.count' do
			post :create, {:course => {
			:name => 'How to Herd Kittens',
			:description => 'Kitty Wrangling 101',
			:cost => 1.0
					}
				}
		end
		assert_redirected_to istructor_course_path(@course)
		assert_equal 1, instructor.courses.count
	end
	#  test "create invalid" do
	# 		user = FactoryGirl.create(:user)
	# 		sign_in user
	# 	assert_no_difference 'Course.count' do
	# 		post :create, {:course => {
	# 		:name => '',
	# 		:description => '',
	# 		:cost => ''
	# 		}
	# }
	# end
	# assert_response :unprocessable_entity
	# end
end
