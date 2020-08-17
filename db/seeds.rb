# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
NUMBER_OF_DEPARTMENTS = 10
NUMBER_OF_PRODUCTS = 100
NUMBER_OF_PROMOTIONS = 10
PRODUCTS_WITH_PROMOTIONS = []

# @param method [Symbol]
# @param times [Integer]
def spam_method(method, times)
  (0..times).each { send(method) }
end

def generate_product
  product = Product.create(
    department: Department.all.sample,
    name: Faker::Movie.title,
    price: Faker::Commerce.price
  )

  PRODUCTS_WITH_PROMOTIONS << product.id if Faker::Boolean.boolean
end

def generate_department
  Department.create(name: Faker::Commerce.department)
end

def generate_promotion
  Promotion.create(
    code: Faker::Hipster.words(number: 2).join('_').upcase,
    active: true,
    discount: rand
  )
end

def activate_promotions
  PRODUCTS_WITH_PROMOTIONS.each do |product_id|
    ProductsPromotion.create(
      product_id: product_id,
      promotion: Promotion.all.sample
    )
  end
end

spam_method :generate_department, NUMBER_OF_DEPARTMENTS
spam_method :generate_promotion, NUMBER_OF_PROMOTIONS
spam_method :generate_product, NUMBER_OF_PRODUCTS
activate_promotions
