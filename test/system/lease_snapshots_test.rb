require "application_system_test_case"

class LeaseSnapshotsTest < ApplicationSystemTestCase
  setup do
    @lease_snapshot = lease_snapshots(:one)
  end

  test "visiting the index" do
    visit lease_snapshots_url
    assert_selector "h1", text: "Lease snapshots"
  end

  test "should create lease snapshot" do
    visit lease_snapshots_url
    click_on "New lease snapshot"

    fill_in "End date", with: @lease_snapshot.end_date
    fill_in "Expected return", with: @lease_snapshot.expected_return
    fill_in "Farmer", with: @lease_snapshot.farmer_id
    fill_in "Financial year", with: @lease_snapshot.financial_year
    fill_in "Investment amount", with: @lease_snapshot.investment_amount
    fill_in "Land", with: @lease_snapshot.land_id
    fill_in "Start date", with: @lease_snapshot.start_date
    fill_in "Status", with: @lease_snapshot.status
    click_on "Create Lease snapshot"

    assert_text "Lease snapshot was successfully created"
    click_on "Back"
  end

  test "should update Lease snapshot" do
    visit lease_snapshot_url(@lease_snapshot)
    click_on "Edit this lease snapshot", match: :first

    fill_in "End date", with: @lease_snapshot.end_date
    fill_in "Expected return", with: @lease_snapshot.expected_return
    fill_in "Farmer", with: @lease_snapshot.farmer_id
    fill_in "Financial year", with: @lease_snapshot.financial_year
    fill_in "Investment amount", with: @lease_snapshot.investment_amount
    fill_in "Land", with: @lease_snapshot.land_id
    fill_in "Start date", with: @lease_snapshot.start_date
    fill_in "Status", with: @lease_snapshot.status
    click_on "Update Lease snapshot"

    assert_text "Lease snapshot was successfully updated"
    click_on "Back"
  end

  test "should destroy Lease snapshot" do
    visit lease_snapshot_url(@lease_snapshot)
    click_on "Destroy this lease snapshot", match: :first

    assert_text "Lease snapshot was successfully destroyed"
  end
end
