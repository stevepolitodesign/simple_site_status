# TODO: Why do we need this?
require "net/http"

class Audit::Webpage::CreateJob < ApplicationJob
  queue_as :default

  def perform(webpage)
    response = Net::HTTP.get(webpage.uri)

    webpage.create_document(body: response)

    Link::CreateJob.perform_later(webpage.document)
    links = Nokogiri::HTML(webpage.document.body).css("a")

    links.each do |link|
      # TODO: Consider making this another job
      url = link.attributes["href"].value
      text = link.text

      link = webpage.document.links.create!(url:, text:)

      # TODO: Consider making this another job
      code = Net::HTTP.get_response(link.uri).code
      link.create_status!(code:)
    end
  end
end
