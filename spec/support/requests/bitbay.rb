module Requests
  module Bitbay
    
    def stub_bitbay_successfull_response
      stub_request(:get, "https://bitbay.net/API/Public/BTCUSD/ticker.json").
          to_return(body: bitbay_successfull_response_body)
    end
    
    def stub_bitbay_error_response
      stub_request(:any, /bitbay\.net/).
        to_return(status: [500, "Internal Server Error"])
    end  
    
    private 
    
    def bitbay_successfull_response_body
      {
        "max" => 2945, 
        "min" => 2785, 
        "last" => 2880, 
        "bid"=> 2828.01, 
        "ask"=> 2880, 
        "vwap"=> 2862.03, 
        "average"=> 2880, 
        "volume"=> 16.92931175
      }.to_json
    end  
  
  end
end  