require "test_helper"

class LeaseSnapshotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lease_snapshot = lease_snapshots(:one)
  end

  test "should get index" do
    get lease_snapshots_url
    assert_response :success
  end

  test "should get new" do
    get new_lease_snapshot_url
    assert_response :success
  end

  test "should create lease_snapshot" do
    assert_difference("LeaseSnapshot.count") do
      post lease_snapshots_url, params: { lease_snapshot: { end_date: @lease_snapshot.end_date, expected_return: @lease_snapshot.expected_return, farmer_id: @lease_snapshot.farmer_id, financial_year: @lease_snapshot.financial_year, investment_amount: @lease_snapshot.investment_amount, land_id: @lease_snapshot.land_id, start_date: @lease_snapshot.start_date, status: @lease_snapshot.status } }
    end

    assert_redirected_to lease_snapshot_url(LeaseSnapshot.last)
  end

  test "should show lease_snapshot" do
    get lease_snapshot_url(@lease_snapshot)
    assert_response :success
  end

  test "should get edit" do
    get edit_lease_snapshot_url(@lease_snapshot)
    assert_response :success
  end

  test "should update lease_snapshot" do
    patch lease_snapshot_url(@lease_snapshot), params: { lease_snapshot: { end_date: @lease_snapshot.end_date, expected_return: @lease_snapshot.expected_return, farmer_id: @lease_snapshot.farmer_id, financial_year: @lease_snapshot.financial_year, investment_amount: @lease_snapshot.investment_amount, land_id: @lease_snapshot.land_id, start_date: @lease_snapshot.start_date, status: @lease_snapshot.status } }
    assert_redirected_to lease_snapshot_url(@lease_snapshot)
  end

  test "should destroy lease_snapshot" do
    assert_difference("LeaseSnapshot.count", -1) do
      delete lease_snapshot_url(@lease_snapshot)
    end

    assert_redirected_to lease_snapshots_url
  end
end
