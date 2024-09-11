require 'thread'

def palindrom_mu?(sayi)
  sayi_str = sayi.to_s
  sayi_str == sayi_str.reverse
end

def palindrom_bul(baslangic, bitis)
  palindromlar = []

  (baslangic..bitis).each do |sayi|
    if palindrom_mu?(sayi)
      palindromlar << sayi
    end
  end

  palindromlar
end

baslangic_zamani = Time.now

palindromlar = []

is_parcaciklari = []
4.times do |i|
  baslangic = i * 2500000 + 1
  bitis = (i + 1) * 2500000
  is_parcaciklari << Thread.new(baslangic, bitis) do |baslangic, bitis|
    palindromlar += palindrom_bul(baslangic, bitis)
  end
end

is_parcaciklari.each(&:join)

bitis_zamani = Time.now

calisma_suresi = bitis_zamani - baslangic_zamani

palindromlar.each do |palindrom|
  puts palindrom
end

puts "Toplam Palindrom Sayısı: #{palindromlar.count}"
puts "Kod #{calisma_suresi} saniyede tamamlandı."