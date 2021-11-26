class Elevator < ApplicationRecord
    belongs_to :column

    oldStatus = ""
    after_initialize do |e|
        oldStatus = e.status
    end
    after_update do |e|
        newStatus = e.status
        require 'slack-notifier'
        if newStatus != oldStatus
            notifier = Slack::Notifier.new ENV["slack_web_hook"] do
                defaults channel: "#elevator_operations",
                         username: "elevator_status_update"
              end
              
              notifier.ping "The Elevator #{e.id} with Serial Number #{e.serial_number} changed status from #{oldStatus} to #{newStatus}"
        end
    end

    after_update do |e| 
    
        if e.status == "intervention"

            client = Twilio::REST::Client.new
            client.messages.create({
            from: ENV["twilio_phone_number"],
            to: "#{e.column_id.building_id.technical_contact_phone_for_the_building}", 
            body: "The Elevator #{e.id} with Serial Number #{e.serial_number} is in Intervention"
            })
            
        end
    end
end