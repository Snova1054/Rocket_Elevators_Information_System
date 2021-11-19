class Sendgrid < ApplicationMailer

    require 'sendgrid-ruby'
    include SendGrid
  
    def new_user
        @user = params[:user]
        mail(to: @user.email, from: 'rocketeam1234@gmail.com', subject: 'We will contact you soon!', body: 'Some body', template_id: 'd-8a2ec693c702403889db93d820d59ba8', 
            dynamic_template_data: {
                userCategory: @user.category 
            }
        )
    end
  end