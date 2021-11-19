require 'zendesk_main'

class HomeController < ApplicationController
  def index
    buildings = Building.all
    @hash = Gmaps4rails.build_markers(buildings) do |b, marker|
      

      #infos[complete address, number of floors, name of the client (company contact)]
      infos = ["#{b.address.number_and_street}, #{b.address.city}, #{b.address.country}", b.building_detail.value.split(/, /)[3], b.customer.full_name_of_the_company_contact, ]
      marker.lat b.address.lat
      marker.lng b.address.lng
      marker.picture({
        "url" => "https://i.ibb.co/p3WG26h/favicon32.png",
        "width" =>  32,
        "height" => 32})
        marker.infowindow "#{infos[0]}, this building has #{infos[1]} floors. 
        Client's name is #{infos[2]}"
      end
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
