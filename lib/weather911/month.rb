class Weather911::Month

  attr_accessor :this_date, :counts

  @@all = []

  def initialize(year, month)
      @time = Time.new(year.to_i, month.to_i, Time.days_in_month(month.to_i, year.to_i))
      @counts = []
      add_month
  end

  def add_month
    @@all << self
  end

  def add_count(count)
    @counts << count
  end

  def minmax_count
    min, max = counts.minmax_by { |day| day["count"].to_i }
    minmax = min["count"].to_i, max["count"].to_i
  end

  def self.all
    @@all
  end

  def self.delete_all
    @@all.clear
  end

  def days_in_month
    @time.day
  end

  def self.valid?(year, month)
    DateTime.valid_date?(year.to_i, month.to_i, -1)
  end

  def self.create(year, month)
    self.new(year, month) if valid?(year, month)
  end

##########################################################
=begin
  def month
    @time.strftime('%b')
  end

  def year
    @time.strftime('%Y')
  end

  def first_datetime
    DateTime.new(@time.year, @time.month, 1)
  end

  def last_int
    @time.day
  end

  def weekday(day)
    (first_day + (day - 1)).strftime('%w').to_i
  end
=end
end
