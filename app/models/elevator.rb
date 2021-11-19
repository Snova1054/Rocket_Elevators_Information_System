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
            notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
                defaults channel: "#elevator_operations",
                        username: "elevators_status_update"
            end

            notifier.ping "The Elevator #{e.id} with Serial Number #{e.serial_number} changed status from #{oldStatus} to #{newStatus}"
        end
    end

    after_update do |e| 
    
        if e.status == "intervention"

            client = Twilio::REST::Client.new
            client.messages.create({
            from: ENV["twilio_phone_number"],
            to: '+15813073729', 
            body: "The Elevator #{e.id} with Serial Number #{e.serial_number} is in Intervention"
            })
            
        end
    end 
end
