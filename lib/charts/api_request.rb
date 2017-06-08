module Charts
  class ApiRequest
    
    attr_reader :request_url, :response, :code
    
    def initialize(request_url)
      @request_url = request_url
    end  
    
    def call
      @response = request_data
    end  
      
    private
  
    def request_data
      response = Faraday.get request_url
      @code = response.status
      code == 200 ? ActiveSupport::JSON.decode(response.body) : {}
    end  
  end
end  