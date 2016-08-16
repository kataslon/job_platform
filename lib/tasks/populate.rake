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
       Vacancy,
       User].each(&:delete_all)
    end

    desc 'Create test users with roles'
    task users: :environment do
      User.delete_all

      [:admin, :manager, :applicant].each do |role|
        FactoryGirl.create(
          :user, role,
          email: role.to_s + '@foo.bar',
          password: '12345678',
          password_confirmation: '12345678'
        )
      end

      10.times do
        FactoryGirl.create :user
      end
    end

    desc 'Create countries and cities'
    task cities: :environment do
      Rake.application.invoke_task('db:seed')
    end

    desc 'Create fake companies'
    task companies: :environment do

      City.all.each do |city|
        2.times do
          user = FactoryGirl.create(
            :user, :company_owner,
            email: Faker::Internet.email,
            password: '12345678',
            password_confirmation: '12345678'
          )
          FactoryGirl.create( :company, city_id: city.id, user_id: user.id, approval: true )
        end

        2.times do
          user = FactoryGirl.create(
            :user, :company_owner,
            email: Faker::Internet.email,
            password: '12345678',
            password_confirmation: '12345678'
          )
          FactoryGirl.create( :company, city_id: city.id, user_id: user.id, approval: false )
        end
      end
    end

    desc 'Create fake specialities'
    task specialities: :environment do

      5.times do
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
    task :all => [:delete_all, :users, :cities, :companies, :specialities, :vacancies]

  end
end
