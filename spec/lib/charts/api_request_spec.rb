require "rails_helper"
require 'charts'

describe Charts::ApiRequest, type: :model do 
  context "an instance" do   
    let(:api_request) { Charts::ApiRequest.new(bitbay_request_url) }
    
    context "successul response" do 
      before  do 
         stub_bitbay_successfull_response
         api_request.call 
      end   
      
      it "status ok" do 
        expect(api_request.code).to eq 200
      end  
      
      it "#response_ok? is true" do 
        expect(api_request.response_ok?).to be_truthy
      end  
      
      it "response not empty" do 
        expect(api_request.response).to be_an_instance_of Hash
        expect(api_request.response).to_not be_empty
      end  
    end
    
    context "failed response" do 
      before do 
        stub_bitbay_error_response
        api_request.call
      end 
      
      it "#response_ok? is false" do 
        expect(api_request.response_ok?).to be_falsey
      end   
      
      it "status not ok" do 
        expect(api_request.code).to_not eq 200
      end  
      
      it "response empty" do 
        expect(api_request.response).to be_empty
      end  
      
    end  
    
  end  
end  