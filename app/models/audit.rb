class Audit
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :url
  attribute :document

  def self.create(attributes)
    audit = new(attributes)

    response = Request.get(audit.url)
    body = Nokogiri::HTML(response)
    audit.document = Document.new(body:)

    audit
  end

  def to_param
    self.signed_id
  end
end
