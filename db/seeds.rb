# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Picture.create(
  title: 'The old church on the coast of white sea',
  artist: 'Serey Ershov',
  url: 'http://bitmakerlasbs.s3.amazonaws.com/photogur/house.jpg'
)

Picture.create(
  title: 'TSea Power',
  artist: 'Stephen Scullion',
  url: 'http://bitmakerlasbs.s3.amazonaws.com/photogur/wave.jpg'
)

Picture.create(
  title: 'Into the poppies',
  artist: 'John Wilhelm',
  url: 'http://bitmakerlasbs.s3.amazonaws.com/photogur/girl.jpg'
)
