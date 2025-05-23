require "application_system_test_case"

class LandsTest < ApplicationSystemTestCase
  setup do
    @land = lands(:one)
  end

  test "visiting the index" do
    visit lands_url
    assert_selector "h1", text: "Lands"
  end

  test "should create land" do
    visit lands_url
    click_on "New land"

    fill_in "Landowner", with: @land.landowner_id
    fill_in "Location", with: @land.location
    fill_in "Size in biswas", with: @land.size_in_biswas
    fill_in "Size unit", with: @land.size_unit
    fill_in "Size value", with: @land.size_value
    click_on "Create Land"

    assert_text "Land was successfully created"
    click_on "Back"
  end

  test "should update Land" do
    visit land_url(@land)
    click_on "Edit this land", match: :first

    fill_in "Landowner", with: @land.landowner_id
    fill_in "Location", with: @land.location
    fill_in "Size in biswas", with: @land.size_in_biswas
    fill_in "Size unit", with: @land.size_unit
    fill_in "Size value", with: @land.size_value
    click_on "Update Land"

    assert_text "Land was successfully updated"
    click_on "Back"
  end

  test "should destroy Land" do
    visit land_url(@land)
    click_on "Destroy this land", match: :first

    assert_text "Land was successfully destroyed"
  end
end
