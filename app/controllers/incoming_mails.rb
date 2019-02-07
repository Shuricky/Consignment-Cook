class IncomingMailsController < ApplicationController
  protect_from_forgery with: :null_session

  def create

    #Rails.logger.debug params.inspect
    #Rails.logger.debug "Received: #{params[:headers][:subject]} for #{params[:envelope][:to]}"
    #Rails.logger.debug params[:plain]
    Rails.logger.debug params[:headers][:subject]
    if params[:headers][:subject] == "Fwd: Your shoes are listed!"

      style, price, stock = params[:plain].scan(/^(?:Style |Price \$|Stock \# )(.+)/).flatten
      style.chomp!
      price.chomp!
      stock.chomp!
      tokens = params[:plain].split
      spot = tokens.index("Quantity")
      sizeOther = tokens[spot+1]
      shoe = Shoe.where(:sku => style, :price => price.to_f, :size => sizeOther, :sold => "false").first
      shoe.update_column(:stockId, stock)

    elseif params[:headers][:subject] == "Fwd: Your shoes have sold!"
      puts 'Hello'
      stock = params[:plain].scan(/^(?:Stock \# )(.+)/).flatten
      stock.chomp!
      Rails.logger.debug stock
      shoe = Shoe.where(:stockId => stock).first
      shoe.update_column(:sold, "true")

    end
    #style, price, stock = ary[0].sub(/Style /, ''), ary[1].sub(/Price \$/, ''), ary[2].sub(/Stock # /, '')







  end
end
