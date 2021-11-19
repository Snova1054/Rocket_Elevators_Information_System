require 'zendesk_main'

class QuotesController < ApplicationController
  before_action :authenticate_user!, :only => [:show]
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
    quote_price = @quote.price
    quote_elevator_needed = @quote.elevator_needed
    price_per_elevator = (quote_price.to_f / quote_elevator_needed.to_f)
    ZendeskAPI::Ticket.create!($client, :subject => "Task", :requester => { :name => @quote.company_name, :email => "#{@quote.email}" }, :comment => { :body => "Subject: #{@quote.company_name}

      Comment: The company #{@quote.company_name} has made a quote for a #{@quote.building_type} building and wants the #{@quote.plan} service. 
      
      quote informations: 
      #{@quote.elevator_needed}
      #{price_per_elevator.round(2)}
      #{@quote.price}
      #{@quote.fees}
      #{@quote.total_price}
      
      The company #{@quote.company_name} can be reached at #{@quote.email}." }, :priority => "urgent")
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
    params.require(:quote).permit(:email, :company_name, :building_type, :appartement, :floor, :basement, :plan, :business, :parking, :cages, :occupant, :elevator_needed, :price, :fees, :total_price)
  end
  

end