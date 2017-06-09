module Charts
  module ResponseProcessors
    class NasdaqResponseProcessor

      def process(response)
        response["dataset"]["data"].map do |item| 
          [Time.parse(item[0]).to_i, item[3] ]
        end  
      end  
      
    end
  end
end  