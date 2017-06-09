desc "Reads chart api values"
task :scheduler => :environment do
  puts "Updating chart..."
   Charts::Config.config.select {|config, values| values.keys.include?("storage_key")}.each do |config, values|
     api_request = Charts::ApiRequest.new(values[:request_url])
     Charts::ResponseStorage.new(api_request, values[:storage_key]).store_request
   end 
  puts "done."
end
