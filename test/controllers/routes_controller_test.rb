require "test_helper"

class Api::V1::RoutesControllerTest < ActionDispatch::IntegrationTest
  test "index liefert alle Linien als JSON" do
    get api_v1_routes_url
    assert_response :success
    json = JSON.parse(response.body)
    assert_equal Route.count, json.length
  end

  test "show liefert genau die angefragte Linie" do
    route = routes(:one)

    get api_v1_route_url(id: route.route_id)
    assert_response :success

    json = JSON.parse(response.body)
    assert_equal route.route_id, json["route_id"]
    assert_equal route.route_short_name, json["route_short_name"]
    assert_equal route.route_long_name, json["route_long_name"]
    assert_equal route.agency.agency_id, json["agency"]["agency_id"]
  end

  test "show liefert 404 bei unbekannter Linie" do
    get api_v1_route_url(id: "nicht_existent")
    assert_response :not_found
  end
end