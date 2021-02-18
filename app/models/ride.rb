class Ride < ActiveRecord::Base
    belongs_to :user
    validates :name, :date, :starting_time, :starting_location, presence: true
end 