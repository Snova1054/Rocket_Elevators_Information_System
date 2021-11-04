class HomeController < ApplicationController
  def new
    @lead = Lead.new
  end

  def get
    @file = File.new
    end

  def create
    @lead = Lead.new(lead_params)
    
    @lead.save
    redirect_to "#home"
  end

  private

  def lead_params
    params.require(:lead).permit(:full_name, :compagny_name, :email, :phone_number, :project_name, :project_description, :departement_in_charge_of_the_elevators, :message, :file)
  end

  
  
  
  
  
  # def index
  # end
  # def quote
  # end
  # def commercial
  # end
  # def residential
  # end
end
