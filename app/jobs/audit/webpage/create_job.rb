class Audit::Webpage::CreateJob < ApplicationJob
  queue_as :default

  def perform(webpage)
    response = Net::HTTP.get(webpage.uri)
    document = Nokogiri::HTML(response)
    debugger

    webpage.create_document(body: document)
  end
end
