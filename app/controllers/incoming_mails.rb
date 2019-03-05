class IncomingMailsController < ApplicationController
  protect_from_forgery with: :null_session

  def create

    Rails.logger.debug params[:plain]

    #Rails.logger.debug params.inspect
    #Rails.logger.debug "Received: #{params[:headers][:subject]} for #{params[:envelope][:to]}"
    #Rails.logger.debug params[:plain]

    #(params[:headers]['Subject'].strip == "Your shoes are listed!")

    Rails.logger.debug params[:headers]['Subject'].strip
    Rails.logger.debug params[:headers]['Subject'].strip == "Your shoes have sold!"

    if params[:headers]['Subject'].strip == "Your shoes are listed!"

      #style, price, stock = params[:plain].scan(/^(?:Style |Price \$|Stock \# )(.+)/).flatten
      #style.chomp!
      #price.chomp!
      #stock.chomp!



      tokens = params[:plain].split
      spot = tokens.index("Quantity")
      sizeOther = tokens[spot+1]
      quantityNum = tokens[spot+2]

      spot2 = tokens.index("#")

      Rails.logger.debug tokens[spot2-9]
      Rails.logger.debug tokens[spot2-7]

      style = tokens[spot2-9].strip
      price = tokens[spot2-7].delete("$").strip



      for i in spot2..(quantityNum.to_i)+(spot2)-1
        shoe = Shoe.where(:sku => style, :price => price.to_f, :size => sizeOther, :sold => "false", :stockId => nil).first
        if(shoe != nil)
          Rails.logger.debug "something"
          shoe.update_column(:stockId, tokens[i+1].chomp(","))
        end
      end


=begin
      shoe = Shoe.where(:sku => style, :price => price.to_f, :size => sizeOther, :sold => "false").first
      if(shoe != nil)
        shoe.update_column(:stockId, stock)
      end
=end
    elsif params[:headers]['Subject'].strip == "Your shoes have sold!"
      #stock = params[:plain].scan(/^(?:Stock \# )(.+)/).flatten

      #stock[0].chomp!
      #Rails.logger.debug stock[0]

      tokens = params[:plain].split
      spot = tokens.index("#")
      stock = tokens[spot+1]

      price2 = tokens[spot-7].delete("$").strip

      Rails.logger.debug stock

      shoe = Shoe.where(:stockId => stock).first
      if (shoe != nil)
        shoe.update_column(:sold, "true")
        if shoe.price != price2.to_f
          shoe.price = price2.to_f
        end
        userToUpdate = shoe.user_id
        user2 = User.where(:id => userToUpdate).first
        newSold = user2.sold + shoe.price
        user2.update_column(:sold, newSold)
        us
      end
    end

    #style, price, stock = ary[0].sub(/Style /, ''), ary[1].sub(/Price \$/, ''), ary[2].sub(/Stock # /, '')

  end
end
