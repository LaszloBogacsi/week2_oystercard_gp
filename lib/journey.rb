require_relative 'oystercard'


class Journey

attr_reader :in_journey, :entry_station, :exit_station, :current_journey
  PENALTY_FARE = 6
  FARE = 1

  def initialize
    @current_journey = {}
  end

  def start_journey(station)
    if @in_journey == true
      create_journey
    else
      create_journey
      @in_journey = true
      @entry_station = station
    end
  end

  def finish_journey(station)
    @exit_station = station
    @in_journey = false
  end

  def create_journey
    if @entry_station == nil
      @entry_station = "Incomplete journey"
    elsif @exit_station == nil
      @exit_station = "Incomplete journey"
    end
    @current_journey = { entry_station: @entry_station, exit_station: @exit_station }
    clear_current_journey
  end

  def clear_current_journey
    @entry_station = nil
    @exit_station = nil
  end

  def incomplete_journey
    @in_journey
  end

  def fare
    PENALTY_FARE if @entry_station == nil
    PENALTY_FARE if @exit_station == nil
    FARE if @entry_station != nil && @exit_station != nil
  end
end
