ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "webmock/minitest"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Add more helper methods to be used by all tests here...
    WebMock.disable_net_connect!(allow_localhost: true)

    def build_document(**attributes)
      Document.new(**attributes)
    end

    def build_webpage(**attributes)
      default_values = {
        url: "https://example.com",
        document: build_document
      }.merge(**attributes)

      Webpage.new(default_values)
    end

    def create_webpage(**attributes)
      record = build_webpage(**attributes)
      record.save!

      record
    end
  end
end
