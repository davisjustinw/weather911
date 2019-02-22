class Weather911::Month

  attr_accessor :this_date, :incident_sums

  @@all = []

  def initialize(year, month)
      @this_date = Date.new(year.to_i, month.to_i, -1)
      @incident_sums = []
      @days = []
      add_month
  end

  def add_sum(sum)
    @incident_sums << sum
  end

  def add_month
    @@all << self
  end

  def add_day(day)
    @days << day
  end

  def first_of_month
    @this_date - (@this_date.day - 1)
  end
  
  def weekday(day)
    (first_of_month + (day - 1)).strftime('%w').to_i
  end

  def month
    @this_date.strftime('%b')
  end

  def year
    @this_date.strftime('%Y')
  end

  def self.get_all
    @@all
  end

  def self.delete_all
    @@all.clear
  end

  def days_in_month
    Date.new(@this_date.year, @this_date.month, -1).day
  end

  def self.valid?(year, month)
    Date.valid_date?(year.to_i, month.to_i, -1)
  end

  def self.create(year, month)
    self.new(year, month) if valid?(year, month)
  end

end
