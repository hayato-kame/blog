
fnames = ["佐藤", "鈴木","高橋","田中"]
gnames = ["太郎","次郎","花子"]
email = ["aaaa","bbbb","cccc","dddd","eeee","ffff","gggg","hhhh","iiii","jjjj","kkkk","llll","mmmm","nnnn","oooo"]

(0..14).each do |number|
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