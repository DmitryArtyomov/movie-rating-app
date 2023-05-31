namespace :data do
  desc 'Import Top 250 IMDB movies'
  task import: :environment do
    require_relative '../movie_importer'
    MovieImporter.new.import
  end
end
