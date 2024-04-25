require "application_system_test_case"

class AuditStoriesTest < ApplicationSystemTestCase
  test "auditing a url" do
    body = file_fixture("example.com.html")
    stub_request(:get, "https://example.com").to_return(body:)
    stub_request(:get, "https://404.com").to_return(body: "404", status: 404)

    visit root_path

    assert_selector "h1", text: "Free Broken Link Checker"

    fill_in "Url", with: "https://example.com"
    click_button "Audit Webpage"

    assert_selector "h1", text: "Results for https://example.com"

    within_table "links" do
      assert_text "404 https://404.com Broken Link"
    end
  end
end
