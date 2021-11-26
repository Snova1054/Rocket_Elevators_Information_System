class Lead < ApplicationRecord
  def initialize(params = {})
    if params.nil?
    else
      file = params.delete(:file)
      super
      if file
        self.filename = sanitize_filename(file.original_filename)
        self.content_type = file.content_type
        self.file_contents = file.read
      end
    end
  end
  private
    def sanitize_filename(filename)
      # Get only the filename, not the whole path (for IE)
      # Thanks to this article I just found for the tip: http://mattberther.com/2007/10/19/uploading-files-to-a-database-using-rails
      return File.basename(filename)
    end

  customer = Customer.all

  after_create do |l|
    leadsEmail = l.email
    customer.each do |c|
      if leadsEmail == c.email_of_the_company_contact 
        f_typ = "#{l.content_type}"
        if f_typ.include? "png"
            f_typ = "png"
        elsif f_typ.include? "jpeg"
            f_typ = "jpg"
        elsif f_typ.include? "zip"
            f_typ = "zip"
        elsif f_typ.include? "pdf"
            f_typ = "pdf"
        end
        require 'dropbox_api'
        client = DropboxApi::Client.new(ENV["DROPBOX_OAUTH_BEARER"])

        result = client.search("#{l.company_name}")
        match = result.matches.first

        if match == nil
            folder = client.create_folder("/#{l.company_name}")
            file = client.upload("/#{l.company_name}/#{project_name}.#{f_typ}", l.file_contents)
            l.file_contents = nil
        else

            puts "#{match.resource.name}"
            file = client.upload("/#{l.company_name}/#{project_name}.#{f_typ}", l.file_contents)
            l.file_contents = nil
        end
      end 
    end
  end
end
