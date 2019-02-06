class IncomingMailsController < ApplicationController
  protect_from_forgery with: :null_session

  def create

    Rails.logger.debug params.inspect
    Rails.logger.debug "Received: #{params[:headers][:subject]} for #{params[:envelope][:to]}"
    Rails.logger.debug params[:plain]
  end
end
