class Grant < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  TRACKING_NUMBER_BASE = 4989
  REGION_CODES= {:A=>0,
                 :B=>1,
                 :C=>2,
                 :D=>3,
                 :E=>4,
                 :Other=>5}
  
  STATUS = {:EDITING=>0,
            'IN PROCESS'=>1,
            :TEMPORARY=>2,
            :REJECTED=>3,
            :APPROVED=>4}
            
  validates :conference_name,  :presence=>true
  validates :prev_apply, :inclusion=>{:in=>[true,false]}
  validates :region,  :presence=>true, :inclusion => {:in=> REGION_CODES.values}
  validates :registration_cost, :numericality => {:greater_than_or_equal_to => 0.0}, :presence=>true
  validates :transportation_cost, :numericality => {:greater_than_or_equal_to => 0.0}, :presence=>true
  validates :registration_cost, :numericality => {:greater_than_or_equal_to => 0.0}, :presence=>true
  validates :accommodation_cost, :numericality => {:greater_than_or_equal_to => 0.0}, :presence=>true
  validates :meal_cost, :numericality => {:greater_than_or_equal_to => 0.0}, :presence=>true
  validates :department_assis, :numericality => {:greater_than_or_equal_to => 0.0}
  validates :faculty_assis, :numericality => {:greater_than_or_equal_to => 0.0}
  validates :other_assis, :numericality => {:greater_than_or_equal_to => 0.0}
  validates :status, :presence=>true, :inclusion => {:in=> STATUS.values}
            
  def self.get_status_name(status_code)
    STATUS.each do |key, value|
      if value == status_code
        return key.to_s
      end
    end
    return nil
  end
  
  def get_status_name
    return Grant.get_status_name(self.status)
  end
  
  def self.get_region_name(region_code)
    REGION_CODES.each do |key, value|
      if value == region_code
        return key.to_s
      end
    end
    return nil
  end
  
  def get_region_name
    return Grant.get_region_name(self.region)
  end
  

  
  def tracking_number
    return self.id + TRACKING_NUMBER_BASE
  end
  
  def self.id_from_tracking_number(tracking_number)
    return tracking_number.to_i - TRACKING_NUMBER_BASE
  end
end
