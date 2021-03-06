module ErrorHandlers
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do
      error!('Record not found', 404)
    end
    rescue_from :all do |e|
      # When required params are missing or validation fails
      if e.class.name == 'Grape::Exceptions::ValidationErrors'
        error!(e.message, 406)
      # AccessDenied - Authorization failure
      elsif e.class.name == 'CanCan::AccessDenied'
        error!('You don\'t have permissions.', 403)

      else
        Rails.logger.error "\n#{e.class.name} (#{e.message}):"
        e.backtrace.each { |line| Rails.logger.error line }
        Rack::Response.new({
          error: '400 Bad Request',
          message: e.message
        }.to_json, 400)
      end
    end
  end
end
