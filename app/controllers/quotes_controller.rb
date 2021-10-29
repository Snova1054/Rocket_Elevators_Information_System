class QuotesController < ApplicationController

    def new
      @quote = Quote.new
    end

    def index
      @quotes = Quote.all
    end

    def show
      @quote = Quote.find(params[:id])
    end
   
    def create
      @quote = Quote.new(quote_params)
      
      @quote.save
      redirect_to "#home"
    end

    def building_type
      @building_type = :building_type
    end

    def destroy
      @quote = Quote.find(params[:id])
      @quote.destroy
    
      redirect_to quotes_path
    end
       
    private
    def quote_params
      params.require(:quote).permit(:building_type, :appartement, :floor, :basement, :plan, :business, :parking, :cages, :occupant, :elevatorNeeded, :price, :fees, :totalPrice)
    end
    

end