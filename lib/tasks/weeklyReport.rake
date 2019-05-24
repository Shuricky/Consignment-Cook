require 'csv'
require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'mail'
require 'mime'

task :weeklyReport => :environment do
  csv = ["Saturday"].to_csv
  csv << Shoe.where(:sold => "true").where(:updated_at => (Time.now - 168.hours)..(Time.now - 144.hours)).order(:updated_at :desc).to_csv
  csv << ["Sunday"].to_csv
  csv << Shoe.where(:sold => "true").where(:updated_at => (Time.now - 144.hours)..(Time.now - 120.hours)).order(:updated_at :desc).to_csv
  csv << ["Monday"].to_csv
  csv << Shoe.where(:sold => "true").where(:updated_at => (Time.now - 120.hours)..(Time.now - 96.hours)).order(:updated_at :desc).to_csv
  csv << ["Tuesday"].to_csv
  csv << Shoe.where(:sold => "true").where(:updated_at => (Time.now - 96.hours)..(Time.now - 72.hours)).order(:updated_at :desc).to_csv
  csv << ["Wednesday"].to_csv
  csv << Shoe.where(:sold => "true").where(:updated_at => (Time.now - 72.hours)..(Time.now - 48.hours)).order(:updated_at :desc).to_csv
  csv << ["Thursday"].to_csv
  csv << Shoe.where(:sold => "true").where(:updated_at => (Time.now - 48.hours)..(Time.now - 24.hours)).order(:updated_at :desc).to_csv
  csv << ["Friday"].to_csv
  csv << Shoe.where(:sold => "true").where(:updated_at => (Time.now - 24.hours)..Time.now).order(:updated_at :desc).to_csv

  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
  APPLICATION_NAME = 'Gmail API Ruby Quickstart'.freeze
  CREDENTIALS_PATH = 'credentials.json'.freeze
  # The file token.yaml stores the user's access and refresh tokens, and is
  # created automatically when the authorization flow completes for the first
  # time.
  TOKEN_PATH = 'token.yaml'.freeze
  SCOPE = Google::Apis::GmailV1::AUTH_GMAIL_MODIFY



  service = Google::Apis::GmailV1::GmailService.new
  service.client_options.application_name = APPLICATION_NAME
  service.authorization = authorize

  m = Mail.new(
  to: "alexroz0909@gmail.com",
  from: "cookszn121@gmail.com",
  subject: "FC Consignment CSV",
  body:"Attached is CSV of shoes")
  #msg = m.encoded

  m.attachments['shoes.csv'] = { mime_type: 'text/csv', content: csv }

  message_object = Google::Apis::GmailV1::Message.new(raw:m.to_s)
  service.send_user_message("me", message_object)



end

def authorize
  client_id = Google::Auth::ClientId.from_file(CREDENTIALS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
  authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
  user_id = 'default'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    url = authorizer.get_authorization_url(base_url: OOB_URI)
    puts 'Open the following URL in the browser and enter the ' \
         "resulting code after authorization:\n" + url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI
    )
  end
  credentials
end
