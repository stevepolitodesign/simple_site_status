require "test_helper"

class WebpageTest < ActiveSupport::TestCase
  test "url validation" do
    webpage = Webpage.new(url: "invalid.com")

    assert_not_predicate webpage, :valid?
    assert_includes webpage.errors[:url], "is invalid"
  end
end
