require 'curator'

class Player
  include Curator::Model

  attr_accessor :id
end