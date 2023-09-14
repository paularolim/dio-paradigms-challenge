import Foundation

protocol Vehicle: AnyObject {
    var brand: String { get }
    var model: String { get }
    var maxSpeed: Double { get }
    var fuelCapacity: Double { get }
    var fuelQuantity: Double { get }
    
    func fuel(quantity: Double)
    func performMaintenance()
}

protocol LandVehicle: Vehicle {
    func ride()
}

protocol SeaVehicle: Vehicle {
    func sail()
}

protocol AirVehicle: Vehicle {
    func fly()
}

enum EletricCarType {
    case battery
    case hydrogen
}

class ElectricCar: LandVehicle {
    let type: EletricCarType
    var brand: String
    var model: String
    var maxSpeed: Double
    var fuelCapacity: Double
    var fuelQuantity: Double
    
    init(type: EletricCarType, brand: String, model: String, maxSpeed: Double, fuelCapacity: Double) {
        self.type = type
        self.brand = brand
        self.model = model
        self.maxSpeed = maxSpeed
        self.fuelCapacity = fuelCapacity
        self.fuelQuantity = 0.0
    }
    
    func ride() {
        if fuelQuantity > 0 {
            print("The electric car \(brand) - \(model) is ridding.")
        } else {
            print("The electric car \(brand) - \(model) needs fuel.")
        }
    }

    func fuel(quantity: Double) {
        let updatedFuel = fuelQuantity + quantity
        if fuelCapacity >= updatedFuel {
            self.fuelQuantity += quantity
            print("The car was filled.")
        } else {
            self.fuelQuantity = fuelCapacity
            print("Fuel capacity is complete.")
        }
    }
    
    func performMaintenance() {
        print("The electric car '\(brand) - \(model)' is undergoing maintenance.")
    }

}

class GasCar: LandVehicle {
    var brand: String
    var model: String
    var maxSpeed: Double
    var fuelCapacity: Double
    var fuelQuantity: Double
    
    init(brand: String, model: String, maxSpeed: Double, fuelCapacity: Double) {
        self.brand = brand
        self.model = model
        self.maxSpeed = maxSpeed
        self.fuelCapacity = fuelCapacity
        self.fuelQuantity = 0.0
    }
    
    func ride() {
        if fuelQuantity > 0 {
            print("The gas car \(brand) - \(model) is ridding.")
        } else {
            print("The gas car \(brand) - \(model) needs fuel.")
        }
    }
    
    func fuel(quantity: Double) {
        let updatedFuel = fuelQuantity + quantity
        if fuelCapacity >= updatedFuel {
            self.fuelQuantity += quantity
            print("The gas car \(brand) - \(model) was filled.")
        } else {
            self.fuelQuantity = fuelCapacity
            print("The gas car \(brand) - \(model) fuel capacity is complete.")
        }
    }
    
    func performMaintenance() {
        print("The gas car '\(brand) - \(model)' is undergoing maintenance.")
    }
}

class Yacht: SeaVehicle {
    var brand: String
    var model: String
    var maxSpeed: Double
    var fuelCapacity: Double
    var fuelQuantity: Double
    
    init(brand: String, model: String, maxSpeed: Double, fuelCapacity: Double) {
        self.brand = brand
        self.model = model
        self.maxSpeed = maxSpeed
        self.fuelCapacity = fuelCapacity
        self.fuelQuantity = 0.0
    }
    
    func sail() {
        if fuelQuantity > 0 {
            print("The yacht is \(brand) - \(model) is sailing.")
        } else {
            print("The yacht \(brand) - \(model) needs fuel.")
        }
    }
    
    func fuel(quantity: Double) {
        let updatedFuel = fuelQuantity + quantity
        if fuelCapacity >= updatedFuel {
            self.fuelQuantity += quantity
            print("The yacht \(brand) - \(model) was filled.")
        } else {
            self.fuelQuantity = fuelCapacity
            print("The yacht \(brand) - \(model) fuel capacity is complete.")
        }
    }
    
    func performMaintenance() {
        print("The yacht '\(brand) - \(model)' is undergoing maintenance.")
    }
}

class Jet: AirVehicle {
    var brand: String
    var model: String
    var maxSpeed: Double
    var fuelCapacity: Double
    var fuelQuantity: Double
    
    init(brand: String, model: String, maxSpeed: Double, fuelCapacity: Double) {
        self.brand = brand
        self.model = model
        self.maxSpeed = maxSpeed
        self.fuelCapacity = fuelCapacity
        self.fuelQuantity = 0.0
    }
    
    func fly() {
        if fuelQuantity > 0 {
            print("The jet is \(brand) - \(model) is sailing.")
        } else {
            print("The jet \(brand) - \(model) needs fuel.")
        }
    }
    
    func fuel(quantity: Double) {
        let updatedFuel = fuelQuantity + quantity
        if fuelCapacity >= updatedFuel {
            self.fuelQuantity += quantity
            print("The jet \(brand) - \(model) was filled.")
        } else {
            self.fuelQuantity = fuelCapacity
            print("The jet \(brand) - \(model) fuel capacity is complete.")
        }
    }
    
    func performMaintenance() {
        print("The jet '\(brand) - \(model)' is undergoing maintenance.")
    }
}

struct Garage {
    private var vehicles: [Vehicle] = []
    private var vehicleCapacity: Int
    private var vehicleQuantity: Int
    
    init(vehicleCapacity: Int) {
        self.vehicles = []
        self.vehicleCapacity = vehicleCapacity
        self.vehicleQuantity = 0
    }
    
    mutating func addVehicle(vehicle: Vehicle) {
        if vehicleCapacity >= vehicleQuantity + 1 {
            vehicles.append(vehicle)
            vehicleQuantity += 1
            print("The vehicle was parked.")
        } else {
            print("The garage is full. Sorry. :(")
        }
    }
    
    mutating func removeVehicle(vehicle: Vehicle) {
        if vehicles.contains(where: { $0.model == vehicle.model }) {
            vehicles.removeAll(where: { $0.model == vehicle.model })
            vehicleQuantity -= 1
            print("The vehicle was removed from the garage.")
        } else {
            print("The vehicle is not in the garage. Sorry. :(")
        }
    }
    
    func listVehicles() {
        vehicles.forEach({ print("[\($0.self)] \($0.brand) - \($0.model)") })
    }
}

print("------------")
let electricCar = ElectricCar(type: .battery, brand: "BYD", model: "Yuan Plus", maxSpeed: 250.0, fuelCapacity: 80)
print("\(electricCar.brand) - \(electricCar.model)")
electricCar.performMaintenance()
electricCar.ride()
electricCar.fuel(quantity: 10.0)
electricCar.ride()

print("------------")
let gasCar = GasCar(brand: "Land Rover", model: "Evoque", maxSpeed: 230.0, fuelCapacity: 67.0)
print("\(gasCar.brand) - \(gasCar.model)")
gasCar.performMaintenance()
gasCar.ride()
gasCar.fuel(quantity: 70.0)
gasCar.ride()

print("------------")
let yacht = GasCar(brand: "Volvo", model: "D11", maxSpeed: 120.0, fuelCapacity: 50_000.0)
print("\(yacht.brand) - \(yacht.model)")
yacht.performMaintenance()
yacht.ride()
yacht.fuel(quantity: 1000.0)
yacht.ride()

print("------------")
let jet = GasCar(brand: "Embraer", model: "Legacy 600", maxSpeed: 900.0, fuelCapacity: 2_500.0)
print("\(jet.brand) - \(jet.model)")
jet.performMaintenance()
jet.ride()
jet.fuel(quantity: 800.0)
jet.ride()

print("------------")
var garage = Garage(vehicleCapacity: 2)
garage.addVehicle(vehicle: electricCar)
garage.addVehicle(vehicle: jet)
garage.addVehicle(vehicle: yacht)
garage.listVehicles()
garage.removeVehicle(vehicle: yacht)
