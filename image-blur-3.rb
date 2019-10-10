class Image
  def initialize (array)
    @array = array
    @row_length = array.length
    @col_length = array[0].length
  end

  def output_image
    @array.each do |i|
      i.each do |cell|
        print cell
      end
      puts
    end
  end

  def blur(xi, yi)
    @array[xi -1][yi] = 1 unless xi == 0
    @array[xi +1][yi] = 1 unless xi >= @row_length-1
    @array[xi][yi -1] = 1 unless yi == 0
    @array[xi][yi +1] = 1 unless yi >= @col_length-1
  end

  def find_ones
    one_pixel = []

    @array.each_with_index do |x, xi|
      x.each_with_index do |y, yi|
        if y == 1
          one_pixel << [xi, yi]
        end
      end
    end
    return one_pixel
  end

  def transform (distance)
    distance.times do
      array_coords = find_ones
      array_coords.each do |x, y|
        blur(x, y)
      end
    end
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]])
image.output_image
puts '-'
image.transform(2)
image.output_image