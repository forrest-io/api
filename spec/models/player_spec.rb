require 'spec_helper'

describe Player do
  subject { player }

  let(:player) { Player.new name: name, email: email, slug: slug }
  let(:name) { 'Default Player' }
  let(:email) { 'default@forrest.io' }
  let(:slug) { 'default-player' }

  describe '#valid?' do
    context 'true when name is present' do
      let(:name) { 'James' }
      its(:valid?) { should == true }
    end

    context 'false when name is nil' do
      let(:name) { '' }
      its(:valid?) { should == false }
    end
  end

  describe '#slug' do
    context 'implicit' do
      let(:name) { 'James Ottaway' }
      let(:slug) { nil }
      its(:slug) { should == 'james-ottaway' }
    end

    context 'explicit' do
      let(:name) { 'Default Player' }
      let(:slug) { 'fubar' }
      its(:slug) { should == 'fubar' }
    end
  end
end