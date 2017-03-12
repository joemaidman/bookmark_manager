class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String, required: true
  property :url, String, required: true

  has n, :tags, :through => Resource, constraint: :destroy
  validates_format_of :url, :with => /https?:\/\/[\S]+/

end
