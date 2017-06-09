require "rails_helper"
require "charts"

describe Charts::Types::RedisChart do 
  context "an instance" do   
    let(:name) { "Bitcoin" }
    let(:storage_key) { "btcusd" }
    let(:chart) { Charts::Types::RedisChart.new(name, bitbay_request_url, storage_key) }
   
   
    it "has name" do 
      expect(chart.name).to eq name
    end  
    
    it "has a storage key" do 
      expect(chart.storage.storage_key).to eq storage_key
    end  
    
    context "api requested successfully" do 
      before {  stub_bitbay_successfull_response }
      
      it "has chart data" do 
        expect(chart.chart_data).to eq chart.storage.values
      end  
      
    end  
    
  end  
end  