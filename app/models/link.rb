class Link < ApplicationRecord
  belongs_to :document
  has_one :status

  def uri
    URI(url)
  end
end
