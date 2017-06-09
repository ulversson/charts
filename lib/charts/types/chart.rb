module Charts
  module Types
    class Chart
    
      attr_reader :name, :api_request
    
      def chart_data
        raise "Implement"
      end  
  
    end  
  end
end  