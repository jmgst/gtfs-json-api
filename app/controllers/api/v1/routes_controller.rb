module Api
  module V1
    class RoutesController < ApplicationController
      def index
        routes = Route.includes(:agency).all
        render json: routes.map { |route| route_json(route) }
      end

      def show
        route = Route.includes(:agency, :trips).find_by!(route_id: params[:id])
        render json: route_json(route).merge(
          trips: route.trips.map { |t| { trip_id: t.trip_id, trip_headsign: t.trip_headsign, service_id: t.service_id } }
        )
      end

      private

      def route_json(route)
        {
          route_id: route.route_id,
          route_short_name: route.route_short_name,
          route_long_name: route.route_long_name,
          route_type: route.route_type,
          route_color: route.route_color,
          agency: { agency_id: route.agency.agency_id, agency_name: route.agency.agency_name }
        }
      end
    end
  end
end
