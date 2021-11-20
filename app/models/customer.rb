class Customer < ApplicationRecord
    belongs_to :user
    belongs_to :address
    has_many :buildings

    oldEmail = ""
    leads = Lead.all

    after_initialize do |c|
        oldEmail = c.email_of_the_company_contact
    end

    
    
    after_update do |c|
        newEmail = c.email_of_the_company_contact
        
        if newEmail != oldEmail
            leads.each do |l|
                f_typ = "#{l.content_type}"
                if f_typ.include? "png"
                    f_typ = "png"
                elsif f_typ.include? "jpg"
                    f_typ = "jpg"
                elsif f_typ.include? "zip"
                    f_typ = "zip"
                elsif f_typ.include? "pdf"
                    f_typ = "pdf"
                end
                project_name = l.project_name.gsub(/\s+/, "")
                if newEmail == l.email
                    require 'dropbox_api'
                    client = DropboxApi::Client.new(ENV["DROPBOX_OAUTH_BEARER"])

                    result = client.search("#{l.company_name}")
                    match = result.matches.first

                    if match == nil
                        folder = client.create_folder("/#{l.company_name}")
                        file = client.upload("/#{l.company_name}/#{project_name}.#{f_typ}", l.file_contents)
                        l.file_contents = ""
                    else

                        puts "#{match.resource.name}"
                        file = client.upload("/#{l.company_name}/#{project_name}.#{f_typ}", l.file_contents)
                        l.file_contents = ""
                    end
                end
            end    
        end
    end
end
