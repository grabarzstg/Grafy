# APX.2 (5 pkt.) 
# Zaimplementuj (4 pkt.) omawiany na wykladzie 2-przyblizony algorytm rozwiazujacy problem k-centrum 
# na plaszczyznie R2 z metryka euklidesowa, najlepiej w czasie O(kn) (+1 pkt), gdzie n jest liczba punktow wejsciowych.

City = Struct.new(:x, :y, :hospital)
POINTS = Array.new


data = File.readlines("data").each do |line|
	if line.start_with?('#')
		next
	end
	tmp = line.partition(/;/)
	POINTS << City.new(tmp[0].to_i, tmp[2].strip.to_i, false )
end

K = data[0].delete('#').to_i; # wczytanie liczby szpitali
N = POINTS.length

# MAIN

puts K
puts POINTS.to_s