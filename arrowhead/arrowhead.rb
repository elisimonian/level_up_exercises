class Arrowhead
  attr_accessor :region, :shape
  # This seriously belongs in a database.
  CLASSIFICATIONS = {
    far_west: {
      notched: "Archaic Side Notch",
      stemmed: "Archaic Stemmed",
      lanceolate: "Agate Basin",
      bifurcated: "Cody"
    },
    northern_plains: {
      notched: "Besant",
      stemmed: "Archaic Stemmed",
      lanceolate: "Humboldt Constricted Base",
      bifurcated: "Oxbow"
    }
  }

  # FIXME: I don't have time to deal with this.
  def initialize(region, shape)
    @region = region
    @shape = shape
  end
  
  def classify
    check_region
    check_shape
  end

  def check_region
    if CLASSIFICATIONS.include? @region
      @shapes = CLASSIFICATIONS[@region]
    else
      raise "Unknown region, please provide a valid region."
    end
  end

  def check_shape
    if @shapes.include? @shape
      arrowhead = @shapes[@shape]
      "You have a(n) '#{arrowhead}' arrowhead. Probably priceless."
    else
      raise "Unknown shape value. Are you sure you know what you're talking about?"
    end
  end
end

arrowhead = Arrowhead.new(:northern_plains, :bifurcated)
puts arrowhead .classify
