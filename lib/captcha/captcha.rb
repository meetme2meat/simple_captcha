require 'digest/sha1'

module Captcha
  attr_accessor :result,:solution
   def check_result
    self.errors.add_to_base("Time To Go Back to School") unless self.captcha_check?
   end
  
   def captcha_check?
     solution == Digest::SHA1.hexdigest(result.to_s)
   end
   
  def validate_captcha
     validates_presence_of :result,:error => "Result can't be blank"  
     check_result 
  end
 
end


