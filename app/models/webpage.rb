class Webpage < ApplicationRecord
  has_one :document
  has_many :links, through: :document

  def uri
    URI(url)
  end
end
