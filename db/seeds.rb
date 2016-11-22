# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Blog engine
Refinery::Blog::Engine.load_seed

# Added by Refinery CMS Teams extension
Refinery::Teams::Engine.load_seed

# Added by Refinery CMS Extensions extension
Refinery::Extensions::Engine.load_seed

# Added by RefineryCMS Copywriting engine
Refinery::Copywriting::Engine.load_seed

# Added by Refinery CMS Guides extension
Refinery::Guides::Engine.load_seed
