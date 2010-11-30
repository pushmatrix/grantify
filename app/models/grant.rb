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
            :PENDING=>1,
            :TEMPORARY=>2,
            :REJECTED=>3,
            :APPROVED=>4}
  
  def tracking_number
    return self.id + TRACKING_NUMBER_BASE
  end
  
  def self.id_from_tracking_number(tracking_number)
    return tracking_number.to_i - TRACKING_NUMBER_BASE
  end
end
