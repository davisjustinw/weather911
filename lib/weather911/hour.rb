class Weather911::Hour
  attr_accessor :incidents, :observed

  def initialize
    @incidents = []
  end

  def add_incident(incident)
    @incidents << incident
  end

  def create_incident(type, address)
    add_incident(Weather911::Incident.new(type, address))
  end
  
end
