# TODO: Why do we need this?
require "net/http"

class Audit::Webpage::CreateJob < ApplicationJob
  queue_as :default

  def perform(webpage)
    response = Net::HTTP.get(webpage.uri)

    webpage.create_document(body: response)

    Link::CreateJob.perform_later(webpage.document)
  end
end
