require "test_helper"

class Api::V1::StopsControllerTest < ActionDispatch::IntegrationTest
  test "index gibt alle Haltestellen als JSON zurück" do
    get api_v1_stops_url
    assert_response :success
    json = JSON.parse(response.body)
    assert_equal Stop.count, json.length
  end

  test "show liefert 404 für unbekannte stop_id" do
    get api_v1_stop_url(id: "nicht_existent")
    assert_response :not_found
  end

  test "show liefert die Haltestelle mit ihren Abfahrten zurück" do
    stop = stops(:one)

    get api_v1_stop_url(id: stop.stop_id)
    assert_response :success

    json = JSON.parse(response.body)
    assert_equal stop.stop_id, json["stop_id"]
    assert_equal stop.stop_name, json["stop_name"]
    assert_equal stop.stop_lat.to_s, json["stop_lat"].to_s
    assert_equal stop.stop_lon.to_s, json["stop_lon"].to_s
    assert json.key?("departures")
    assert_equal stop.stop_times.count, json["departures"].length
  end

  test "show sortiert die Abfahrten nach departure_time" do
    stop = stops(:one)

    get api_v1_stop_url(id: stop.stop_id)
    json = JSON.parse(response.body)

    times = json["departures"].map { |d| d["departure_time"] }
    assert_equal times.sort, times
  end
end