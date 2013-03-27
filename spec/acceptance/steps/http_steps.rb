step "I GET :url" do |url|
  @response = resource_for(url).get { |response, request, result| response }
  @json = JSON.parse(@response)
end

step "I POST to :url with the following details:" do |url, table|
  table.hashes.each do |hash|
    @response = resource_for(url).post(hash)
  end
end

step "I PATCH :url with the following details:" do |url, table|
  table.hashes.each do |hash|
    @response = resource_for(url).patch(hash)
  end
end

step "I DELETE :url" do |url|
  @response = resource_for(url).delete
end

step "I should receive a HTTP :code response" do |code|
  @response.code.should == code.to_i
end

step "the Location header should point to :url" do |url|
  @response.headers[:location].should == url
end

def resource_for(relative_url)
  absolute_url = URL_PREFIX + relative_url
  RestClient::Resource.new absolute_url
end
