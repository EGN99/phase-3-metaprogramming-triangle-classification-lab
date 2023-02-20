class Triangle
   attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate_triangle
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    if side1 <= 0 || side2 <= 0 || side3 <= 0
      raise TriangleError, "All sides must be greater than 0"
    elsif side1 + side2 <= side3 || side2 + side3 <= side1 || side1 + side3 <= side2
      raise TriangleError, "Sum of lengths of any two sides must be greater than the third side"
    end
  end

  class TriangleError < StandardError
  end
end
