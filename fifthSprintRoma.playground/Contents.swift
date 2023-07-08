import UIKit

enum Currency {
    static let dollar = "USD"
    static let belorissianRuble = "BYN"
    static let russianRuble = "RUB"
}

//№1
//Напишите класс "Rectangle" с полями width и height, которые хранят ширину и высоту прямоугольника.
class Rectangle {
    var width: Double, height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}

let smallRectangle = Rectangle(width: 2.5, height: 4.1)

//№2
//Создайте класс "Человек". Добавьте свойства "имя", "фамилия", "возраст".
class Human {
    let firstName: String
    let lastName: String
    var age: Int
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}

let elonMusk = Human(firstName: "Elon", lastName: "Musk", age: 51)

//№3
//Создайте класс "Отель". Добавьте свойства "название", "количество звезд", "рейтинг".
class Hotel {
    let name: String
    var starsQuantity: Int
    var rating: Double
    
    init(name: String, starsQuantity: Int, rating: Double) {
        self.name = name
        self.starsQuantity = starsQuantity
        self.rating = rating
    }
}

let welcomeToTheHotel = Hotel(name: "California", starsQuantity: 5, rating: 4.8)

//№4
//Создайте класс "Школа". Добавьте свойства "название", "адрес", "количество учеников".
class School {
    let officialDestination: String
    var location: String
    var quantityOfScholars: Int
    
    init(officialDestination: String,
         location: String,
         quantityOfScholars: Int) {
        self.officialDestination = officialDestination
        self.location = location
        self.quantityOfScholars = quantityOfScholars
    }
}

let gangstersSchool = School(officialDestination: "CJ's Academy", location: "West Coast, Compton, Groove Street, 714", quantityOfScholars: 4)

//№5
//Создайте класс “Продукт”. Добавьте свойство "название", "описание”, “цена”.
class Product {
    let name: String
    var description: String
    var price: (value: Int, currency: String)
    
    init(name: String, description: String, price: (value: Int, currency: String)) {
        self.name = name
        self.description = description
        self.price = price
    }
}

let horizontBook = Product(name: "HBook", description: "The first laptop of the Belarusian holding Horizont", price: (43900, Currency.russianRuble))

//№6
//Создайте класс "Калькулятор". Добавьте методы "сложение", "вычитание", "умножение" и "деление".
class Calculator {
    func addition(firstValue: Double, secondValue: Double) -> Double {
        firstValue + secondValue
    }
    
    func subtraction(firstValue: Double, secondValue: Double) -> Double {
        firstValue - secondValue
    }
    
    func multiplication(firstValue: Double, secondValue: Double) -> Double {
        firstValue * secondValue
    }
    
    func division(firstValue: Double, secondValue: Double) -> Double {
        firstValue / secondValue
    }
    
    func remainderOfDivision(firstValue: Double, secondValue: Double) -> Double {
        firstValue.truncatingRemainder(dividingBy: secondValue)
    }
}
let testCalculating = Calculator()
testCalculating.division(firstValue: 12, secondValue: 5)
testCalculating.multiplication(firstValue: 8.15, secondValue: 6.45)
testCalculating.remainderOfDivision(firstValue: 12, secondValue: 5)

//№7
//Создайте класс "Фигура". Добавьте метод вычисления площади.
class Figure {
    func area() -> Double {
        return 0.0
    }
}

class Square: Figure {
    var lengthOfSide: Double
    
    init(lengthOfSide: Double) {
        self.lengthOfSide = lengthOfSide
    }
    
    override func area() -> Double {
        lengthOfSide * lengthOfSide
    }
}
let largeSquare = Square(lengthOfSide: 50.29)
largeSquare.area()


//№8
//Создайте класс "Банковский счет". Добавьте методы “пополнить счет”, “снять со счета”, “получить актуальный баланс”.
class BankAccount {
    var account: (amount: Double, currency: String)
    
    init(account: (Double, String)) {
        self.account = account
    }
    
    func topUpAccount(by deposit: Double) -> Double {
        account.amount += deposit
        return account.amount
    }
    
    func withdrawFromAccount(amount: Double) -> Double {
        account.amount -= amount
        return account.amount
    }
    
    func printActualBalance() {
        print("You have \(account.amount) \(account.currency)")
    }
}
let sberAccount = BankAccount(account: (100, Currency.belorissianRuble))
sberAccount.topUpAccount(by: 200)
sberAccount.withdrawFromAccount(amount: 50)
sberAccount.printActualBalance()

//№9
//Создайте класс "Студент".  Сделайте метод, который принимает в себя массив оценок, сделайте метод который вернет нам средний бал студента.
class Student {
    func getAverageMark(in studentMarks: [Int]?) -> Double {
        guard let studentMarks else { return 0.0 }
        return ((Double(studentMarks.reduce(0, +)) / Double(studentMarks.count)) * 100).rounded() / 100 //заодно округлил до 2 знаков после запятой
    }
}
let theBrainestStudent = Student()
theBrainestStudent.getAverageMark(in: [10,10,6,10,9,10,8,5,9,10,10,9,8])

//№10
//Создайте класс “Автомобиль”. Сделайте методы, который возвращают данные о его пробеге, возрасте, количестве владельцев.
class Car {
    var mileage: Double
    var age: Int
    var numberOfOwners = 0
    
    init(mileage: Double = 1000, age: Int = 0) {
        self.mileage = mileage
        self.age = age
    }
    
    init(mileage: Double, age: Int, numberOfOwners: Int) {
        self.mileage = mileage
        self.age = age
        self.numberOfOwners = numberOfOwners
    }
    
    func getCarMileage() -> Double {
        mileage
    }
    func getCarAge() -> Int {
        age
    }
    func getNumberOfOwners() -> Int {
        numberOfOwners
    }
}

let newCarFromDealer = Car()
newCarFromDealer.getNumberOfOwners()
newCarFromDealer.getCarMileage()

let oldCar = Car(mileage: 300000.9, age: 32, numberOfOwners: 8)
oldCar.getCarAge()
oldCar.getNumberOfOwners()

//№11
//Создайте класс "Автомобиль", который содержит информацию о марке, году выпуска, типе двигателя и максимальной скорости. Создать вычисляемое свойство "isFast", которое возвращает true, если максимальная скорость больше 150 км/ч.
class CarParameters {
    enum EngineType {
        case diesel
        case petrol
        case electric
        case gybrid
        case hydrogen
    }
    
    var model: String
    var yearReleased: Int
    var engineType: EngineType
    var maxSpeed: Int
    var isFast: Bool {
        get {
            maxSpeed > 150 ? true : false
        }
    }
    
    init(model: String,
         yearReleased: Int,
         engineType: EngineType,
         maxSpeed: Int) {
        self.model = model
        self.yearReleased = yearReleased
        self.engineType = engineType
        self.maxSpeed = maxSpeed
    }
}

let bmwM5 = CarParameters(model: "M5 F90",
                          yearReleased: 2021,
                          engineType: .diesel,
                          maxSpeed: 300)
bmwM5.isFast

//№12
//Создайте класс "Человек", который содержит информацию о имени, фамилии и возрасте. Создать вычисляемое свойство "fullName", которое соединяет имя и фамилию человека.
class HumanBeing {
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        get {
            return firstName + " " + lastName
        }
    }
}

let homeLessMan = HumanBeing(firstName: "Vova", lastName: "Pupa")
homeLessMan.fullName

//№13
//Создайте класс "Треугольник", который содержит информацию о сторонах. Создать вычисляемое свойство "perimeter", которое возвращает периметр треугольника.
class Triangle {
    var sidesOfTriangle: (firstSide: Double, secondSode: Double, thirdSide: Double)
    
    init(sidesOfTriangle: (firstSide: Double, secondSode: Double, thirdSide: Double)) {
        self.sidesOfTriangle = sidesOfTriangle
    }
    
    var perimeter: Double {
        get {
            sidesOfTriangle.firstSide + sidesOfTriangle.secondSode + sidesOfTriangle.thirdSide
        }
    }
}
let triangle = Triangle(sidesOfTriangle: (firstSide: 3.9, secondSode: 5.0, thirdSide: 6.2))
triangle.perimeter

//№14
//Создайте перечисление с двумя статическими свойствами имя и пол, которые потом используйте для инициализации класса “Человек” со свойствами имя и пол.
enum Anonymous{
    static var name = "Гость"
    static var gender = "Пол не указан"
}

class Person {
    let personName: String
    var personsGender: String
    
    init(personName: String, personsGender: String) {
        self.personName = personName
        self.personsGender = personsGender
    }
}

let anonymous = Person(personName: Anonymous.name, personsGender: Anonymous.gender)
anonymous.personsGender

//№15
//Создайте перечисление "Направление" с четырьмя возможными значениями "север", "юг", "восток", "запад" и свойство "смежные направления".
enum Direction {
    case north
    case south
    case west
    case east
    
    var relatedAreas: String {
        switch self {
        case .north:
            return "\(Self.north)-\(Self.east) and \(Self.north)-\(Self.west)"
        case .south:
            return "\(Self.south)-\(Self.east) and \(Self.south)-\(Self.west)"
        case .west:
            return "\(Self.north)-\(Self.west) and \(Self.south)-\(Self.west)"
        case .east:
            return "\(Self.north)-\(Self.east) and \(Self.south)-\(Self.east)"
        }
    }
}

let direction = Direction.east.relatedAreas

//№16
//Создайте перечисление "Оценка" с четырьмя возможными значениями "отлично", "хорошо", "удовлетворительно", "неудовлетворительно" и функцию для перевода оценки в баллы (5, 4, 3, 2).
enum Mark {
    case great
    case good
    case satisfactory
    case unsatisfactory
    
    func transferMarkToNumber() -> Int {
        switch self {
        case .great:
            return 5
        case .good:
            return 4
        case .satisfactory:
            return 3
        case .unsatisfactory:
            return 2
        }
    }
}

let badResult = Mark.unsatisfactory.transferMarkToNumber()

//№17
//Придумайте самостоятельно пример, где будут использоваться структуры, классы и перечисления.
class SimsCharacterSetUp {
    let name: String
    var age: Int
    var weight: Double?
    let race: Race
    let face: FaceOfCharacter
    var body: Body
    var hairColor: Color
    init(name: String,
         age: Int,
         weight: Double?,
         race: Race,
         face: FaceOfCharacter,
         body: Body,
         hairColor: Color) {
        self.name = name
        self.age = age
        self.weight = weight
        self.race = race
        self.face = face
        self.body = body
        self.hairColor = hairColor
    }
}

struct FaceOfCharacter {
    let lips: Size
    let eyes: (size: Size, color: Color)
    let eyebrows: (Size)
    let nose: Size
    let forehead: Size
    let bridgeOfTheNose: Size
    let ear: Size
    let mouth: Size
    let cheek: Size
    let isHaveTooth: Bool
    let chin: Size
    let jaw: Size
    let skin: Color
    let moles: Int?
    let freckles: String?
    let beard: String?
    let moustache: String?
    let whiskers: String?
}

enum Color {
    case Black, Silver, Gray, White, Maroon, Red, Purple, Fuchsia, Green, Lime, Olive, Yellow, Navy, Blue, Teal, Aqua
}

enum Size {
    case small, normal, big
}
enum Race {
    case сaucasian, negroid, ethiopian, mongoloid, americanoid, european
}

enum Body {
    case thin, slim, slender, skinny, mediumBuild, plump, overweight, fat, strong, muscular, athletic
}

let milf = SimsCharacterSetUp(name: "Valentina",
                              age: 50,
                              weight: 100,
                              race: .americanoid,
                              face: FaceOfCharacter(lips: .big, eyes: (.normal, .Aqua), eyebrows: .big, nose: .small, forehead: .normal, bridgeOfTheNose: .small, ear: .normal, mouth: .big, cheek: .big, isHaveTooth: true, chin: .big, jaw: .small, skin: .White, moles: nil, freckles: "On cheeks", beard: nil, moustache: nil, whiskers: nil),
                              body: .slim, hairColor: .Silver)


//№18
//Напишите максимально сложный класс в котором вы используете все что успели пройти за время курса
class AudioPlayer {
    var getUserId: String? {
        didSet{
            guard getUserId != "" || getUserId != nil else { return print("Введите логин пж")}
            getUserId = getUserId?.capitalized
        }
    }
    var password: String? {
        didSet {
            guard password != nil && password != "" else { return print("Введите пароль пж")}
            password = password?.uppercased()
        }
    }
    var license: Bool
    var amountOfMoney: (Double, String)
    var downloadedCompositionsList: [Composition]
    var favouritesList: [Composition]
    var audioOutput: Bool
    private var compositionIndex = 0
    
    init(getUserId: String?,
         password: String?,
         license: Bool,
         amountOfMoney: (Double,String),
         downloadedCompositionsList: [Composition],
         favouritesList: [Composition],
         audioOutput: Bool) {
        
        self.getUserId = getUserId
        self.password = password
        self.license = license
        self.amountOfMoney = amountOfMoney
        self.downloadedCompositionsList = downloadedCompositionsList
        self.favouritesList = favouritesList
        self.audioOutput = audioOutput
    }
    
    enum Direction {
        case current
        case next
        case previous
    }
    
    func getUserMoney(amountOfMoney: (value: Double , currency: String)) -> Bool {
        amountOfMoney.value > 50 && amountOfMoney.currency == Currency.dollar ? true : false
    }
    
    private func authorization(realLoginAndPasswordInMemory: [String: String]) -> Bool {
        guard realLoginAndPasswordInMemory.keys.contains(getUserId ?? "") else { return false }
        guard checkLicence() else { return false }
        return realLoginAndPasswordInMemory[getUserId ?? ""] == password
    }
    
    private func checkLicence() -> Bool {
        if license == true || getUserMoney(amountOfMoney: (amountOfMoney)) == true {
            return true
        } else {
            return false
        }
    }
    
    func sortByArtist() -> [Composition] {
        return downloadedCompositionsList.sorted(by: { $0.author < $1.author })
    }
    
    func numberOfCompositions() {
        print("You have downloaded \(downloadedCompositionsList.count) compositions")
        print("You have add to favourite \(favouritesList.count) compositions")
    }
    
    func shuffleCompositions() {
        return downloadedCompositionsList.shuffle()
        
    }
    
    private func loadFavourites() {
        for composition in downloadedCompositionsList {
            if composition.isFavourite && !favouritesList.contains(where: { $0 == composition }) {
                favouritesList.append(composition)
            }
        }
    }
    
    func addCompositionToFavourites() {
        let compositionToAdd = downloadedCompositionsList[compositionIndex]
        if !favouritesList.contains(where: { $0 == compositionToAdd }) {
            favouritesList.append(compositionToAdd)
        } else {
            print("\(compositionToAdd) уже загружена в любимое")
        }
    }
    
    func downloadComposition(_ newCompostion: Composition) {
        downloadedCompositionsList.append(newCompostion)
        if newCompostion.isFavourite { favouritesList.append(newCompostion) }
    }
    
    func playCurrent() {
        play(direction: .current)
    }
    
    func playNext() {
        play(direction: .next)
    }
    
    func playPrevious() {
        play(direction: .previous)
    }
    
    func showPlayedComposition() {
        guard authorization(realLoginAndPasswordInMemory: realLoginAndPasswordInMemory) == true else {
            return print("Вам нужно авторизоваться или купить лицензию")
        }
        guard audioOutput else { return print("На что я жмал, подключите аудио выход(наушники, колонки и т.д)")}
        print(downloadedCompositionsList[compositionIndex])
    }
    
    func showFavourites() {
        guard authorization(realLoginAndPasswordInMemory: realLoginAndPasswordInMemory) == true else {
            return print("Вам нужно авторизоваться или купить лицензию")
        }
        loadFavourites()
        favouritesList.forEach{ print("\($0) ваша любимая") }
        print("\n")
    }
    
    private func getPreviousIndex() -> Int {
        guard compositionIndex - 1 >= 0 else { return downloadedCompositionsList.count - 1 }
        return compositionIndex - 1
    }
    
    private func getNextIndex() -> Int {
        guard compositionIndex + 1 < downloadedCompositionsList.count else { return 0 }
        return compositionIndex + 1
    }
    
    private func play(direction: Direction) {
        guard authorization(realLoginAndPasswordInMemory: realLoginAndPasswordInMemory) == true else {
            return print("Перед началом прослушивания вам нужно авторизоваться или купить лицензию")
        }
        guard downloadedCompositionsList.count > 0 else { return print("Добавьте немножко песен, пожалуйста!") }
        guard audioOutput else { return print("На что я жмал, подключите аудио выход(наушники, колонки и т.д)")}
        switch direction {
            
        case .current:
            showPlayedComposition()
            
        case .previous:
            compositionIndex = getPreviousIndex()
            showPlayedComposition()
            
        case .next:
            compositionIndex = getNextIndex()
            showPlayedComposition()
        }
    }
}

struct Composition: Equatable {
    let author: String
    let title: String
    let length: Double
    let album: String
    var isFavourite: Bool
}

var realLoginAndPasswordInMemory = ["Tim Cock" : "ABCDEFG"]

let yandexMusic = AudioPlayer(getUserId: nil, password: nil, license: false, amountOfMoney: (50, Currency.belorissianRuble),     downloadedCompositionsList:[
    Composition(author: "Led Zepplin", title: "Stairway to Heaven", length: 7.14, album: "Led Zepplin", isFavourite: true),
    Composition(author: "Eagles", title: "Hotel California", length: 5.20, album: "Hotel California", isFavourite: false),
    Composition(author: "Pink Floyd", title: "Wish you Were Here", length: 3.15, album: "Wish you Were Here", isFavourite: true)],
    favouritesList: [], audioOutput: false)
yandexMusic.getUserId = ""
yandexMusic.getUserId = "tony stark"
yandexMusic.password = "aBCDEFG"
yandexMusic.playCurrent()
yandexMusic.getUserId = "tim cock"
yandexMusic.playCurrent()
yandexMusic.playCurrent()
yandexMusic.audioOutput = true
yandexMusic.amountOfMoney = (51, Currency.dollar)
yandexMusic.playCurrent()
yandexMusic.playPrevious()
yandexMusic.playPrevious()
yandexMusic.showPlayedComposition()
yandexMusic.playPrevious()
yandexMusic.playPrevious()
yandexMusic.downloadComposition(Composition(author: "Aerosmith", title: "Crazy", length: 4.10, album: "Aerosmith", isFavourite: false))
yandexMusic.sortByArtist()
yandexMusic.showFavourites()
yandexMusic.playNext()
yandexMusic.addCompositionToFavourites()
yandexMusic.showFavourites()
yandexMusic.numberOfCompositions()
yandexMusic.shuffleCompositions()
yandexMusic.shuffleCompositions()

