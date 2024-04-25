require "net/http"

class Request
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :uri

  def self.get(url)
    new(uri: URI(url)).get
  end

  def get
    Net::HTTP.get(uri)
  end
end
