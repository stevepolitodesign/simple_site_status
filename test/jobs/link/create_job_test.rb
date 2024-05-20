require "test_helper"

class Link::CreateJobTest < ActiveJob::TestCase
  test "extracts links from document" do
    body = file_fixture("example.com.html").read
    document = build_document(body:)
    webpage = create_webpage(document:)

    assert_changes -> {document.reload.links.count}, from: 0, to: 1 do
      Link::CreateJob.perform_now(document)
    end
  end

  test "enqueues Status::CreateJob" do
    flunk
  end
end
