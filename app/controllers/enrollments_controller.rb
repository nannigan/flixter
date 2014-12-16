class EnrollmentsController < ApplicationController
	 before_action :authenticate_user!
	def create

    if current_course.premium?  

      customer = current_user.make_stripe_customer(params[:stripeToken])
      current_course.purchase_course(customer.id)

    end
  
   current_user.enrollments.create(:course => current_course)
	 redirect_to course_path(current_course)
  	
    rescue Stripe::CardError => e
  	  flash[:error] = e.message
  	  redirect_to root_path
  end

	private

  def current_course
    @current_course ||= Course.find(params[:course_id])
    # in URL the way the routes are set up
  end
end
