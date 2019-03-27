class AnalyticsController < ApplicationController

  def index
    @total_walkee_count = total_walkee_count
    @total_walked_count = total_walked_count
    @total_gained_coins = total_gained_coins
    @total_spent_coins = total_spent_coins
    @total_users = total_users
    @open_appointments = open_appointments
    @scheduled_appointments = scheduled_appointments
    @closed_appointments = closed_appointments
    @user_with_most_coins = user_with_most_coins
  end

  private

  # Admin
  def open_appointments
    count = 0
    Appointment.all.each do |appointment|
      if appointment.status == "open"
        count += 1
      end
    end
    count
  end

  def scheduled_appointments
    count = 0
    Appointment.all.each do |appointment|
      if appointment.status == "scheduled"
        count += 1
      end
    end
    count
  end

  def closed_appointments
    count = 0
    Appointment.all.each do |appointment|
      if appointment.status == "closed"
        count += 1
      end
    end
    count
  end

  def total_users
    User.all.count
  end

  def user_with_most_coins
    current_most = nil
    current_user = nil
    User.all.each do |user|
      if current_most == nil
        current_most = user.token_balance
      elsif user.token_balance > current_most
        current_most = user.token_balance
        current_user = user
      end
    end
    current_user
  end

  # User

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

  def total_spent_coins
    tokens = 0
    walkee_closed_appointments.each do |appointment|
      if appointment.tokens != nil
        tokens += appointment.tokens
      end
    end
    tokens
  end

end
