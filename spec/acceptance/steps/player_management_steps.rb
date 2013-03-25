step "a player named :name exists at :url" do |name, url|
  resource_for(url).post({ :name => name }.to_json, :content_type => :json)
end

step "the player should have the following details:" do |details|
  details.should == @json
end
