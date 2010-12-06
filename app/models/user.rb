class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :rememberable, :trackable
  
  DEGREE_TYPES = {:Undergrad=>0,
            :Masters=>1,
            'Ph.D'=>2}

  # Setup accessible (or protected) attributes for your model
  attr_accessible :student_number, :email, :password, :password_confirmation, :remember_me
  
  has_many :grants
  has_many :comments
  
  validates :name,  :presence=>true, :on => :update
  validates :phone,  :presence=>true, :on => :update
  validates :department,  :presence=>true, :on => :update
  validates :email,  :presence=>true, :on => :update
  validates :degree,  :presence=>true, :on => :update
  validates :year,  :presence=>true, :on => :update
  
  def self.get_degree_name(degree)
    DEGREE_TYPES.each do |key, value|
      if value == degree
        return key.to_s
      end
    end
    return nil
  end
  
  def get_degree_name
    return User.get_degree_name(self.degree)
  end
end