# Killer facts about triangles AWW YEAH
class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = [side1, side2, side3]
    @angles = calculate_angles(side1, side2, side3)
  end

  def equilateral
    @sides.uniq.length == 1
  end

  def isosceles
    @sides.uniq.length == 2
  end

  def scalene
    !(equilateral || isosceles)
  end

  def radians_to_degrees(rads)
    (rads * 180 / Math::PI).round
  end

  def angle_radians(a, b, c)
    @rad_a = Math.acos((b**2 + c**2 - a**2) / (2.0 * b * c))
    @rad_b = Math.acos((a**2 + c**2 - b**2) / (2.0 * a * c))
    @rad_c = Math.acos((a**2 + b**2 - c**2) / (2.0 * a * b))
  end

  def calculate_angles(a, b, c)
  	angle_radians(a, b, c)
    ang_a = radians_to_degrees(@rad_a)
    ang_b = radians_to_degrees(@rad_b)
    ang_c = radians_to_degrees(@rad_c)
    [ang_a, ang_b, ang_c]
  end

  def recite_facts
    puts 'This triangle is equilateral!' if equilateral
    puts 'This triangle is isosceles! Also, that word is hard to type.' if isosceles
    puts 'This triangle is scalene and mathematically boring.' if scalene
    puts 'The angles of this triangle are ' + @angles.join(',')
    puts 'This triangle is also a right triangle!' if @angles.include? 90
    puts ''
  end
end

triangles = [
  [5, 5, 5],
  [5, 12, 13]
]
triangles.each do |sides|
  tri = Triangle.new(*sides)
  tri.recite_facts
end
