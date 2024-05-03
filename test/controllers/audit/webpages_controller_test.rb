require "test_helper"

class Audit::WebpagesControllerTest < ActionDispatch::IntegrationTest
  test "invalid url" do
    assert_no_changes -> { Webpage.count } do
      post audit_webpages_path, params: {
        webpage: {
          url: "invalid.com"
        }
      }
    end

    assert_select "li", text: "Url is invalid"
  end
end
