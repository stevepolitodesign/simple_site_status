require "test_helper"

class AuditTest < ActiveSupport::TestCase
  test "url attribute" do
    audit = Audit.new(url: "https://expected.com")

    assert_equal "https://expected.com", audit.url
  end
end
