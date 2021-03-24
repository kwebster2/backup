class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction
    # validates_presence_of :user_id, :attraction_id

    def take_ride
        if user.tickets < attraction.tickets && user.height < attraction.min_height 
            puts "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.height < attraction.min_height 
            puts "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets
            puts "Sorry. You do not have enough tickets to ride the #{attraction.name}."                
        else
            user.tickets - attraction.tickets
            user.nausea + attraction.nausea_rating
            user.happiness + attraction.happiness_rating
        end
    end
end
