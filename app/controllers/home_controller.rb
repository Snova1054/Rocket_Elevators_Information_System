require 'zendesk_main'

class HomeController < ApplicationController
  def index
  end
  
  def new
    @lead = Lead.new
  end

  def get
    @file = File.new
    end

  def create
    @lead = Lead.new(lead_params)
    ZendeskAPI::Ticket.create!($client, :subject => "Question", :requester => { :name => @lead.full_name, :email => "#{@lead.email}" }, :comment => { :body => "Subject: #{@lead.full_name} from #{@lead.company_name}
    Comment: The contact #{@lead.full_name} from company #{@lead.company_name} can be reached at email  #{@lead.email} and at phone number #{@lead.phone_number}. #{@lead.departement_in_charge_of_the_elevators} has a project named #{@lead.project_name} which would require contribution 
    from Rocket Elevators. 
    #{@lead.project_description}
    Attached Message: #{@lead.message}
    " }, :priority => "urgent")
    ApplicationMailer.send_mail(@lead).deliver_now
    @lead.save
    redirect_to "#home"
  end

  private

  def lead_params
    params.require(:lead).permit(:full_name, :company_name, :email, :phone_number, :project_name, :project_description, :departement_in_charge_of_the_elevators, :message, :file)
  end
end
