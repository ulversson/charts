require "rails_helper"
require 'charts'

describe ChartsController, type: :controller do
  
  let(:api_request) { Charts::ApiRequest.new(bitbay_request_url)  }
  let(:storage) { Charts::ResponseStorage.new(api_request, "btc_usd")  }
  
  context "when there is chart data" do 
    before do  
      stub_bitbay_successfull_response
      storage.store_request
    end   
    
    it "returns chart data" do 
      get :show, params: { name: "bitcoin" }
      expect(response).to be_success
      expect(JSON.parse(response.body)).to eq(storage.values) 
    end  
    
  end  
  
  context "when there is no chart data" do 

    it "returns empty array" do 
      get :show, params: { name: "ethereum" }
      expect(response).to be_success
      expect(JSON.parse(response.body)).to eq([]) 
    end  
    
  end  
  
end   