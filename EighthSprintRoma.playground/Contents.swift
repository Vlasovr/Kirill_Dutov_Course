import UIKit

//MARK: - 1 Написать класс в котором будут все уровни приватности, в классе должны быть свойства и методы на которых вы попрактикуетесь в уровнях доступа.
open class AccessControl {
    public var accessableValue = 0
    internal let basicValue = 0
    private(set) var employeesSalary: Double = 0
    fileprivate func showHearbeating() {}
    private func soul() {}
}

var security = AccessControl()
//security.soul - нет доступа
security.showHearbeating() // имеем доступ, так как находимся в этом файле с этим методом (сердцебиение для всех скрыто, если файл для врача, то для врача открыто)
security.employeesSalary // другой человек не сможет увидеть зарплату работника, но бухгалтер может
security.basicValue // св-во с дефолтным уровнем доступа, имеем доступ, так как находимся в том же модуле
security.accessableValue // имеем доступ, потому что имеем доступ к модулю

//MARK: - 2 Создайте протокол "CanFly", который требует от соответствующего класса иметь свойство "flightSpeed" и метод "fly()". Создайте класс "Bird", который реализует протокол "CanFly".
protocol CanFly {
    var flightSpeed: Double { get set }
    
    func fly()
}

class Bird: CanFly {
    var flightSpeed: Double
    var isFly: Bool {
       return flightSpeed > 0
    }
    
    init(flightSpeed: Double) {
        self.flightSpeed = flightSpeed
    }
    
    func fly() {
        print("I can fly!")
    }
}

let mockingBird = Bird(flightSpeed: 0)
mockingBird.isFly

//MARK: - 3 Создайте протокол "Playable", который требует от соответствующего класса иметь свойства "title" и "duration", а также метод "play()". Создайте класс "Song", который реализует протокол "Playable".
protocol PlayableProtocol {
    var title: String { get }
    var duration: Double { get }
    
    func play()
}

class Song: PlayableProtocol {
    var title: String
    var duration: Double
    
    init(title: String, duration: Double) {
        self.title = title
        self.duration = duration
    }
    
    func play() {
        print("\(title) длится \(duration)")
    }
}

let beatlesSong = Song(title: "Yesterday", duration: 5.00)

//MARK: - 4 Напишите реализацию протокола Comparable и примените его для сравнения двух объектов.
protocol Comparable: Equatable {
    static func <= (lhs: Self, rhs: Self) -> Bool

    static func >= (lhs: Self, rhs: Self) -> Bool

    static func < (lhs: Self, rhs: Self) -> Bool

    static func > (lhs: Self, rhs: Self) -> Bool
}

struct GymGoers {
    let name: String
    var age: Int
    var weight: Double
}

let gymMemberships = [GymGoers(name: "Фитоняшка", age: 19, weight: 60),
                        GymGoers(name: "Арнольд", age: 80, weight: 100),
                        GymGoers(name: "Пользователь Apple Fitness +", age: 30, weight: 160)]

func getHeaviest(memberships: [GymGoers]?) -> GymGoers {
    return memberships?.sorted(by: >).first ?? GymGoers(name: "No members found", age: 0, weight: 0)
}

getHeaviest(memberships: gymMemberships)

extension GymGoers: Comparable {
    static func > (lhs: GymGoers, rhs: GymGoers) -> Bool {
        return lhs.weight > rhs.weight
    }
    
    static func < (lhs: GymGoers, rhs: GymGoers) -> Bool {
        return lhs.weight < rhs.weight
    }
    
    static func >= (lhs: GymGoers, rhs: GymGoers) -> Bool {
        return lhs.weight >= rhs.weight
    }
    
    static func <= (lhs: GymGoers, rhs: GymGoers) -> Bool {
        return lhs.weight >= rhs.weight
    }
}

//MARK: - 5 Напишите реализацию протокола Equatable и примените его для сравнения двух объектов.
protocol Equtable {
    static func == (lhs: Self, rhs: Self) -> Bool
    
    static func != (lhs: Self, rhs: Self) -> Bool
}

extension GymGoers: Equatable {
    static func == (lhs: GymGoers, rhs: GymGoers) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age && lhs.weight == rhs.weight
    }
}

func getAccess(memberships: [GymGoers]?, visitor: GymGoers?) -> (isOpen: Bool, printMessage: String) {
    guard let memberships, let visitor else { return (false, "No members found") }
    
    for member in memberships {
        if member == visitor {
            return (isOpen: true, printMessage:"Accessed ^_^")
        }
    }
    return (false, "Access denied")
}

getAccess(memberships: gymMemberships, visitor: GymGoers(name: "Бомжара", age: 40, weight: 80))
getAccess(memberships: gymMemberships, visitor: GymGoers(name: "Арнольд", age: 80, weight: 100))

//MARK: - 6 Напишите суперкласс Птица в котором будут методы ходить и летать. Напишите два наследника этого класса для двух птиц одна из которых умеет ходить и летать, а другая умеет только ходить.
class Bird2 {
    func walk() {
        print("I can go!")
    }
    
    private func fly() {
        print("I can fly!")
    }
}

final class Goose: Bird2 {
    func fly() {
        print("I can fly!")
    }
}

let goose = Goose()
goose.walk()
goose.fly()

final class Pinguine: Bird2 {}

let pinguine = Pinguine()
pinguine.walk()

//MARK: - 7 Сделайте предыдущую задачу, но используйте протоколы для того, чтобы определить функциональность классов.
protocol WalkingProtocol {
    func walk()
}

protocol FlyingProtocol {
    func fly()
}

final class Flamingo: WalkingProtocol, FlyingProtocol {
    func fly() {
        print("I can fly")
    }
    
    func walk() {
        print("I can walk")
    }
}

final class Sparrow: FlyingProtocol {
    func fly() {
        print("I can only fly")
    }
}

//MARK: - 8 Напишите пример абстракции.
//абстрагируемся от незначимых характеристик
class Car {
    var speed: Double
    let numberOfWheels: Int
    var horsePower: Double
    var typeEngine: TypeEngine
    
    enum TypeEngine {
        case hydrol
        case electric
        case petrol
        case diesel
    }
    
    init(speed: Double, numberOfWheels: Int, horsePower: Double, typeEngine: TypeEngine) {
        self.speed = speed
        self.numberOfWheels = numberOfWheels
        self.horsePower = horsePower
        self.typeEngine = typeEngine
    }
    
    func refueling() {
        print("Перезаправка")
    }
    
    func startEngine() {
        print("Brrr")
    }
}

let bmw = Car(speed: 300.0, numberOfWheels: 4, horsePower: 200.0, typeEngine: .diesel)

//MARK: - 9 Напишите пример инкапсуляции.
final class Tesla: Car {
    var chargeCapasity: Double

    init(speed: Double, numberOfWheels: Int, horsePower: Double, typeEngine: Car.TypeEngine, chargeCapasity: Double) {
         self.chargeCapasity = chargeCapasity
         super.init(speed: speed, numberOfWheels: numberOfWheels, horsePower: horsePower, typeEngine: typeEngine)
    }

    override func startEngine() {
        isCharged() ? print("Silense") : print("Заряди меня уебан")
    }
    
    private func isCharged () -> Bool {
        chargeCapasity > 10
    }
}

final class BMW: Car {
    private var randomStart: Bool {
        Bool.random()
    }
    
    override func startEngine()  {
        randomStart ? print("Brr") : print("chchcchc")
    }
}

//MARK: - 10 Напишите пример полиморфизма
final class Tractor: Car {
    override func refueling() {
         print("Заправляй сеном")
    }
}

class AutomaticTransmission {
    func changeTransmissionAutomatically() {
        (1...5).forEach{ print("\($0) gear") }
    }
}
let fromZeroToMaxSpeed = AutomaticTransmission()
fromZeroToMaxSpeed.changeTransmissionAutomatically()

class PremiumCar: AutomaticTransmission {}

final class Mersedes: PremiumCar {}

final class CheapCar: AutomaticTransmission {}

let carsInStock: [AutomaticTransmission] = [Mersedes(), PremiumCar(), CheapCar()]

//MARK: - 11 Напишите аналог множественного наследования с помощью протоколов
protocol CarProtocol {
    func startEngine()
    
    func refueling()
}

protocol Product {
    var price: Double { get set }
    var isInStock: Bool { get set }
}

final class Lada: CarProtocol, Product {
    var price: Double
    
    var isInStock: Bool
    
    init(price: Double, isInStock: Bool) {
        self.price = price
        self.isInStock = isInStock
    }
    
    func startEngine() {
        print("Bo-bo-bo-booo")
    }
    
    func refueling() {
        print("Feed me")
    }
}

let car = Lada(price: 2332, isInStock: true)

//MARK: - 12 Напишите пример буквы S из SOLID
//Каждый класс должен отвечать только за одну операцию.

final class Hammle {
    private var material: String
    
    init(material: String) {
        self.material = material
    }
    
    func knock() {
        print("Тук-тук")
    }
    
    func hammer() {
        print("Забиваю твою крышку гроба")
    }
}

final class Drill {
    var nozzles: String
    
    init(nozzles: String) {
        self.nozzles = nozzles
    }
    
    func drilling() {
        print("Дрель вообще чумовой инструмент...")
    }
}

final class Saw {
    enum EngineType{
        case electric
        case petrol
    }
    
    func nag(engineType: EngineType) {
        engineType == .electric ? print("No smoke") : print("Smoke...")
    }
}
let saw = Saw()
saw.nag(engineType: .petrol)

//MARK: - 13 Напишите пример буквы O из SOLID
//Классы должны быть открыты для расширения, но закрыты для модификации(не изменяя существующий код)
class Figure {
    func area() -> Double {
        return 0
    }
}

final class Circle: Figure {
    var radius: Double
    var pi = 3.14
    
    init(radius: Double) {
        self.radius = radius
    }
    
    override func area() -> Double {
        return pi * radius * radius
    }
}

final class Rectangle: Figure {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    override func area() -> Double {
        return width * height
    }
}

final class AllAreaFinder {
    func sumArea(figures: [Figure]) -> Double {
        return figures.reduce(0) { $0 + $1.area() }
    }
}

//MARK: - 14 Напишите пример буквы L из SOLID
//Наследственность
class Barman {
    func pourBeer() {
        print("Keep your beer, please")
    }
}

final class Waiter: Barman {
    func acceptOrder() {
        print("What would you like?")
    }
    
    func giveCheck() {
        print("This is your check and I need tips))")
    }
}

let bestWaiter = Waiter()
Waiter().pourBeer()

//MARK: - 15 Напишите пример буквы I из SOLID
//Каждый класс делает то, что от него действительно требуется
protocol MakeMoneyProtocol {
    func earnMoney()
}

final class Fitter: MakeMoneyProtocol {
    func earnMoney() {
        func fitCars() {
            print("I feet cars")
        }
    }
}

final class Driver: MakeMoneyProtocol {
    func earnMoney() {
        func driving() {
            print("I could drive your car")
        }
    }
}

final class SalesMan: MakeMoneyProtocol {
    func earnMoney() {
        func sale() {
            print("I could sale your pen")
        }
    }
}

final class Engineer: MakeMoneyProtocol {
    func earnMoney() {
        func tracePCB() {
            print("I could design you a PCB")
        }
    }
}

//MARK: - 16 Напишите пример буквы D из SOLID
//Модули верхнего уровня не должны зависеть от модулей нижнего уровня
protocol Defect {
    var carName: String { get }
    var damage: String { get set }
}

final class DamagedCar: Defect {
    let carName: String
    var damage: String

    init(carName: String, damage: String) {
        self.carName = carName
        self.damage = damage
    }
}

final class Autoservice {
    let damagedCars: [Defect]

    init(damagedCars: [Defect]) {
        self.damagedCars = damagedCars
    }

    func countQueue() -> Int {
        return damagedCars.count
    }
}

let porsche = DamagedCar(carName: "Porsche", damage: "Engine")
let honda = DamagedCar(carName: "Honda", damage: "Suspension")
let autoservice = Autoservice(damagedCars: [porsche, honda])
print("There are \(autoservice.countQueue()) damaged cars")

protocol BankCard {
    var moneyAmount: Double {get set}
}

class Wallet: BankCard {
    var moneyAmount: Double
    
    init(moneyAmount: Double) {
        self.moneyAmount = moneyAmount
    }
    
}

class Purchase {    // Покупка
    var price: Double
    
    init(price: Double) {
        self.price = price
    }
    
    func getBought(by wallet: inout BankCard) {
        wallet.moneyAmount -= price
        print("In wallet \(wallet.moneyAmount) left")
    }
}

var myWallet: BankCard = Wallet(moneyAmount: 1000)
let food = Purchase(price: 450.89)
food.getBought(by: &myWallet)

//MARK: - 17 Напишите примеры приведения типов. Чем больше, тем лучше
//1
final class Employee {
    let name: String
    var post: String
    var salary: Double
    
    init(name: String, post: String, salary: Double) {
        self.name = name
        self.post = post
        self.salary = salary
    }
}

var apple: [AnyObject]  = [Employee(name: "Bob", post: "Engineer", salary: 400.0),
                           Employee(name: "Tim Cock", post: "CEO", salary: 1000),
                           Employee(name: "Johny", post: "Designer", salary: 0),
                           bmw, bestWaiter, autoservice, goose, pinguine, beatlesSong]

func givePremium(employeeList: [AnyObject]) -> [Employee] {
    var realEmpolyees: [Employee] = []
    
    for employee in employeeList {
        if let realEmpolyee = employee as? Employee {
            realEmpolyees.append(realEmpolyee)
        }
    }
    
    realEmpolyees = realEmpolyees.map{ employee in
        let employeeCopy = employee
        employeeCopy.salary += 200
        return employeeCopy
    }
    return realEmpolyees
}

givePremium(employeeList: apple)

let steve = Employee(name: "Steve", post: "CEO", salary: 0.15)
apple.append(steve)
givePremium(employeeList: apple)

//2
class SpareName {
    var name: String
    init(name: String) {
        self.name = name
    }
}

final class Vehicle: SpareName {
    var wheels: Int
    
    init(name: String, wheels: Int) {
        self.wheels = wheels
        super.init(name: name)
    }
}

final class CarDoors: SpareName {
    var doors: Int
    
    init(name: String, doors: Int) {
        self.doors = doors
        super.init(name: name)
    }
}

final class Transmission: SpareName {
    var unit = 1
}

let sparesList: [SpareName] = [Vehicle(name: "BMW", wheels: 2), Vehicle(name: "Lada", wheels: 4), Vehicle(name: "Maybach", wheels: 3), Vehicle(name: "Lamba", wheels: 5), CarDoors(name: "Bmw", doors: 5), CarDoors(name: "Lada", doors: 4), CarDoors(name: "Ferrari" ,doors: 6), CarDoors(name: "Volga", doors: 8), Transmission(name: "Lada"), Transmission(name: "Lamba"), Transmission(name: "Maybach")]

func checkAllDetails(in sparesList: [SpareName]) -> Int {
    var vehiclesCount = 0
    var carDoorsCount = 0
    var transmissionCount = 0
    
    for item in sparesList {
        if let vehicle = item as? Vehicle {
            print("Двигатель \(vehicle.name) имеет \(vehicle.wheels) колес(а)")
            vehiclesCount += 1
        } else if let carDoors = item as? CarDoors {
            print("От машины \(carDoors.name) \(carDoors.doors) двери(ей)")
            carDoorsCount += carDoors.doors
        } else if let transmission = item as? Transmission {
            print("Машина \(transmission.name) имеет подвеску")
            transmissionCount += transmission.unit
        }
    }
    return vehiclesCount + carDoorsCount + transmissionCount
}
checkAllDetails(in: sparesList)

func checkDetailsBrend(in sparesList: [SpareName]) {
    for item in sparesList {
        switch item {
        case let vehicle as Vehicle?:
            print("\(vehicle?.wheels ?? 0) колес(а) от \(vehicle?.name ?? "")")
        case let carDoors as CarDoors?:
            print("\(carDoors?.doors ?? 0) двери(ей) от \(carDoors?.name ?? "")")
        case let transmission as Transmission?:
            print("\(transmission?.unit ?? 0) подвеска(и) от \(transmission?.name ?? "")")
        default:
            break
        }
    }
}

checkDetailsBrend(in: sparesList)
 
//3
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

final class Employee2: Person {
    func arguing() {}
}

let john = Person(name: "John", age: 30)

if john is Employee2 {
    let employeeJohn = john as? Employee2
    employeeJohn?.arguing()
}
