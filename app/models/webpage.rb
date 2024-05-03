class Webpage < ApplicationRecord
  has_one :document
  has_many :links, through: :document

  validates :url, format: { with: URI::regexp }

  def uri
    URI(url)
  end
end
