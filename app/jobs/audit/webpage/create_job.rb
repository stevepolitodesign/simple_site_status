# TODO: Why do we need this?
require "net/http"

class Audit::Webpage::CreateJob < ApplicationJob
  queue_as :default

  def perform(webpage)
    response = Net::HTTP.get(webpage.uri)

    webpage.create_document(body: response)
    links = Nokogiri::HTML(webpage.document.body).css("a")

    links.each do |link|
      url = link.attributes["href"].value
      text = link.text

      webpage.document.links.create!(url:, text:)
    end
  end
end
