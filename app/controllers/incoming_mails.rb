class IncomingMailsController < ApplicationController
  protect_from_forgery with: :null_session

  def create

    #Rails.logger.debug params.inspect
    #Rails.logger.debug "Received: #{params[:headers][:subject]} for #{params[:envelope][:to]}"
    #Rails.logger.debug params[:plain]

    style, price, stock = params[:plain].scan(/^(?:Style |Price \$|Stock \# )(.+)/).flatten
    #style, price, stock = ary[0].sub(/Style /, ''), ary[1].sub(/Price \$/, ''), ary[2].sub(/Stock # /, '')

    Rails.logger.debug style
    Rails.logger.debug price
    Rails.logger.debug stock

    tokens = params[:plain].split
    spot = tokens.index("Quantity")
    sizeOther = tokens[spot+1]

    Rails.logger.debug sizeOther


    shoe = Shoe.where(:size => sizeOther).first
    shoe.stockId = stock

  end
end
