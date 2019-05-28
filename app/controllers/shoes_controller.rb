require 'sendgrid-ruby'
include SendGrid
require 'json'


class ShoesController < ApplicationController

  #before_action :require_login



  before_action :set_shoe, only: [:show, :edit, :update, :destroy]


  # GET /shoes
  # GET /shoes.json
  def index
    @shoes = Shoe.all
  end

  # GET /shoes/1
  # GET /shoes/1.json
  def show
  end

  # GET /shoes/new
  def new
   @shoe = Shoe.new
  end


  # GET /shoes/1/edit

#  def edit
#  end

  # POST /shoes
  # POST /shoes.json
  def create
    @shoe = Shoe.new(shoe_params)
    new_shoes = (2..shoe_params[:quantity].to_i).collect { Shoe.new(shoe_params) }
    success = new_shoes.map(&:save)

    respond_to do |format|
     if @shoe.save
       format.html { redirect_to @shoe, notice: 'Shoe was successfully created.' }
       format.json { render :show, status: :created, location: @shoe }
     else
       format.html { render :new }
       format.json { render json: @shoe.errors, status: :unprocessable_entity }
     end
   end


  end

  def listed
    @shoes = Shoe.all
  end

  def sold
    @shoes = Shoe.all
  end

  def import
   if params[:file]
     Shoe.import(params[:file])
     redirect(root_url, "Activity Data imported!")	
   end
 end

  private
    def set_shoe
      @shoe = Shoe.find(params[:id])
    end

    def shoe_params
      params.require(:shoe).permit(:sku, :size,:price, :quantity).merge(user_id: current_user.id)
    end

end
