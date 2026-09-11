require "test_helper"

class Api::V1::AgenciesControllerTest < ActionDispatch::IntegrationTest
  test "index gibt alle Agenturen als JSON zurück" do
    get api_v1_agencies_url
    assert_response :success
    json = JSON.parse(response.body)
    assert_equal Agency.count, json.length
  end

  test "show liefert 404 für unbekannte agency_id" do
    get api_v1_agency_url(id: "nicht_existent")
    assert_response :not_found
  end

  test "show liefert genau die angefragte Agentur zurück" do
    agency = agencies(:one)

    get api_v1_agency_url(id: agency.agency_id)
    assert_response :success

    json = JSON.parse(response.body)
    assert_equal agency.agency_id, json["agency_id"]
    assert_equal agency.agency_name, json["agency_name"]
    assert_equal agency.agency_url, json["agency_url"]
    assert_equal agency.agency_timezone, json["agency_timezone"]
    assert_equal agency.agency_lang, json["agency_lang"]
    assert_equal agency.agency_phone, json["agency_phone"]
  end
end