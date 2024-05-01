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

      link = webpage.document.links.create!(url:, text:)

      code = Net::HTTP.get_response(link.uri).code
      link.create_status!(code:)
    end
  end
end
