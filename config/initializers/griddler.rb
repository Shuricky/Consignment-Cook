Griddler.configure do |config|
  config.processor_class = EmailProcessor # This class will handle your incoming emails
  config.processor_method = :process # This method will be called in processor class
  config.reply_delimiter = '-- REPLY ABOVE THIS LINE --' # Split your body email
  config.email_service = :sendgrid # Which email service are you using
end
