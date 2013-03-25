require 'spec_helper'
require 'app/models/player'

describe Player do
  subject { Player.new name: name, email: email }
  let(:name) { 'James' }
  let(:email) { 'james@forrest.io' }

  describe '#valid?' do
    context 'true when name is present' do
      let(:name) { 'James' }
      its(:valid?) { should == true }
    end

    context 'false when name is nil' do
      let(:name) { nil }
      its(:valid?) { should == false }
    end
  end
end