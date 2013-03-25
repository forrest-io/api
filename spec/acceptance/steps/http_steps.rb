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

step "I should receive a HTTP :code response" do |code|
  @response.code.should == code
end

step "the Location header should point to :url" do |url|
  @response.headers[:location].should == url
end

def resource_for(relative_url)
  absolute_url = URL_PREFIX + relative_url
  RestClient::Resource.new absolute_url
end
