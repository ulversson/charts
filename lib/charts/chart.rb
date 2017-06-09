module Charts
  class Chart
    
    attr_reader :name, :api_request, :storage
    
    def initialize(name, request_url, storage_key)
      @name = name
      @api_request = ApiRequest.new(request_url)
      @storage = ResponseStorage.new(@api_request, storage_key)
    end  
    
    def chart_data
      storage.values
    end  
    
  end  
end  