module SmsYunpian
  require 'open-uri'
  require "net/http"
  
  @api_key           = "api_key"
  
  class << self
    attr_accessor :api_key
  end
  
  def self.send(mobile,text)
    uri              = URI.parse('http://yunpian.com/v1/sms/send.json')
    http             = Net::HTTP.new(uri.host,uri.port)
    params           = {}
    params['apikey'] = @api_key 
    params['mobile'] = mobile
    params['text']   = text 
    req              = Net::HTTP::Post.new(uri)
    req.set_form_data(params)
    response         = http.request(req)
    puts response.body
  end
  
  def self.send_security_code(mobile,code)
    self.send(mobile, "【代迹网】您的验证码是#{code}")
  end
end
