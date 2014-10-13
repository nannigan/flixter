class CoursesController < ApplicationController
# for students
	def index
		@courses = Course.all
	end

	def show
		 @course = Course.find(params[:id])
	end
	
end
