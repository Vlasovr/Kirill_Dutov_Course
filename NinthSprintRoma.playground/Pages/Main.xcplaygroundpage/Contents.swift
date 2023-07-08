import UIKit
import XCTest

//MARK: - 1 С помощью дженериков напишите функцию, которая возвращает наибольший тип в массиве.
enum EmptyError: Error {
    case empty(message: String)
}

func findMax<T: Comparable>(in array: [T]) throws -> T {
    guard !isEmpty(), let maxElement = array.max() else {
        throw EmptyError.empty(message: "No data")
    }
    return maxElement
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
}

let randomArray = (0..<10).map { _ in Int.random(in: 0...100) }
try findMax(in: randomArray)

let emptyArray = [Double]()

do {
    let maxElement = try findMax(in: emptyArray)
    print("max element is: \(maxElement)")
} catch EmptyError.empty(let message) {
    print(message)
}

//MARK: - 2 С помощью дженериков напишите функцию, которая принимает словарь и возвращает отсортированные по значению ключи
func sortKeys<T: Comparable, U>(in dictionary: [T: U]) -> [T]{
    return dictionary.keys.sorted(by: <)
}

let commonUsersData = [30: "Oleg", 10: "Misha", 15: "Tom", 40: "Kim"]
sortKeys(in: commonUsersData)
sortKeys(in:  ["Zubr": 10.0, "Mishel": 13, "Lea": 100, "Petrovich": 50])

//MARK: - 3 Напишите структуру данных Стек с помощью дженериков.
public struct Stack<T> {
    public var stackList = [T]()
    public var capasity: Int
    private var count: Int {
        return stackList.count
    }
    
    init(capasity: Int) {
        self.capasity = capasity
    }
    
    mutating public func push(_ element: T) {
        guard count < capasity else { print("Stack overflow"); return }
        stackList.append(element)
    }
    
    mutating public func pop() {
        stackList.removeLast()
    }
    
    mutating public func peek() throws -> T {
        guard !isEmpty(), let topElement = stackList.last else {
            throw EmptyError.empty(message: "No data")
        }
        return topElement
    }
    
    private func isEmpty() -> Bool {
        return stackList.isEmpty
    }
}

var assemblerCoding = Stack<Any>(capasity: 1)
assemblerCoding.push(commonUsersData)
assemblerCoding.push(randomArray)
assemblerCoding.capasity = 10
assemblerCoding.push(randomArray)
try assemblerCoding.peek()

//MARK: - 4 С помощью дженериков напишите функцию, которая возвращает массив с элементами, прошедшими условие (подсказка: условие должно быть замыканием)
func filterArray<T>(array: [T], condition: (T) -> Bool) -> [T] {
    return array.filter{ condition($0) }
}

let filteredNumbers = filterArray(array: randomArray, condition: { $0 % 2 == 0 } )
filteredNumbers

//MARK: - 5 С помощью дженериков напишите функцию, которая принимает два массива и возвращает массив из элементов, присутствующих в обоих массивах
func findDoubleAgent<T: Hashable>(_ firstArray: [T], _ secondArray: [T]) -> [T] {
    return Array(Set(firstArray).intersection(secondArray))
}

let dressColors = ["red", "green", "purple", "lime", "pink", "blue"]
let shoeColors = ["white", "lime", "black", "yellow", "green"]
findDoubleAgent(dressColors, shoeColors)

struct Person: Hashable {
    let name: String
    var age: Int
}

let personsList = [Person(name: "Allan", age: 90), Person(name: "Adolph", age: 100)]
let secondPersonsList = [Person(name: "Allan", age: 90), Person(name: "Sigma", age: 40), Person(name: "Walter", age: 50)]

findDoubleAgent(personsList, secondPersonsList)
findDoubleAgent(randomArray, emptyArray.map{ Int($0) } )

//MARK: - 6 Напишите свой пример использования паттерна Синглтон
public final class FilmsDatabase {
    static var shared = FilmsDatabase()
    var filmsList = ["Snow White and the Seven Dwarfs",
                     "PPinocchio",
                     "Fantasia",
                     "The Reluctant Dragon",
                     "Dumbo",
                     "Bambi",
                     "Saludos Amigos",
                     "Victory Through Air Power",
                     "PThe Three Caballeros",
                     "Make Mine Music",
                     "Song of the South",
                     "Fun and Fancy Free",
                     "Melody Time",
                     "So Dear to My Heart"
    ]
    
    private init() {}
    
    public func findFilm(_ film: String) -> Bool {
        return filmsList.contains(film)
    }
    
    public func removePirateFilm() -> [String] {
        return filmsList.filter{ !$0.hasPrefix("P") }
    }
}

extension FilmsDatabase: NSCopying, Equatable {
    public static func == (lhs: FilmsDatabase, rhs: FilmsDatabase) -> Bool {
        return lhs.filmsList == rhs.filmsList
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}

final class VideoPlayer {
    var lightMode = true
    var speedDefault = 1.0
    var autoQuality = InternetConnection.good
    
    enum InternetConnection {
        case great, good, bad
    }
    
    static func manageFilmDatabase() {
        let filmDatabase = FilmsDatabase.shared
        let filmDatabase2 = FilmsDatabase.shared
        
        if filmDatabase == filmDatabase2 {
            print(true)
        }
        
        filmDatabase.findFilm("PPinocchio")
        filmDatabase.removePirateFilm()
    }
    
    func playFilm() {}
}

let videoPlayer: () = VideoPlayer.manageFilmDatabase()

//MARK: - 7 Напишите свой пример использования паттерна Наблюдатель
protocol Observer: AnyObject {
    func update(video: String)
}

protocol Subject {
    func add(observer: Observer)
    func remove(observer: Observer)
    func notificate(video: String)
}

final class OnlyFans: Subject {
    var observers = [Observer]()
    var video = "" {
        didSet {
            notificate(video: video)
        }
    }
    
    func add(observer: Observer) {
        observers.append(observer)
    }
    
    func remove(observer: Observer) {
        if let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
        }
    }
    
    func notificate(video: String) {
        observers.forEach{ $0.update(video: video) }
    }
}

final class Subscriber: Observer {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func update(video: String) {
        print("Honey \(name) получил новое видео \(video)")
    }
}

let pupa = Subscriber(name: "Pupa Poshliy")
let lupa = Subscriber(name: "Lupa 13 years old")

let vladA4 = OnlyFans()
vladA4.add(observer: pupa)
vladA4.add(observer: lupa)
vladA4.notificate(video: "Руки базуки показал битку")
vladA4.notificate(video: "Tenderlybie сняла маску в эфире...")

//MARK: - 8 Напишите свой пример использования паттерна Фабричный метод
enum TransportType {
    case ground, air, sea
}

protocol Transport {
    var brend: String { get }
    var type: TransportType { get }
    var capasityOfBaggage: Double { get set }
    var yearOfManufacture: Int { get }
    var listOfOrders: [String] { get set }
    
    func repairedAndRefueld()
    func whichOrderIsLoaded()
}

final class Truck: Transport {
    var brend: String =  "EuroTruck"
    var type: TransportType = .ground
    var capasityOfBaggage: Double = 50.5
    var maxWeightOfBaggage: Double = 2000000
    var yearOfManufacture: Int = 2002
    var loadedWeight: Double = 0
    var loadedCapasity: Double = 0
    var listOfOrders: [String] = []
    var truckBody: TruckBody = .tented
    
    enum TruckBody {
        case tented, refrigerator, cistern
    }
    
    func whichOrderIsLoaded() {
        if listOfOrders.isEmpty {
            print("No orders that are loaded in the transport")
        } else {
            listOfOrders.forEach{ print("\($0) is loaded") }
        }
    }
    
    func repairedAndRefueld() {
        print("Your transport has been repaired and refueld")
    }
    
    private func sealingUp() {
        print("Sealing up is completed")
    }
    
    func truckCheckBody(_ order: OrderWithGoods) -> Bool {
        switch order.typeOfGoods {
        case .manufactureGoods:
            if truckBody == .tented || truckBody == .refrigerator {
                print("Your \(order.name) order with manufactured goods is in registration")
                return true
            } else {
                print("You are denied in registration \(order.name) order cause of not matching with type of body and goods")
                return false
            }
            
        case .perishableProducts:
            if truckBody == .refrigerator {
                print("Your \(order.name) order with perishable products is in registration")
                return true
            } else {
                print("You are denied in registration \(order.name) order cause of not matching with type of body and goods")
                return false
            }
            
        case .liquids:
            if truckBody == .cistern {
                print("Your order with liquids is in registration")
                return true
            } else {
                print("You are denied in registration \(order.name) order cause of not matching with type of body and goods")
                return false
            }
        }
    }
    
    func orderCheck(_ order: OrderWithGoods) {
        guard truckCheckBody(order) else { return }
        guard (order.weightOfGoods <= maxWeightOfBaggage && loadedWeight <= maxWeightOfBaggage) &&
                (order.sizeOfGoods <= capasityOfBaggage && loadedCapasity <= capasityOfBaggage) else {
            print("There is no enough space for \(order.name) order, we cancel it.")
            return
        }
        
        loadedWeight += order.weightOfGoods
        loadedCapasity += order.sizeOfGoods
        
        guard loadedWeight <= maxWeightOfBaggage && loadedCapasity <= capasityOfBaggage else { return }
        
        listOfOrders.append(order.name)
        repairedAndRefueld()
        sealingUp()
        print("Registration of your \(order.name) order is succeed!")
        print("Transport started from \(order.startPoint).")
    }
    
    func unloadingOrder(_ order: OrderWithGoods) {
        if let index = listOfOrders.firstIndex(of: order.name) {
            loadedCapasity -= order.sizeOfGoods
            loadedWeight -= order.weightOfGoods
            print("Your \(order.name) order with \(order.sizeOfGoods) m^3 and \(order.weightOfGoods) kilograms arrived in \(order.endPoint).")
            listOfOrders.remove(at: index)
        } else {
            print("You have no such order")
        }
    }
    
    func spaсeLeft() {
        print("There are \(capasityOfBaggage - loadedCapasity) m^3 and \(maxWeightOfBaggage - loadedWeight) kilograms left")
    }
}

final class PrivatePlain: Transport {
    var brend: String = "Belavia"
    var type: TransportType = .air
    var capasityOfBaggage: Double = 0
    var yearOfManufacture: Int = 2017
    var personsCapasity: Int = 7
    var peoplesCount: Int = 1
    var listOfOrders: [String] = []
    
    func repairedAndRefueld() {
        print("Your transport has been repaired and refueld")
    }
    
    private func cleaning() {
        print("Your transport has been cleaned")
    }
    
    func whichOrderIsLoaded() {
        if listOfOrders.isEmpty {
            print("No orders that are loaded in the transport")
        } else {
            listOfOrders.forEach{ print("\($0) is loaded") }
        }
    }
    
    func passengersOrderCheck(_ order: OrderWithPassengers) {
        guard order.amountOfPassengers <= personsCapasity && peoplesCount <= personsCapasity else { return }
        
        peoplesCount += order.amountOfPassengers
        
        guard peoplesCount <= personsCapasity else {
            print("There is no enough space for \(order.name) order, we cancel it.")
            return
        }
        
        listOfOrders.append(order.name)
        repairedAndRefueld()
        cleaning()
        print("Registration of your \(order.name) order is succeed!")
        print("Transport started from \(order.startPoint).")
    }
    
    func unloadingOrder(_ order: OrderWithPassengers) {
        if let index = listOfOrders.firstIndex(of: order.name) {
            print("Your \(order.amountOfPassengers) passengers arrived in \(order.endPoint).")
            peoplesCount -= order.amountOfPassengers
            listOfOrders.remove(at: index)
        } else {
            print("You have no such order")
        }
    }
    
    func sitsLeft() {
        print("There are \(personsCapasity - peoplesCount) sits left")
    }
}

class Ship: Transport {
    var brend: String = "Titanic"
    var type: TransportType = .sea
    var yearOfManufacture: Int = 2021
    var maxWeightOfBaggage: Double = 4000
    var capasityOfBaggage: Double = 20
    var personsCapasity: Int = 6
    var peoplesCount: Int = 1
    var loadedWeight: Double = 0
    var loadedCapasity: Double = 0
    var listOfOrders: [String] = []
    
    func repairedAndRefueld() {
        print("Your transport has been repaired and refueld")
    }
    
    private  func cleaning() {
        print("Your transport has been cleaned")
    }
    
    func whichOrderIsLoaded() {
        if listOfOrders.isEmpty {
            print("No orders that are loaded in the transport")
        } else {
            listOfOrders.forEach{ print("\($0) is loaded") }
        }
    }
    
    func orderCheck(_ order: OrderWithGoods) {
        guard (order.weightOfGoods <= maxWeightOfBaggage && loadedWeight <= maxWeightOfBaggage) &&
                (order.sizeOfGoods <= capasityOfBaggage && loadedCapasity <= capasityOfBaggage) else {
            print("There is no enough space for \(order.name) order, we cancel it.")
            return
        }
        
        loadedWeight += order.weightOfGoods
        loadedCapasity += order.sizeOfGoods
        
        guard loadedWeight <= maxWeightOfBaggage && loadedCapasity <= capasityOfBaggage else { return }
        
        listOfOrders.append(order.name)
        repairedAndRefueld()
        print("Registration of your \(order.name) order is succeed!")
        print("Transport started from \(order.startPoint).")
    }
    
    func unloadingOrder(_ order: OrderWithGoods) {
        if let index = listOfOrders.firstIndex(of: order.name) {
            loadedCapasity -= order.sizeOfGoods
            loadedWeight -= order.weightOfGoods
            print("Your \(order.name) order with \(order.sizeOfGoods) m^3 and \(order.weightOfGoods) kilograms arrived in \(order.endPoint).")
            listOfOrders.remove(at: index)
        } else {
            print("You have no such order")
        }
    }
    
    func orderWithPassengersCheck(_ order: OrderWithPassengers) {
        guard order.amountOfPassengers <= personsCapasity && peoplesCount <= personsCapasity else { return }
        
        peoplesCount += order.amountOfPassengers
        
        guard peoplesCount <= personsCapasity else {
            print("There is no enough space for \(order.name) order, we cancel it.")
            return
        }
        
        listOfOrders.append(order.name)
        repairedAndRefueld()
        cleaning()
        print("Registration of your \(order.name) order is succeed!")
        print("Transport started from \(order.startPoint).")
    }
    
    func unloadingOrderWithPassengers(_ order: OrderWithPassengers) {
        if let index = listOfOrders.firstIndex(of: order.name) {
            print("Your \(order.amountOfPassengers) passengers arrived in \(order.endPoint).")
            peoplesCount -= order.amountOfPassengers
            listOfOrders.remove(at: index)
        } else {
            print("You have no such order")
        }
    }
    
    func spaсeLeft() {
        print("There are \(capasityOfBaggage - loadedCapasity) m^3 and \(maxWeightOfBaggage - loadedWeight) kilograms left")
    }
    
    func sitsLeft() {
        print("There are \(personsCapasity - peoplesCount) sits left")
    }
}

final class TransportFactory {
    static let shared = TransportFactory()
    
    private init() { }
    
    func createTransport(type: TransportType) -> Transport {
        switch type {
        case .ground:
            return Truck()
        case .air:
            return PrivatePlain()
        case .sea:
            return Ship()
        }
    }
}

//реализация заказа груза
struct OrderWithGoods {
    var name: String
    var startPoint: String
    var endPoint: String
    var sizeOfGoods: Double
    var weightOfGoods: Double
    var typeOfGoods: TypeOfGoods
    
    enum TypeOfGoods {
        case manufactureGoods, perishableProducts, liquids
    }
}

//реализация заказа на пассажиров
struct OrderWithPassengers {
    let name: String
    let startPoint: String
    let endPoint: String
    let amountOfPassengers: Int
}

let euroTruckSimulator = TransportFactory.shared.createTransport(type: .ground) as? Truck
let belaviaPlane = TransportFactory.shared.createTransport(type: .air) as? PrivatePlain
let titanic = TransportFactory.shared.createTransport(type: .sea) as? Ship

let firstOrder = OrderWithGoods(name: "Evrotorg delivery", startPoint: "Minsk", endPoint: "Grodno", sizeOfGoods: 10, weightOfGoods: 3000, typeOfGoods: .manufactureGoods)

euroTruckSimulator?.orderCheck(firstOrder)
euroTruckSimulator?.loadedWeight
euroTruckSimulator?.loadedCapasity
euroTruckSimulator?.spaсeLeft()
euroTruckSimulator?.whichOrderIsLoaded()

let secondOrder = OrderWithPassengers(name: "Neighbourhood Cities", startPoint: "Brest", endPoint: "Pinsk", amountOfPassengers: 4)

belaviaPlane?.passengersOrderCheck(secondOrder)

let thirdOrder = OrderWithPassengers(name:"Across treep", startPoint: "Braslau", endPoint: "Bobruisk", amountOfPassengers: 1)

belaviaPlane?.passengersOrderCheck(thirdOrder)
belaviaPlane?.sitsLeft()
belaviaPlane?.unloadingOrder(thirdOrder)
belaviaPlane?.sitsLeft()
belaviaPlane?.whichOrderIsLoaded()

let fourthOrder = OrderWithGoods(name: "Gazprom", startPoint: "Moscow", endPoint: "Minsk", sizeOfGoods: 5, weightOfGoods: 200, typeOfGoods: .liquids)
let fifthOrder = OrderWithPassengers(name: "Imigrants", startPoint: "Algeria", endPoint: "France", amountOfPassengers: 32)
let sixthOrder = OrderWithGoods(name: "Paper", startPoint: "Slutsk", endPoint: "Mogilev", sizeOfGoods: 5, weightOfGoods: 100, typeOfGoods: .manufactureGoods)

titanic?.whichOrderIsLoaded()
titanic?.unloadingOrderWithPassengers(fifthOrder)
titanic?.spaсeLeft()
titanic?.sitsLeft()
titanic?.orderWithPassengersCheck(fifthOrder)
titanic?.orderCheck(fourthOrder)
titanic?.orderCheck(firstOrder)
titanic?.spaсeLeft()
titanic?.sitsLeft()
titanic?.whichOrderIsLoaded()
titanic?.unloadingOrder(fourthOrder)
titanic?.orderCheck(sixthOrder)
titanic?.unloadingOrder(sixthOrder)
titanic?.unloadingOrderWithPassengers(fifthOrder)
titanic?.spaсeLeft()

//MARK: - 9 Напишите свой пример использования паттерна Адаптер
protocol PlayProtocol {
    func play()
}

final class Player {
    var format: PlayProtocol
    
    init(format: PlayProtocol) {
        self.format = format
    }
}

final class MP4: PlayProtocol {
    func play() {
        print("Now MP4 file is playing")
    }
}

final class MOV: PlayProtocol {
    func play() {
        print("Now MOV file is playing")
    }
}

final class MKV: PlayProtocol{
    func play() {
        print("Now MKV file is playing")
    }
}

final class AVI: PlayProtocol {
    func play() {
        print("Now AVI file is playing")
    }
}

final class Audio {
    func playAudio() {
        print("Audiofile from video is playing now")
    }
}

final class AudioAdapter: PlayProtocol {
    private var audio: Audio
    
    init(_ audio: Audio) {
        self.audio = audio
    }
    
    func play() {
        audio.playAudio()
    }
}

let mp4Player = Player(format: MP4())
mp4Player.format.play()

mp4Player.format = AudioAdapter(Audio())
mp4Player.format.play()

//MARK: - 10 Напишите свой пример использования любого другого паттерна на ваш выбор(Посетитель)
//Тип посещаемого объекта
protocol Resort {
    func takeMoney(cash: inout Double) -> String
}

//Тип посетителя
protocol Tourist {
    var isSucker: Bool { get }
    var cash: Double { get set }
    
    func getToVacation(_ country: Egypt) -> String
    func drinOnTheBeach(_ beach: Egypt.Beach) -> String
    func visitNightClub(_ club: Egypt.NightClub) -> String
    func stayAtTheHotel(_ hotel: Egypt.Hotel) -> String
    
}

//Реализация посещаемого объекта
final class Egypt: Resort {
    func takeMoney(cash: inout Double) -> String {
        guard cash > 500 else { return "Get out pauper"}
        cash -= 500
        return "You are welcome"
    }
    
    final class Beach: Resort {
        func takeMoney(cash: inout Double) -> String {
            guard cash > 10 else { return "Get out pauper"}
            cash -= 10
            return "You are welcome"
        }
    }
    
    final class NightClub: Resort {
        func takeMoney(cash: inout Double) -> String{
            guard cash > 50 else { return "Get out pauper"}
            cash -= 50
            return "You are welcome"
        }
    }
    
    final class Hotel: Resort {
        func takeMoney(cash: inout Double) -> String {
            guard cash > 1 else { return "Get out pauper"}
            cash -= 1
            return "You are welcome"
        }
    }
}

//Реализация посетителя
final class Traveller: Tourist {
    var name: String
    var age: Int
    var cash: Double {
        didSet {
            if isSucker {
                cash = 0
            }
        }
    }
    var isSucker: Bool
    var isOnVacation: Bool
    
    
    init(name: String, age: Int, isSucker: Bool, cash: Double, isOnVacation: Bool = false) {
        self.name = name
        self.age = age
        self.isSucker = isSucker
        self.cash = cash
        self.isOnVacation = isOnVacation
    }
    
    deinit {
        print("Tourist fly home")
    }
    
    func getToVacation(_ country: Egypt) -> String {
        country.takeMoney(cash: &cash)
    }
    
    func drinOnTheBeach(_ beach: Egypt.Beach) -> String {
        beach.takeMoney(cash: &cash)
    }
    
    func visitNightClub(_ club: Egypt.NightClub) -> String{
        club.takeMoney(cash: &cash)
    }
    
    func stayAtTheHotel(_ hotel: Egypt.Hotel) -> String {
        hotel.takeMoney(cash: &cash)
    }
}

let egypt = Egypt()
let nudeBeach = Egypt.Beach()
let arabicNightClub = Egypt.NightClub()
let egyptHotel = Egypt.Hotel()
let tiredWorker = Traveller(name: "John", age: 40, isSucker: false, cash: 1000)

tiredWorker.getToVacation(egypt)
tiredWorker.visitNightClub(arabicNightClub)
tiredWorker.drinOnTheBeach(nudeBeach)
tiredWorker.cash

var suckerWorker: Traveller? = Traveller(name: "Sucker", age: 30, isSucker: true, cash: 1000)

suckerWorker?.getToVacation(egypt)
//так как он лох, его обокрали
suckerWorker?.drinOnTheBeach(nudeBeach)
suckerWorker = nil
