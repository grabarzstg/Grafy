# APX.2 (5 pkt.) 9.6 Problem lokalizacji szpitali /Problem k-centrum na R2/
# Zaimplementuj (4 pkt.) omawiany na wykladzie 2-przyblizony algorytm rozwiazujacy problem k-centrum 
# na plaszczyznie R2 z metryka euklidesowa, najlepiej w czasie O(kn) (+1 pkt), gdzie n jest liczba punktow wejsciowych.

City = Struct.new(:x, :y)
POINTS = Array.new
HOSPITALS = Array.new


data = File.readlines("data").each do |line|
	if line.start_with?('#')
		next
	end
	tmp = line.partition(/;/)
	POINTS << City.new(tmp[0].to_i, tmp[2].strip.to_i)
end
POINTS.sort!{|a,b,c| a.x <=> b.x}
K = data[0].delete('#').to_i; # wczytanie liczby szpitali
N = POINTS.length

$closestHospital = Array.new(N, Float::INFINITY)

#wyznacznie odleglosci pomiedzy miastami
def calculateDistance(city1, city2)
  a = (city1.x - city2.x).abs
  b = (city1.y - city2.y).abs
  return Math.sqrt((a*a)+(b*b))
end

def FurthestFirst(k)
  (0..(POINTS.length-1)).each do |i|
    dist = calculateDistance(HOSPITALS[k], POINTS[i])
    $closestHospital[i] = dist if dist < $closestHospital[i]
  end
  HOSPITALS << POINTS[$closestHospital.rindex($closestHospital.max)]
end


# MAIN
HOSPITALS[0] = POINTS[0] # pierwszy szpital
$closestHospital[0] = 0  # w pierwszym miescie jest szpital 
FurthestFirst(0)
#puts $closestHospital.to_s
#puts POINTS.to_s

(1..(K-1)).each do |k|
  puts HOSPITALS.to_s
  STDOUT.flush
  FurthestFirst(k)

end



# puts K
#puts POINTS.to_s
puts HOSPITALS.to_s
#puts calculateDistance(3,4)