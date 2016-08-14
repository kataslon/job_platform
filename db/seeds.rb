# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Countries

Country.delete_all
City.delete_all

# Country.create([{country: 'Ukraine'}, {country: 'Russia'}, {country: 'Byelorussia'}, {country: 'Moldova'}])
uk = Country.create(country: 'Ukraine')
ru = Country.create(country: 'Russia')
be = Country.create(country: 'Byelorussia')
mo = Country.create(country: 'Moldova')

# Cities

kiev = City.create(city: 'Kiev', country_id: uk.id)
kiev = City.create(city: 'Kiev', country_id: uk.id)
dnipro = City.create(city: 'Dnipro', country_id: uk.id)
odessa = City.create(city: 'Odessa', country_id: uk.id)

moskow = City.create(city: 'Moskow', country_id: ru.id)
voronezh = City.create(city: 'Voronezh', country_id: ru.id)
s_petersburg = City.create(city: 'Saint Petersburg', country_id: ru.id)
kursk = City.create(city: 'Kursk', country_id: ru.id)

minsk = City.create(city: 'Minsk', country_id: be.id)
gomel = City.create(city: 'Gomel', country_id: be.id)
brest = City.create(city: 'Brest', country_id: be.id)
polotsk = City.create(city: 'Polotsk', country_id: be.id)

kishinev = City.create(city: 'Kishinev', country_id: mo.id)
balti = City.create(city: 'Balti', country_id: mo.id)
tiraspol = City.create(city: 'Tiraspol', country_id: mo.id)
