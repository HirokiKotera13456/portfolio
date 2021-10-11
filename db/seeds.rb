Tag.create!([
    { name: '小型犬' },
    { name: '中型犬' },
    { name: '大型犬'}
    ])

User.create!(
    email:"n1@n1",
    password: "111111",
    name: "ドッグさん"
)

50.times do |n|
    User.create!(
        email:"test#{n + 1}@test.com",
        password: "111111",
        name: "山田太郎",
        opinion: "柴犬を飼ってます！人懐っこくてすごくかわいいです"
    )
    end

15.times do |n|
    Dog.create!(
        user_id: "#{n+1}",
        name:"ポメラニアン",
        caption: "柴犬のトイレのしつけ方法を教えてください。"
    )
    end