# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Athletes extension
Refinery::Athletes::Engine.load_seed

# Added by Refinery CMS Blog engine
Refinery::Blog::Engine.load_seed

# Added by Refinery CMS Videos extension
Refinery::Videos::Engine.load_seed

# Added by Refinery CMS Inquiries engine
Refinery::Inquiries::Engine.load_seed

Refinery::SepInquiries::Engine.load_seed

Refinery::OnlineConferences::Engine.load_seed

# Added by Refinery CMS Contributors extension
Refinery::Contributors::Engine.load_seed

# Added by Refinery CMS TeamMembers extension
Refinery::TeamMembers::Engine.load_seed

# Added by Refinery CMS Quotes extension
Refinery::Quotes::Engine.load_seed
