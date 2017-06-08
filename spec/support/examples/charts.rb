shared_examples "a chart" do
  let(:chart) { described_class.new }

  context "#api_data_request_url" do
    it "is a non empty string" do
      expect(chart.api_data_request_url).to be_an_instance_of String
      expect(chart.api_data_request_url).to_not be_empty
    end
  end

end