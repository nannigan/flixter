class Course < ActiveRecord::Base
	  belongs_to :user
	  has_many :sections
	  #that have lessons so not here

	validates :title, :presence => true
	validates :description, :presence => true
	validates :cost, :presence => true, :numericality => {:greater_than_or_equal_to => 0}



end
