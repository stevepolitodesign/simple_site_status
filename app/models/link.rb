class Link
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :text, :string
  attribute :url, :string
  attribute :status_code, :string

  def url=(value)
    super(value)
    uri = URI(value)
    # TODO: Mock this
    # TODO: How do we handle anything in the 300 range?
    # TODO: Need a way to determe if the link is external or internal
    response = Net::HTTP.get_response(uri)
    self.status_code = response.code
  end
end
