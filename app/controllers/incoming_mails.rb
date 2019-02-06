class IncomingMailsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    #Rails.logger.info params[:headers] #=> "headers"=>{"Return-Path"=>"from@example.com", "Received"=>{"0"=>"by 10.52.90.229 with SMTP id bz5cs75582vdb; Mon, 16 Jan 2012 09:00:07 -0800", "1"=>"by 10.216.131.153 with SMTP id m25mr5479776wei.9.1326733205283; Mon, 16 Jan 2012 09:00:05 -0800", "2"=>"from mail-wi0-f170.google.com (mail-wi0-f170.google.com [209.85.212.170]) by mx.google.com with ESMTPS id u74si9614172weq.62.2012.01.16.09.00.04 (version=TLSv1/SSLv3 cipher=OTHER); Mon, 16 Jan 2012 09:00:04 -0800"}, "Date"=>"Mon, 16 Jan 2012 17:00:01 +0000", "From"=>"Message Sender <sender@example.com>", "To"=>"Message Recipient <to@example.com>", "Message-ID"=>"<4F145791.8040802@example.com>", "Subject"=>"Test Subject", "Mime-Version"=>"1.0", "Delivered-To"=>"to@example.com", "Received-SPF"=>"neutral (google.com: 10.0.10.1 is neither permitted nor denied by best guess record for domain of from@example.com) client-ip=10.0.10.1;", "Authentication-Results"=>"mx.google.com; spf=neutral (google.com: 10.0.10.1 is neither permitted nor denied by best guess record for domain of from@example.com) smtp.mail=from@example.com", "User-Agent"=>"Postbox 3.0.2 (Macintosh/20111203)"}
    #Rails.logger.info params[:headers]['Subject'] #=> "Test Subject"
    #Rails.logger.info params[:headers]['To'] #=> "to@example.com"
    #Rails.logger.info params[:headers]['From'] #=> "from@example.com"
    #Rails.logger.info params[:headers]['Received'] #=> {"0"=>"by 10.52.90.229 with SMTP id bz5cs75582vdb; Mon, 16 Jan 2012 09:00:07 -0800", "1"=>"by 10.216.131.153 with SMTP id m25mr5479776wei.9.1326733205283; Mon, 16 Jan 2012 09:00:05 -0800", "2"=>"from mail-wi0-f170.google.com (mail-wi0-f170.google.com [209.85.212.170]) by mx.google.com with ESMTPS id u74si9614172weq.62.2012.01.16.09.00.04 (version=TLSv1/SSLv3 cipher=OTHER); Mon, 16 Jan 2012 09:00:04 -0800"}
    #Rails.logger.info params[:headers]['Received']['0'] #=> "by 10.52.90.229 with SMTP id bz5cs75582vdb; Mon, 16 Jan 2012 09:00:07 -0800"
    #Rails.logger.info params[:headers]['Return-Path'] #=> "from@example.com"
    #Rails.logger.info params[:plain] #=> "Test with HTML."
    #Rails.logger.info params[:html] #=> "<html><head>\r\n<meta http-equiv=\"content-type\" content=\"text/html; charset=ISO-8859-1\"></head><body\r\n bgcolor=\"#FFFFFF\" text=\"#000000\">\r\nTest with <span style=\"font-weight: bold;\">HTML</span>.<br>\r\n</body>\r\n</html>"

    fields = params[:plain].match(/Price $(?<price>)/)
    puts fields[:price]

  end
end
