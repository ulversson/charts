module Charts
  module Types
    class NonRedisChart < Charts::Types::Chart
    
      attr_reader :response_processor
    
      def initialize(name, request_url)
        @name = name
        @api_request = ApiRequest.new(request_url)
      end  
    
      def chart_data
        response_processor.process(api_request.call.response)
      end
    
    end
  end  
end  