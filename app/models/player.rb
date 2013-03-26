require 'curator'
require 'babosa'

class Player
  include Curator::Model
  include ActiveModel::Validations

  attr_accessor :id, :name, :email, :slug

  validates :name, :presence => true

  def initialize args={}
    args[:slug] ||= args[:name].to_slug.normalize.to_s if args[:name]
    super(args)
  end

  def to_json(state=nil)
    { name: name, email: email }.to_json
  end
end
