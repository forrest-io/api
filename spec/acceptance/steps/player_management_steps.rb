step "a player named :name exists" do |name|
  resource_for("/players").post({ :name => name }.to_json, :content_type => :json)
end

step ":player should no longer exist" do |player|
  resource_for("/players/#{name.downcase}").get.code.should == 404
end

step ":name should have the following details:" do |name, details|
  details == @json
end
