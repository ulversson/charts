require "rails_helper"
require 'charts'

describe Charts::BitcoinChart, type: :model do 
  it_behaves_like "a chart"
  
  context "#an instance" do 
    let(:chart) { Charts::BitcoinChart.new }
  end  
  
end  