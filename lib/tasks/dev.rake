namespace :dev do
  task fake_products: :environment do
    Product.destroy_all
    20.times do
      Product.create!(
        title: FFaker::Name.first_name,
        price: ( rand(500)+1 ) * 10,
        image: "https://fakeimg.pl/400x300/"
      )
    end
    puts "have created fake products"
    puts "now you have #{Product.count} products record"
  end
end
