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
        ['_1', '_2', '_3'].each do |n|
          # owner = create_owner(city.city + n) # ????? возникает ошибка валидации email, при этом в консоли User создается при такой формулировке
          owner = create_owner(city.to_s + n)
          create_company(city, owner, true)
        end

        ['_4', '_5', '_6'].each do |n|
          owner = create_owner(city.to_s + n)
          create_company(city, owner, false)
        end
      end

      company_owner = create_owner('company_owner')
      create_company(City.last, company_owner, true)
    end

    def create_owner(name)
        FactoryGirl.create(
          :user, :company_owner,
          email: name + '@foo.bar',
          password: '12345678',
          password_confirmation: '12345678'
        )
      end

    def create_company(city, owner, approval)
        company = FactoryGirl.build( :company, city_id: city.id, user_id: owner.id, approval: approval )
        company.save if Company.where(name: company.name) == []
    end

    desc 'Create fake specialities'
    task specialities: :environment do

      15.times do
        speciality = FactoryGirl.build :speciality
        speciality.save if Speciality.where(name: speciality.name) == []
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
