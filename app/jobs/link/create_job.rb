class Link::CreateJob < ActiveJob::Base
  def perform(document)
    links = Nokogiri::HTML(document.body).css("a")

    links.each do |link|
      url = link.attributes["href"].value
      text = link.text

      document.links.create!(url:, text:)
    end
  end
end
