50.times do |n|
  User.create!(
    email:"test#{n + 1}@test.com",
    password: "111111",
    name: "テスト#{n + 1}ユーザー",
  )
end

