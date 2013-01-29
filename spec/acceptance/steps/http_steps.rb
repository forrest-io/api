step "I GET :url" do |url|
  @json = JSON.parse(resource_for(url).get)
end

step "I POST to :url with the following details:" do |url, data|
  @response = resource_for(url).post(data.to_json, :content_type => :json)
end

step "I PATCH :url with the following details:" do |url, data|
  @response = resource_for(url).patch(data.to_json, :content_type => :json)
end

step "I DELETE :url" do |url|
  @response = resource_for(url).delete
end

step "I should receive a HTTP :code :status response" do |code, status|
  @response.code.should == code
end

step "a Location header should be available" do |header|
  @response.headers[:location].should_not be_nil
end

step "I follow the Location header" do
  location_url = @response.headers[:location]
  resource = RestClient::Resource.new location_url
  @json = JSON.parse(resource.get)
end

def resource_for(relative_url)
  absolute_url = URL_PREFIX + relative_url
  RestClient::Resource.new absolute_url
end
