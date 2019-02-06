class IncomingMailsController < ApplicationController
  protect_from_forgery with: :null_session

  def create

    #Rails.logger.log params[:envelope][:to] # print the to field to the logs
    Rails.logger.log params[:subject] # print the subject to the logs
    Rails.logger.log params[:plain] # print the decoded body plain to the logs if present
    #Rails.logger.log params[:html] # print the html decoded body to the logs if present
    #Rails.logger.log params[:attachments][0] if params[:attachments] # A tempfile attachment if attachments is populated

  end
end
