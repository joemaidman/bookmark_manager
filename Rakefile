require 'data_mapper'
require_relative './app.rb'
task default: :upgrade #%w[test]

namespace :db do
  desc 'Upgrade the database'
    task :upgrade do
      DataMapper.finalize.auto_upgrade!
      puts 'Great success'
    end


  desc 'Migrate the database'
    task :migrate do
      DataMapper.finalize.auto_migrate!
      puts 'Great success'
    end

end
# task :test do
 
#   sh 'rspec'
# end