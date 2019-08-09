require 'faker'

User.destroy_all
City.destroy_all
Tag.destroy_all
Gossip.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all
Like.destroy_all
JoinTableGossipTag.destroy_all



10.times do
  tag = Tag.create(title: Faker::Games::Pokemon.name)
  city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code )
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::TvShows::Friends.quote ,email: Faker::Internet.email, age: Faker::Number.number(digits: 2), city: City.all.sample, password: Faker::TvShows::BreakingBad.episode)

end

10.times do
  my_artist = Faker::Artist.name
  Gossip.create(title: Faker::TvShows::BreakingBad.episode, content: "#{my_artist} is now #{Faker::Verb.ing_form} a #{Faker::House.furniture} with #{Faker::Artist.name}", user: User.all.sample)
  PrivateMessage.create(content: Faker::TvShows::RuPaul.quote, recipient: User.all.sample, sender:User.all.sample)
end

15.times do
	JoinTableGossipTag.create(tag: Tag.all.sample, gossip: Gossip.all.sample)
end

100.times do
	
		#Comment.create(content: Faker::TvShows::RuPaul.quote , parent: Gossip.all.sample, user: User.all.sample)
	
		Comment.create(content: Faker::TvShows::RuPaul.quote, gossip: Gossip.all.sample, user: User.all.sample)
	
end

20.times do

		Like.create(user: User.all.sample, gossip: Gossip.all.sample)
		Like.create(user: User.all.sample, comment: Comment.all.sample)
end