module Charts
  module Types
    class RedisChart < Charts::Types::Chart
    
      attr_reader :storage
    
      def initialize(name, request_url, storage_key=nil)
        @name = name
        @api_request = ApiRequest.new(request_url)
        @storage = ResponseStorage.new(@api_request, storage_key) 
      end  
    
      def chart_data
        storage.values
      end  
    
    end  
    
  end  
end  