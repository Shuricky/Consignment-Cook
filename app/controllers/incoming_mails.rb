class IncomingMailsController < ApplicationController
  protect_from_forgery with: :null_session

  def create

    #Rails.logger.debug params.inspect
    #Rails.logger.debug "Received: #{params[:headers][:subject]} for #{params[:envelope][:to]}"
    #Rails.logger.debug params[:plain]
    Rails.logger.debug params[:headers]['Subject'].strip
    Rails.logger.debug params[:headers]['Subject'].strip == "Fwd: Your shoes have sold!"
    if params[:headers]['Subject'].strip == "Fwd: Your shoes are listed!"

      style, price, stock = params[:plain].scan(/^(?:Style |Price \$|Stock \# )(.+)/).flatten
      style.chomp!
      price.chomp!
      stock.chomp!
      tokens = params[:plain].split
      spot = tokens.index("Quantity")
      sizeOther = tokens[spot+1]
      shoe = Shoe.where(:sku => style, :price => price.to_f, :size => sizeOther, :sold => "false").first
      if(shoe != nil)
        shoe.update_column(:stockId, stock)
      end

    elsif params[:headers]['Subject'].strip == "Fwd: Your shoes have sold!"
      stock = params[:plain].scan(/^(?:Stock \# )(.+)/).flatten

      stock[0].chomp!
      Rails.logger.debug stock[0]
      shoe = Shoe.where(:stockId => stock).first
      if (shoe != nil)
        Rails.logger.debu
        shoe.update_column(:sold, "true")
      end
    end

    #style, price, stock = ary[0].sub(/Style /, ''), ary[1].sub(/Price \$/, ''), ary[2].sub(/Stock # /, '')

  end
end
