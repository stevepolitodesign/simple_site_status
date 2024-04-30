class Webpage < ApplicationRecord
  has_one :document
  has_many :links, through: :document
end
