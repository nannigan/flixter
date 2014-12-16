class Course < ActiveRecord::Base
		mount_uploader :image, ImageUploader
	  belongs_to :user
	  has_many :sections
	  	  #that have many lessons so not here
	  has_many :enrollments
#ActiveRecord validates
	validates :title, :presence => true
	validates :description, :presence => true
	validates :cost, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
	def amount_in_cents
		(self.cost * 100).to_i
	end

	def purchase_course(customer_id)
			Stripe::Charge.create(
      :customer    => customer_id,
      :amount      => self.amount_in_cents,
      :description => 'Flixter Paid Course customer',
      :currency    => 'usd'
    )
	end
  def free?
    cost.zero?
  end
  def premium?
    ! free?
  end

end
