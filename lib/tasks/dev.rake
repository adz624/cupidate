namespace :dev do

  desc "Rebuild system"
  task :build => ['db:drop', 'db:create', 'db:migrate', 'db:seed']

  desc "Fake 資料可以寫在這裡"
  task :fake => :environment do
    User.create(email: 'fake@visionbundles.com', password: '88888888', password_confirmation: '88888888')
  end
end