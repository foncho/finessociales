# coding: UTF-8

namespace :data do

  desc "Parse and import data"
  task :import => :environment do
    doc = Nokogiri::HTML(File.open(File.join Rails.root, 'data', 'fucking-boe.html'))
  
    page = doc.xpath('//hr').first #.each do |page|
      10.times { page = page.next }
      puts "PRIMERA! => #{page}"

      if page.text.include? "ANEJO"
        4.times { page = page.next}
        puts "DESPUES DE ANEJO => #{page}"

        #Ahora toda un tipo de programa (ANUALES o PLURIANUALES)
        4.times { page = page.next }
        puts "DESPUES DEL TIPO DE PROGRAMA => #{page}"
      end

      if page.text.include? "NIF"
        #entonces es una tabla
        #hay que repetir hasta llegar a 
      elsif page.next.next.next.next.text.include? "NIF"
        #entonces es un programa
      else
        #es un colectivo
      end

      colectivo = 'WADUS'
      programa = 'WADUS WADUS'
      proyecto = 'WADUS WADUS WADUS'

    #end
  end

end
