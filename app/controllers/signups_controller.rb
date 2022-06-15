class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid

    def create
        @signup = Signup.new(signup_params)
        @signup.save!
        render json: @signup.activity, status: :created
    end

    private

    def invalid
        render json: { errors: @signup.errors.full_messages }, status: 422
    end

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end
end
