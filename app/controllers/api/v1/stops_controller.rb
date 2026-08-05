module Api
  module V1
    class StopsController < BaseController
      def index
        render json: Stop.all.as_json(only: [ :stop_id, :stop_name, :stop_lat, :stop_lon ])
      end

      def show
        stop = Stop.find_by!(stop_id: params[:id])
        stop_times = stop.stop_times.includes(trip: :route).order(:departure_time)

        render json: {
          stop_id: stop.stop_id,
          stop_name: stop.stop_name,
          stop_lat: stop.stop_lat,
          stop_lon: stop.stop_lon,
          departures: stop_times.map do |st|
            {
              trip_headsign: st.trip.trip_headsign,
              route_short_name: st.trip.route.route_short_name,
              departure_time: st.departure_time
            }
          end
        }
      end
    end
  end
end
