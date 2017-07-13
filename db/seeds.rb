# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(nameUsers:"Vini",
             birthDate: Time.zone.now,
             sex: "Masculino",
             email: "vinilopes03@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             is_admin: true)
User.create!(nameUsers:"Gilmar",
             birthDate: Time.zone.now,
             sex: "Masculino",
             email: "gaxf12@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             is_admin: true)
User.create!(
             nameUsers:"Jorgera",
             birthDate: Time.zone.now,
             sex: "Masculino",
             email: "jorge@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             is_admin: true)

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(
               nameUsers: name,
               email: email,
               sex: true,
               birthDate: Time.zone.now,
               password:              password,
               password_confirmation: password,
               is_admin: false)

   10.times do |m|
     Post.create!(
          user_id: User.where(email: email).first.id,
          title: "Novas tecnologias e um pouco de lorem",
          content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit enim, iaculis ut ullamcorper vitae, gravida in sapien. Nunc malesuada congue dignissim. Proin volutpat justo id mi condimentum dignissim sit amet vitae libero. Duis ipsum risus, pharetra a nunc lobortis, sodales lacinia mauris. Sed at condimentum velit. Curabitur vel congue elit. Maecenas dapibus nunc a porttitor dictum. Donec sagittis, orci in consequat facilisis, risus nibh placerat nibh, a pulvinar massa felis non neque. Phasellus ac iaculis sapien, vitae tempus turpis. Proin feugiat leo mi, ut elementum nunc molestie at. Donec condimentum lectus risus, in lacinia ex viverra id. Nulla sit amet nisl nisi. Maecenas enim urna, sodales eu erat eget, varius iaculis purus. Sed convallis massa quis mi ultrices, ut iaculis dui malesuada. Aliquam non consectetur nisl. #ner #bait"
       )
   end
end