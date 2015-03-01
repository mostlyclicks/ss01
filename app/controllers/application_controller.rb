class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_athletes, :load_home_athletes

  protected

  def load_athletes
    @athletes = Refinery::Athletes::Athlete.all
  end

  def load_home_athletes
    @home_athletes = Refinery::Athletes::Athlete.limit(3)
  end

end
