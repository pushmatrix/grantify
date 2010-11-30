class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :grants
  
  validates :name,  :presence=>true, :on => :update
  validates :phone,  :presence=>true, :on => :update
  validates :department,  :presence=>true, :on => :update
  validates :student_number,  :presence=>true, :on => :update
  validates :degree,  :presence=>true, :on => :update
  validates :year,  :presence=>true, :on => :update
  
end