module Charts
  module ResponseProcessors
    class NasdaqResponseProcessor
      
      attr_reader :response
      
      def initalize(response)
        @response = response
      end  
      
      def process(response)
        response.map {|item| [Date.parse(item[0]),item[3]]}
      end  
      
    end
  end
end  