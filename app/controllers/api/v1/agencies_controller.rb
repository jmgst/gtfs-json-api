module Api
  module V1
    class AgenciesController < ApplicationController
      def index
        render json: Agency.all.as_json(only: [ :agency_id, :agency_name, :agency_url, :agency_timezone ])
      end

      def show
        agency = Agency.find_by!(agency_id: params[:id])
        render json: agency.as_json(only: [ :agency_id, :agency_name, :agency_url, :agency_timezone, :agency_lang, :agency_phone ])
      end
    end
  end
end
