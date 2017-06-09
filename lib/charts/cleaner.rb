module Charts
    
  class << self
    
    def redis_charts
      Charts::Config.config.select {|config, values| values.keys.include?("storage_key")}  
    end   
    
  end  
  
  class Cleaner
    
    extend ActiveSupport::Concern
     
    class << self 
      
      def clear_all
        Charts.redis_charts.each do |config, values| 
          api_request = Charts::ApiRequest.new(values[:request_url])
          storage_key = values[:storage_key]
          Charts::ResponseStorage.new(api_request, storage_key).clear 
        end  
      end    
  
    end  
  end
end  