class Document < ApplicationRecord
  belongs_to :webpage
  has_one :link
end
