module Charts
  class ResponseStorage
    
    attr_reader :storage_key, :api_request
    
    def initialize(api_request, storage_key)
      @api_request = api_request
      @storage_key = storage_key
    end  
    
    def store_request
      response_body = api_request.call
      storage_collection[(Time.zone.now.to_i*1000).to_s] = api_request.response["USD"].to_s if api_request.response_ok?
    end  
    
    def values
      # sort collection by dates since highcharts does not do it automatically (requires miliseconds)
      storage_collection.members(with_scores: true).map {|row| [row.first.to_i, row[1]]}.sort_by {|row| Time.at(row.first.to_i/1000)}
    end  
    
    def clear
      storage_collection.clear
    end  
    
    private
    
    def storage_collection
      Redis::SortedSet.new("charts_#{storage_key}")
    end    
              
  end    
end  