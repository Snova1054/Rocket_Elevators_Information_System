class ApplicationMailer < ActionMailer::Base
  require 'sendgrid-ruby'
  include SendGrid
  require './app/controllers/home_controller.rb'
  
  def send_mail(lead)

    @email = lead.email
    @full_name = lead.full_name
    @project_name = lead.project_name
    puts @full_name
    mail = SendGrid::Mail.new
    mail.from = Email.new(email: 'rocketeam1234@gmail.com')
    mail.subject = 'Rocket Elevator'
    personalization = Personalization.new
    personalization.add_to(Email.new(email: @email))
    personalization.add_dynamic_template_data({ 'full_name' => @full_name })
    personalization.add_dynamic_template_data({ 'project_name' => @project_name })  
    mail.add_personalization(personalization)
    mail.template_id = 'd-8a2ec693c702403889db93d820d59ba8'

    sg = SendGrid::API.new(api_key: ENV["SENDGRID_API_KEY"])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end
end