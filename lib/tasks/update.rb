namespace :update do
    desc 'get new records from all endpoints'
    task :all => :environment do
        [Story, Video, Gallery].map {|m| m.get_new}
    end
end
