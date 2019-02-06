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
    size = tokens[spot+1]
    Rails.logger.debug size


    shoe = Shoe.find(:conditions => ["sku = ? AND size = ? AND price = ?", style, size, price.to_f])
    shoe.stockId = stock

  end
end
