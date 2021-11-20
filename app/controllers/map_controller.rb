class MapController < ApplicationController 
    def index
        client = OpenWeather::Client.new(
            api_key: ENV["open_weather_api_key"]
          )
        buildings = Building.all
        @hash = Gmaps4rails.build_markers(buildings) do |b, marker|
            data = client.current_weather(lat: b.address.lat, lon: b.address.lng, units: 'metric')
            #infos[complete address, number of floors, name of the client (company contact)]
            amount_columns = 0
            amount_elevators = 0
            b.batteries.all.each do |battery|
                amount_columns += battery.columns.all.length()
                battery.columns.all.each do |column|
                    amount_elevators += column.elevators.all.length()
                end
            end
            infos = ["#{b.address.number_and_street}, #{b.address.city}, #{b.address.country}", b.building_detail.value.split(/, /)[3], b.customer.full_name_of_the_company_contact, b.batteries.all.length(), amount_columns, amount_elevators, b.full_name_of_the_technical_contact_for_the_building, data.main.temp]
            marker.lat b.address.lat
            marker.lng b.address.lng
            marker.picture({
            "url" => "https://i.imgur.com/Ad3Q4Jl.png",
            "width" =>  32,
            "height" => 32})
            marker.infowindow "#{infos[0]}, this building has #{infos[1]} floors. 
            Client's name is #{infos[2]}. The building has #{infos[3]} battery/ies and #{infos[4]} column(s) and #{infos[5]} elevator(s), and the technical's contact name is #{infos[6]}. The current temperature is #{infos[7]}°C"
        end
    end
end