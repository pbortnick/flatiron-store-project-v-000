<<<<<<< HEAD
10.times do
=======
User.create(email: "janedoe@flatironschool.com", password: "password")

10.times do 
>>>>>>> 9a1efe8a44b879e895c4fe014f1733e369cd44fd
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

User.create(name: 'Pam', email: 'pbortnick@gmail.com', password: 'password')
