namespace :db do
  namespace :populate do
    require 'factory_girl_rails'
    require 'faker'

    desc 'delete_all'
    task delete_all: :environment do
      [Country,
       City,
       Company,
       Speciality,
       Vacancy].each(&:delete_all)
    end

    desc 'Create countries and cities'
    task cities: :environment do
      Rake.application.invoke_task('db:seed')
    end

    desc 'Create fake companies'
    task companies: :environment do

      City.all.each do |city|
        5.times do
          FactoryGirl.create( :company, city_id: city.id )
        end
      end
    end

    desc 'Create fake specialities'
    task specialities: :environment do

      25.times do
        FactoryGirl.create :speciality
      end
    end

    desc 'Create fake vacancies'
    task vacancies: :environment do

      Company.all.each do |company|
        5.times do
          FactoryGirl.create( :vacancy, company_id: company.id,
                               speciality_id: Speciality.order('RANDOM()').first.id )
        end
      end
    end

    desc 'Erase and fill database with fake data'
    task :all => [:delete_all, :cities, :companies, :specialities, :vacancies]

  end
end
