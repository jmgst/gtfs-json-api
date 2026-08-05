agency = Agency.create!(
  agency_id: "AG1",
  agency_name: "Musterverkehr GmbH",
  agency_url: "https://musterverkehr.example",
  agency_timezone: "Europe/Berlin",
  agency_lang: "de",
  agency_phone: "+49 351 1234567"
)

stops = {
  "S1" => Stop.create!(stop_id: "S1", stop_name: "Hauptbahnhof",  stop_lat: 51.0405, stop_lon: 13.7325, location_type: 0),
  "S2" => Stop.create!(stop_id: "S2", stop_name: "Rathausplatz",   stop_lat: 51.0493, stop_lon: 13.7381, location_type: 0),
  "S3" => Stop.create!(stop_id: "S3", stop_name: "Stadtpark",      stop_lat: 51.0521, stop_lon: 13.7502, location_type: 0),
  "S4" => Stop.create!(stop_id: "S4", stop_name: "Universität",    stop_lat: 51.0290, stop_lon: 13.7222, location_type: 0)
}

route1 = Route.create!(route_id: "R1", agency: agency, route_short_name: "1", route_long_name: "Hauptbahnhof - Stadtpark", route_type: 3, route_color: "FF0000", route_text_color: "FFFFFF")
route2 = Route.create!(route_id: "R2", agency: agency, route_short_name: "2", route_long_name: "Hauptbahnhof - Universität", route_type: 3, route_color: "0000FF", route_text_color: "FFFFFF")

# Not used for now
# cal_weekday = Calendar.create!(service_id: "WD", monday: true, tuesday: true, wednesday: true, thursday: true, friday: true, saturday: false, sunday: false, start_date: "20260101", end_date: "20261231")
# cal_weekend = Calendar.create!(service_id: "WE", monday: false, tuesday: false, wednesday: false, thursday: false, friday: false, saturday: true, sunday: true, start_date: "20260101", end_date: "20261231")

trip1 = Trip.create!(trip_id: "T1", route: route1, service_id: "WD", trip_headsign: "Stadtpark", direction_id: 0)
trip2 = Trip.create!(trip_id: "T2", route: route1, service_id: "WE", trip_headsign: "Stadtpark", direction_id: 0)
trip3 = Trip.create!(trip_id: "T3", route: route2, service_id: "WD", trip_headsign: "Universität", direction_id: 0)

[
  [ trip1, "S1", "08:00:00", "08:00:00", 1 ],
  [ trip1, "S2", "08:05:00", "08:06:00", 2 ],
  [ trip1, "S3", "08:12:00", "08:12:00", 3 ],

  [ trip2, "S1", "10:00:00", "10:00:00", 1 ],
  [ trip2, "S2", "10:05:00", "10:06:00", 2 ],
  [ trip2, "S3", "10:12:00", "10:12:00", 3 ],

  [ trip3, "S1", "09:00:00", "09:00:00", 1 ],
  [ trip3, "S4", "09:10:00", "09:10:00", 2 ]
].each do |trip, stop_id, arr, dep, seq|
  StopTime.create!(trip: trip, stop: stops[stop_id], arrival_time: arr, departure_time: dep, stop_sequence: seq)
end
