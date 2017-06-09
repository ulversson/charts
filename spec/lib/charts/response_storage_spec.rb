require "rails_helper"
require "charts"

describe Charts::ResponseStorage do 
  context "an instance" do   
    let(:api_request) { Charts::ApiRequest.new(bitbay_request_url) }
    let(:bitcoin_storage) { Charts::ResponseStorage.new(api_request, "btcusd")  }
    context "chart api request ok" do 
   
      before do 
        stub_bitbay_successfull_response
      end  
            
      it "stores values successfully" do 
        expect(bitcoin_storage.values).to be_an_instance_of Array
        expect { bitcoin_storage.store_request }.to change { bitcoin_storage.values.size }.by 1
      end  
    end  
    
    context "chart api request failed" do 
 
      before do 
        stub_bitbay_error_response
      end  
      
      it "does not store any values" do 
        expect { bitcoin_storage.store_request }.to_not change { bitcoin_storage.values.size }
      end  
    end  
    
  end  
end  