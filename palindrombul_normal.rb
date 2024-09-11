# 1 ile 100000 arasındaki palindrom sayıları bulan Ruby kodu

def palindrom_mu?(sayi)
    sayi_str = sayi.to_s
    sayi_str == sayi_str.reverse
  end
  
  palindromlar = []
  
  baslangic_zamani = Time.now
  
  1.upto(10000000) do |sayi|
    if palindrom_mu?(sayi)
      palindromlar << sayi
    end
  end
  
  bitis_zamani = Time.now
  
  calisma_suresi = bitis_zamani - baslangic_zamani
  
  puts palindromlar
  puts "Kod #{calisma_suresi} saniyede tamamlandı."
  