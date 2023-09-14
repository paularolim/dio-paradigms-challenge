import Foundation

/// Class that represents a customer.
class Customer {
    private(set) var name: String
    private(set) var city: String
    private var orders: [Order] = []
    
    init(name: String, city: String) {
        self.name = name
        self.city = city
    }
    
    /// Adds an order to customer's order list.
    /// - Parameter order: an order of type Order.
    public func sendOrder(order: Order) {
        self.orders.append(order)
    }
    
    /// Returns all user's order.
    /// - Returns: [Order]
    public func getAllOrders() -> [Order] {
        return orders
    }
}

/// Struct that represents a file.
struct File {
    let path: String
}

/// Enum that represents an order status.
enum OrderStatus {
    case created
    case confirmed
    case closed
    case conclued
}

/// Class that represents an order.
class Order {
    private(set) var id: UUID
    private(set) var description: String
    private(set) var status: OrderStatus
    private(set) var createdAt: Date
    private(set) var updatedAt: Date
    private(set) var files: [File]? = nil
    
    init(description: String, files: [File]? = nil) {
        self.id = UUID()
        self.description = description
        self.status = .created
        self.createdAt = .now
        self.updatedAt = .now
        self.files = files
    }
    
    /// Mark order as confirmed.
    public func confirm() {
        self.status = .confirmed
        self.updatedAt = .now
    }
    
    /// Mark order as closed.
    public func close() {
        self.status = .closed
        self.updatedAt = .now
    }
    
    /// Mark order as conclued.
    public func conclude() {
        self.status = .conclued
        self.updatedAt = .now
    }
    
    /// Delete the file in the index or all files if fileIndex is nil.
    /// - Parameter fileIndex: index from file at array (optional).
    public func deleteFiles(fileIndex: Int? = nil) {
        if fileIndex != nil {
            files?.remove(at: fileIndex!)
            print("File at index \(fileIndex!).")
        } else {
            files = []
            print("All files deleted.")
        }
    }
}


let bob = Customer(name: "Bob", city: "Los Angeles")
let order1 = Order(description: "Awesome order...", files: [File(path: "path1"), File(path: "path2")])
let order2 = Order(description: "Amazing order...")

bob.sendOrder(order: order1)
bob.sendOrder(order: order2)

print("\(bob.name):")
bob.getAllOrders().forEach({ print("\($0.createdAt) - \($0.description) - \($0.status)") })

bob.getAllOrders()[0].conclude()
