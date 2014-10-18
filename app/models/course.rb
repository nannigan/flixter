class Course < ActiveRecord::Base
		mount_uploader :image, ImageUploader
	  belongs_to :user
	  has_many :sections
	  	  #that have many lessons so not here
	  has_many :enrollments

	validates :title, :presence => true
	validates :description, :presence => true
	validates :cost, :presence => true, :numericality => {:greater_than_or_equal_to => 0}

  def free?
    cost.zero?
  end
  def premium?
    ! free?
  end

end
