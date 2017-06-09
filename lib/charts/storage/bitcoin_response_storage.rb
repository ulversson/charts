module Charts
  module Storage
    class BitcoinResponseStorage
      
      attr_reader :storage_key, :api_request
      
      def initialize(api_request, storage_key)
        @api_request = api_request
        @storage_key = storage_key
      end  
      
      def store_request
        response_body = api_request.call
        storage_collection[Time.zone.now.to_i.to_s] = api_request.response["last"].to_s if api_request.response_ok?
      end  
      
      def values
        storage_collection.members(with_scores: true)
      end  
      
      private
      
      def storage_collection
        Redis::SortedSet.new("charts_#{storage_key}")
      end    
                
    end
  end
end  