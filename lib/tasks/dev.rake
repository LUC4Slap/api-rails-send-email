require 'tty-spinner'

namespace :dev do
  desc "CONFIGURA BANCO DE DADOS"
  task setup: :environment do
    puts "DROPANDO BANCO"
    %x(rails db:drop:_unsafe)
    10.times { print "===" }
    puts

    puts "CRIANDO BANCO"
    %x(rails db:create)
    10.times { print "===" }
    puts

    puts "RODANDO MIGRATE"
    %x(rails db:migrate)
    10.times { print "===" }
  end

end
