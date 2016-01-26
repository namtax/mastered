# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

john = User.create(name: 'john', password: 'password')
dave = User.create(name: 'dave', password: 'password')
mike = User.create(name: 'mike', password: 'password')