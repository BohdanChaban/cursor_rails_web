Account.create(name: 'Donatello', age: 28)
Account.create(name: 'Rafaello', age: 24)
Account.create(name: 'Gianfranco', age: 34)
Account.create(name: 'Cristiano', age: 37)
Account.create(name: 'Fernando', age: 37)

account = Account.find(1)
account.friends<<Account.find(2)
account.friends<<Account.find(3)
account.friends<<Account.find(4)
account.friends

Product.create(name: 'TV', description: 'Full HD TV', price: 12599.99)
Product.create(name: 'TV', description: 'Led TV', price: 7599.99)
Product.create(name: 'TV', description: 'Smart TV', price: 22399.99)
Product.create(name: 'TV', description: 'Smart TV New Edition', price: 28999.99)
Product.create(name: 'Refrigerator', description: 'Total capacity 340 l', price: 8999.99)
Product.create(name: 'Refrigerator', description: 'Total capacity 250 l', price: 5599.99)
Product.create(name: 'Refrigerator', description: 'Total capacity 220 l', price: 4899.99)
Product.create(name: 'Blender', description: 'Power 400 W', price: 1259.99)
Product.create(name: 'Smartphone', description: 'Apple iPhone 6', price: 13999.99)
Product.create(name: 'Smartphone', description: 'Lenovo Vibe S1', price: 7999.99)
Product.create(name: 'Smartphone', description: 'Samsung Galaxy J3', price: 4399.99)

Cart.create
Cart.create

Product.find(1).update(cart_id: Cart.find(2).id)
Product.find(2).update(cart_id: Cart.find(2).id)
Product.find(5).update(cart_id: Cart.find(2).id)

Cart.find(2).update(account_id: Account.find(2).id)

Account.find(2).cart.products

Account.find(2).cart.products.sum("price")
