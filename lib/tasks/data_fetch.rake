namespace :data do
  task :fetch => :environment do
    Fetcher.update_food_data
  end
end
