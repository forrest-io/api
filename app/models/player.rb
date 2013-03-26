require 'curator'
require 'babosa'

class Player
  include Curator::Model
  include ActiveModel::Validations

  attr_accessor :id, :name, :email, :slug

  validates :name, :presence => true

  def initialize args={}
    args[:slug] ||= args[:name].to_slug.normalize.to_s
    super(args)
  end
end
