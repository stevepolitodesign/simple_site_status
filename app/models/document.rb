class Document
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :body
  attribute :links, array: true

  def body=(document)
    body = document
    # TODO Should we ignore anchor tags?
    self.links = body.css("a[href]").map {Link.new(text: _1.text, url: _1.attributes["href"].value)}
  end
end
