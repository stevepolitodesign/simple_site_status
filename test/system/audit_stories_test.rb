require "application_system_test_case"

class AuditStoriesTest < ApplicationSystemTestCase
  test "auditing a url" do
    visit root_path

    assert_selector "h1", text: "Free Broken Link Checker"

    fill_in "Url", with: "https://example.com"
    click_button "Audit Webpage"

    assert_selector "h1", text: "Results for https://example.com"
  end
end
