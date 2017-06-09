module Charts
  module ResponseProcessors
    class NasdaqResponseProcessor

      def process(response)
        response["dataset"]["data"].map { |item| 
          [(Time.parse(item[0]).to_i*1000), item[3] ]
        }.sort_by {|row| Time.at(row.first/1000) }  
      end  
      
    end
  end
end  