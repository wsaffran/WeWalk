class AnalyticsController < ApplicationController

  def index
    @total_walkee_count = total_walkee_count
    @total_walked_count = total_walked_count
    @total_gained_coins = total_gained_coins
  end

  private

  def walkee_closed_appointments
    appointments = []
    Appointment.all.each do |appointment|
      if current_user.id == appointment.dog.user.id && appointment.status == "complete"
        appointments << appointment
      end
    end
    appointments
  end

  def total_walkee_count
    count = 0
    walkee_closed_appointments.each do |appointment|
      count += 1
    end
    count
  end

  def walked_closed_appointments
    appointments = []
    Appointment.all.each do |appointment|
      if current_user.id == appointment.walker_id && appointment.status == "complete"
        appointments << appointment
      end
    end
    appointments
  end

  def total_walked_count
    count = 0
    walked_closed_appointments.each do |appointment|
      count += 1
    end
    count
  end

  def total_gained_coins
    tokens = 0
    walked_closed_appointments.each do |appointment|
      if appointment.tokens != nil
        tokens += appointment.tokens
      end
    end
    tokens
  end

end
