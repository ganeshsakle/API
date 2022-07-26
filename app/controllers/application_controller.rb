class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
  private
    def not_destroyed(e)
        rendor json: {errors: e.record.errors }, status: :not_found
    end
end
