Tag.create!([
    { name: '室内飼育' },
    { name: '室外飼育' }
    ])

dog_name = ["柴犬" ,"ポメラニアン", "チワワ" ]
education_name= ["トイレ","食事","吠え癖"]


25.times do |n|
    kanji_name = Gimei.kanji
    User.create!(
        email:"#{n + 1}@test.com",
        password: "111111",
        name: kanji_name,
        opinion: "人懐っこくてすごくかわいいです"
    )
    end

25.times do |n|
name = dog_name[rand(0..2)]
education = education_name[rand(0..2)]
Dog.create!(
    user_id: "#{n+1}",
    name: name ,
    caption: "#{name}の#{education}のしつけ方法を教えてください。"
)
end

25.times do |n|
dog = Dog.find(n+1)
DogTag.create(
    dog_id: dog.id, tag_id: rand(1..2)
)
end
    ##Seedは上から順に行われるため、優先度が高いものから作成