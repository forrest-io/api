require 'curator'

class Player
  include Curator::Model
  include ActiveModel::Validations

  attr_accessor :id, :name, :email

  validates :name, :presence => true
end