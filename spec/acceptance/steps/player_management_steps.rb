step "a player named :name exists at :url" do |name, url|
  resource_for(url).put(:name => name)
end

step "the player should have the following details:" do |table|
  table.hashes.first.each do |attribute, value|
    @json[attribute].should == value
  end
end
