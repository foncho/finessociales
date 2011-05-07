# coding: UTF-8

def ask(question)
  print question + " "
  answer = STDIN.gets.chomp
  if answer == "" or answer.nil?
    return nil
  else
    return answer
  end
end

namespace :data do

  desc "Parse and import CSV data"
  task :import => :environment do
    require 'csv'

    Dir['data/*.csv'].each do |file|
      year_number = File.basename(file, '.csv')
      year = Year.find_by_year(year_number)
      if year
        # data set for this year already present, skip
      else
        # maybe we should use a DB transaction here but we enjoy living on the edge, don't you?

        # new data set
        puts "Importando el año #{year_number}."
        total_budget = ask("¿Cuál ha sido el importe total recaudado en millones a través del 0,7% de IRPF? (p.ej. 264.365.673,21 en 2011): ")
        social_percentage = ask("¿Cuál ha sido el porcentaje destinado a proyectos sociales? (si fue 78,2% introduce 78.2): ")
        foreing_percentage = ask("¿Cuál ha sido el porcentaje destinado a proyectos de cooperación en paises de desarrollo? (si fue 19,3% introduce 19.3): ")
        environmental_percentage = ask("¿Cuál ha sido el porcentaje destinado a proyectos de medioambiente? (si fue 2,5% introduce 2.5): ")

        year = Year.create!(:year => year_number, :budget => total_budget, :social_percentage => social_percentage, :foreing_percentage => foreing_percentage, :environmental_percentage => environmental_percentage)
        CSV.foreach(file, :headers => true) do |row|
          hash = row.to_hash
          group = Group.find_or_create_by_name(:name => hash['COLECTIVO'].strip)
          target = Target.find_or_create_by_name_and_group_id(:name => hash['PROGRAMA'].strip, :group_id => group.id)
          org = Organization.find_or_create_by_cif(:cif => hash['CIF'].strip, :name => hash['ENTIDAD'].strip)
          Project.create!(:title => hash['PROYECTO'].strip, :budget => hash['IMPORTE'].strip.gsub(/,/,'.'), :organization => org, :target => target, :year => year)
        end
      end
    end
  end

end
