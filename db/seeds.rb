
fnames = ["佐藤", "鈴木","高橋","田中"]
gnames = ["太郎","次郎","花子"]
email = ["aaaa","bbbb","cccc","dddd","eeee","ffff","gggg","hhhh","iiii","jjjj","kkkk","llll","mmmm","nnnn","oooo"]

(0..9).each do |number|
  User.create(
    name: "#{fnames[number % 4]} #{gnames[number % 3]}",
    email: "#{email[number]}" + number.to_s + "@example.com", 
    password: 'user!',
    password_confirmation: 'user!'
    )
end

0.upto(29) do |number|
  User.create(
    name: "John Doe#{number + 1}",
    email: "John#{number + 1}@example.com",
    password: 'user!',
    password_confirmation: 'user!'
    )
end 

body ="今日は、久しぶりに○○へ出かけてきました。\n\n" +
      "天気も良く、景色も最高でした。\n\n"


%w(佐藤\ 太郎 鈴木\ 次郎 高橋\ 花子).each do |name|
  user = User.find_by(name: name)
      
  0.upto(9) do |number|
    Entry.create(
      user: user,
      title: "最近の出来事#{number}",
      body: body
    )
  end 
end 