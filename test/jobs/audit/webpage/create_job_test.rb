require "test_helper"

class Audit::Webpage::CreateJobTest < ActiveJob::TestCase
  test "enqueues Link::CreateJob" do
    webpage = create_webpage(document: nil)

    stub_request :get, "https://example.com"

    Audit::Webpage::CreateJob.perform_now(webpage)

    assert_enqueued_with job: Link::CreateJob, args: [webpage.document]
  end

  test "creates document" do
    webpage = create_webpage(document: nil)

    stub_request :get, "https://example.com"

    assert_changes -> { webpage.reload.document }, from: nil do
      Audit::Webpage::CreateJob.perform_now(webpage)
    end
  end
end
