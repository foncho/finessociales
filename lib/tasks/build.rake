# coding: UTF-8

task :config_files do
  sh "test -f #{Rails.root}/config/database.yml || cp #{Rails.root}/config/database.yml.example #{Rails.root}/config/database.yml"
end

task :clean do
  system "test -f rerun.txt && rm rerun.txt"
end

task :build => [:config_files, :clean, 'db:migrate', :test, :cucumber]