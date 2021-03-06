module Charts
  module ResponseProcessors
    
    class << self
    
      def klass_name_from_processor(processor_klass)
        "Charts::ResponseProcessors::#{processor_klass}".constantize  
      end   
    
    end  
    
    class NasdaqResponseProcessor

      def process(response)
        response["dataset"]["data"].map { |item| 
          [(Time.parse(item[0]).to_i*1000), item[3] ]
        }.sort_by {|row| Time.at(row.first/1000) }  
      end  
      
    end
  end
end  