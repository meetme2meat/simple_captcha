require 'rubygems'
require File.dirname(__FILE__) + "/captcha/captcha"
require File.dirname(__FILE__) + "/captcha/simple_captcha"



module SimpleCaptcha
  def captcha_form(form_name,type=:math)
   form = ''
   case type
     when :text
       captcha = TextCaptcha.new
     else 
       captcha = MathCaptcha.new
       form += "<i> #{captcha.x} #{captcha.mapped_to} #{captcha.y} = ?</i> <br/>"
       form += "<input type='text' name='#{form_name}[result]' id='#{form_name}_result' /><br/>"
       form += "<input type='hidden' name='#{form_name}[solution]' id='#{form_name}_solution' value='#{captcha.answer}'/>"
     end   
    return form
  end

end

include SimpleCaptcha
