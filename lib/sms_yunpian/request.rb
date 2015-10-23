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
    params['apikey'] = @api_key #'c5d7d3b0c38e84fd03e438f4c8ef5989'
    params['mobile'] = mobile#'18959203752'
    params['text']   = text #'【代迹网】您的验证码是132467'
    req              = Net::HTTP::Post.new(uri)
    req.set_form_data(params)
    response         = http.request(req)
    puts response.body
  end
end
