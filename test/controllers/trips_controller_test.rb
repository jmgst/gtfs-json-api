require "test_helper"

class Api::V1::TripsControllerTest < ActionDispatch::IntegrationTest
  test "index gibt alle Trips als JSON zurück" do
    get api_v1_trips_url
    assert_response :success
    json = JSON.parse(response.body)
    assert_equal Trip.count, json.length
  end

  test "index filtert Trips nach route_id" do
    route = routes(:one)

    get api_v1_trips_url(route_id: route.route_id)
    assert_response :success

    json = JSON.parse(response.body)
    assert_equal route.trips.count, json.length
    json.each do |trip|
      assert_equal route.route_short_name, trip["route_short_name"]
    end
  end

  test "index liefert 404 für unbekannte route_id" do
    get api_v1_trips_url(route_id: "nicht_existent")
    assert_response :not_found
  end

  test "show liefert 404 für unbekannte trip_id" do
    get api_v1_trip_url(id: "nicht_existent")
    assert_response :not_found
  end

  test "show liefert den Trip mit Route, Kalender und Stop Times zurück" do
    trip = trips(:one)

    get api_v1_trip_url(id: trip.trip_id)
    assert_response :success

    json = JSON.parse(response.body)
    assert_equal trip.trip_id, json["trip_id"]
    assert_equal trip.trip_headsign, json["trip_headsign"]
    assert_equal trip.direction_id, json["direction_id"]

    assert_equal trip.route.route_id, json["route"]["route_id"]
    assert_equal trip.route.route_short_name, json["route"]["route_short_name"]
    assert_equal trip.route.route_long_name, json["route"]["route_long_name"]

    assert_equal trip.calendar.service_id, json["calendar"]["service_id"]
    assert_equal trip.calendar.monday, json["calendar"]["days"]["monday"]

    assert_equal trip.stop_times.count, json["stop_times"].length
  end

  test "show sortiert stop_times nach stop_sequence" do
    trip = trips(:one)

    get api_v1_trip_url(id: trip.trip_id)
    json = JSON.parse(response.body)

    sequences = json["stop_times"].map { |st| st["stop_sequence"] }
    assert_equal sequences.sort, sequences
  end
end