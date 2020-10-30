class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def not_enough_tickets
    "You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def not_tall_enough
    "You are not tall enough to ride the #{self.attraction.name}."
  end

  def take_ride
    if self.user.tickets < self.attraction.tickets
      self.user.height < self.attraction.min_height ? "Sorry. #{self.not_enough_tickets} #{self.not_tall_enough}" : "Sorry. #{self.not_enough_tickets}"
    elsif self.user.height < self.attraction.min_height
      "Sorry. #{self.not_tall_enough}"
    else
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
    end
  end

end
