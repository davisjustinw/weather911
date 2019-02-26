
class Luned::Day
  attr_accessor :summary, :high, :low, :pressure, :moonphase, :calls, :observations
  attr_reader :time
  @@all = []

  def initialize(month, day)
      @time = Time.new(month.year, month.is, day.to_i)
      @calls = []
      @observations = []
      add
  end

  def self.create(month, day)
    self.new(month, day) if valid?(month, day)
  end

  def add
    @@all << self
  end

  def new_call(time, address, type, incident_number)
    Luned::Call.new(self, time, address, type, incident_number).tap { |call| @calls << call }
  end

  def new_observation(time, summary, temperature, pressure)
    Luned::Observation.new(self, time, summary, temperature, pressure).tap { |obs| @observations << obs }
  end

  def count
    @calls.size
  end

  def self.all
    @@all
  end

  def self.delete_all
    @@all.clear
  end

  def self.valid?(month, day)
    DateTime.valid_date?(month.year, month.is, day.to_i)
  end



end