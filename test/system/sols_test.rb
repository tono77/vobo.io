require "application_system_test_case"

class SolsTest < ApplicationSystemTestCase
  setup do
    @sol = sols(:one)
  end

  test "visiting the index" do
    visit sols_url
    assert_selector "h1", text: "Sols"
  end

  test "creating a Sol" do
    visit sols_url
    click_on "New Sol"

    fill_in "Desc", with: @sol.desc
    fill_in "State", with: @sol.state_id
    fill_in "Title", with: @sol.title
    fill_in "User", with: @sol.user_id
    click_on "Create Sol"

    assert_text "Sol was successfully created"
    click_on "Back"
  end

  test "updating a Sol" do
    visit sols_url
    click_on "Edit", match: :first

    fill_in "Desc", with: @sol.desc
    fill_in "State", with: @sol.state_id
    fill_in "Title", with: @sol.title
    fill_in "User", with: @sol.user_id
    click_on "Update Sol"

    assert_text "Sol was successfully updated"
    click_on "Back"
  end

  test "destroying a Sol" do
    visit sols_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sol was successfully destroyed"
  end
end
