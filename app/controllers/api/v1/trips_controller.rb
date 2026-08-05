module Api
  module V1
    class TripsController < BaseController
      def index
        trips = Trip.includes(:route).all
        render json: trips.map { |t| { trip_id: t.trip_id, trip_headsign: t.trip_headsign, route_short_name: t.route.route_short_name } }
      end

      def show
        trip = Trip.includes(:route, :calendar, stop_times: :stop).find_by!(trip_id: params[:id])

        render json: {
          trip_id: trip.trip_id,
          trip_headsign: trip.trip_headsign,
          direction_id: trip.direction_id,
          route: {
            route_id: trip.route.route_id,
            route_short_name: trip.route.route_short_name,
            route_long_name: trip.route.route_long_name
          },
          calendar: {
            service_id: trip.calendar.service_id,
            days: {
              monday: trip.calendar.monday,
              tuesday: trip.calendar.tuesday,
              wednesday: trip.calendar.wednesday,
              thursday: trip.calendar.thursday,
              friday: trip.calendar.friday,
              saturday: trip.calendar.saturday,
              sunday: trip.calendar.sunday
            }
          },
          stop_times: trip.stop_times.order(:stop_sequence).map do |st|
            {
              stop_sequence: st.stop_sequence,
              arrival_time: st.arrival_time,
              departure_time: st.departure_time,
              stop: {
                stop_id: st.stop.stop_id,
                stop_name: st.stop.stop_name,
                stop_lat: st.stop.stop_lat,
                stop_lon: st.stop.stop_lon
              }
            }
          end
        }
      end
    end
  end
end
