require 'spec/repositories/spec_helper'
require 'app/repositories/player_repository'

describe PlayerRepository do
  let(:ant) { Player.new name: 'Ant' }
  let(:james) { Player.new name: 'James' }
  let(:butters) { Player.new name: 'Butters' }

  describe '#find_by_name' do
    before { PlayerRepository.save(ant) }
    subject { PlayerRepository.find_first_by_name(ant.name) }
    it { should == ant }
  end

  describe '#find_by_slug' do
    before { PlayerRepository.save(james) }
    subject { PlayerRepository.find_first_by_slug(james.slug) }
    it { should == james }
  end
end
