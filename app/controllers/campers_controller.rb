class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid

    def index
        campers = Camper.all
        render json: campers, status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, status: :ok, serializer: CamperWithActivitiesSerializer
    end

    def create
        @camper = Camper.new(camper_params)
        @camper.save!
        render json: @camper, status: :created
    end

    private

    def not_found
        render json: { error: "Camper not found" }, status: 404
    end

    def invalid
        render json: { errors: @camper.errors.full_messages }, status: 422
    end

    def camper_params
        params.permit(:name, :age)
    end
end
