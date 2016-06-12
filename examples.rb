Product.average("price") # average price of product

Product.sum("price") # sum of price of all product

Product.maximum("price") # maximum price of product

Product.minimum("price") # minimum price of product

Product.where(name: 'TV') # only products with name = 'TV'

Product.where('price < ?',10000) # products where price less than 10000

#Task 2

Product.find(2).update(cart_id: Cart.find(2).id)   #Add some products to cart
Product.find(5).update(cart_id: Cart.find(2).id)   #Add some products to cart

Cart.find(2).update(account_id: Account.find(2).id)   #Get all products in cart for some account

Account.find(2).cart.products.sum(:price)    #Get total sum of products in cart for account
