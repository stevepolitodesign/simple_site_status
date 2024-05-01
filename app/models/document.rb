class Document < ApplicationRecord
  belongs_to :webpage
  has_many :links

  # TODO: https://api.rubyonrails.org/classes/ActiveRecord/AttributeMethods/Serialization/ClassMethods.html#method-i-serialize
  # serialize :body, coder: TODO
end
