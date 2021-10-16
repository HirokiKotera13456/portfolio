Tag.create!([
    { name: '小型犬' },
    { name: '中型犬' },
    { name: '大型犬'}
    ])


25.times do |n|
    kanji_name = Gimei.kanji
    User.create!(
        email:"#{n + 1}@test.com",
        password: "111111",
        name: kanji_name,
        opinion: "柴犬を飼ってます！人懐っこくてすごくかわいいです"
    )
    end

    # 25.times do |n|
    # Dog.create!(
    #     user_id: "#{n+1}",
    #     name:"ポメラニアン",
    #     caption: "柴犬のトイレのしつけ方法を教えてください。"
    # )
    # end
    
    ##Dogモデルの作成はUserモデルの作成を行ってから行う