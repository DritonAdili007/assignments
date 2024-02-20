

class Product {
    var name: String?
    var price: Double?
    var size: String?
    var color: String?
}

class ProductBuilder {
    private var product: Product
    
    init() {
        self.product = Product()
    }
    
    func setName(_ name: String) -> ProductBuilder {
        product.name = name
        return self
    }
    
    func setPrice(_ price: Double) -> ProductBuilder {
        product.price = price
        return self
    }
    
    func setSize(_ size: String) -> ProductBuilder {
        product.size = size
        return self
    }
    
    func setColor(_ color: String) -> ProductBuilder {
        product.color = color
        return self
    }
    
    func build() -> Product {
        return product
    }
}

let product = ProductBuilder()
    .setName("Example Product")
    .setPrice(19.99)
    .setSize("Medium")
    .setColor("Blue")
    .build()

print("Product Details:")
if let name = product.name {
    print("Name: \(name)")
}
if let price = product.price {
    print("Price: \(price)")
}
if let size = product.size {
    print("Size: \(size)")
}
if let color = product.color {
    print("Color: \(color)")
}
