require 'digest/sha1'

class BaseCaptcha
  def checksum result
    Digest::SHA1.hexdigest(result.to_s)
  end
end

class MathCaptcha < BaseCaptcha
  OPERATOR = ["+","-","*"]
  MAPPED_TO = ["+","-","x"]
  attr_accessor :x,:y,:operator,:mapped_to
  
  def initialize()
		@x,@y = setnumber 
		@operator = math_operator
                @mapped_to = MAPPED_TO.values_at(OPERATOR.index(@operator))
	end
	
	def answer 
    checksum @x.send @operator,@y
  end
  
 private
	def setnumber
		x = rand(10)
	  y = rand(10)
	  return x,y  
	end

	def math_operator
		OPERATOR[rand(3)]
	end
end

class Text < BaseCaptcha
  def initialize()
  end
end
