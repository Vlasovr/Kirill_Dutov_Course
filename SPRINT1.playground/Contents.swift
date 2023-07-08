// документация Основы

// let и var

let maxUserAttempts = 10
var currentUserAttempts = 0

// - это комментарии
/*
 а это
 многострочные комментарии
 */


// явное указание типа
let helloMessage : String = "Hello"
var consoleMessage: String
consoleMessage = "Input your name: "
// неявное указание типа
var greetings = "Hello World!"
var userOutput = " "

var ractangleSquare, circleSquare, triangleSquare: Float // можно задавать одну аннотацию типа для 3 переменных

// название констант и переменных
// let 1234 Roma = 0 - запрещено начинать имена с цифр, иметь в составе пробел

// изменение переменных одного типа
var isWorker = true
isWorker = false

// вывод

print(consoleMessage) /* по умолчанию переводит после вывода на следующую строку
чтобы продолжить вывод на этой же строке используем
*/
print(helloMessage, terminator: " ")
print(greetings)


//интерполяция строки
print("Hello, dear user, we need to know your name, please \(consoleMessage)")

// не нужно писать точки с запятой в конце, однако можно записать два выражения в одну строку с точкой с запятой

var example = 3.2; print(example)

//для локаничности кода используем для целых чисел стандартный Int, беззнаковые используем если нужна какая-то оптимизация или работа строго с ограниченным размером целого числа
// UInt - беззнаковое, Int  - знаковое
let numberHolds2Bytes: Int16 // диапазон -32768 до 32767
let numberHoldsByte = UInt8.min // можно узнать мин и макс значение типа

// дробные числа //или с плавающей точкой

// без указания типа присваивается автоматически double
let pi = 3.1415926535 // от 15 десятичных - 8 байт
let constForExample: Float = 20.123456 // до 6 десятичных для 4 байтных чисел


//если объединить целые и дробные будет дробное

let number = 3 + 0.14; print(number)  // выводит как double


//чтобы изменить один числовой тип в другой нужно создать новое число
let int2Byte: UInt16 = 2_000
let int1Byte: Int8 = 127
let intWith2Bytes = int2Byte + UInt16(int1Byte)

//преобразование дробных
let piNum: Float = 3.14
let doubleNum = 7.82902910002
let newNum = doubleNum + Double(piNum); print(newNum)


//в целое

let intNum = Int(newNum); print(intNum)
//числовые литералы

let binary = 0b001111 // двоичная СС
let octal = 0o21 // воисьмиричная СС
let hexdecimal = 0x11 // шестнадцатиричная СС

// экспонента

let expNum = 1.25e3 // 1,25 10^3 = 1250.0


// псевдонимы
typealias AudioSample = Int16

var maxAmplitudeSound = AudioSample.min


// булева логика

let isReady = false
let isSleep = true


if isReady {
    print("Your order is ready!")
} else if isSleep {
    print("Your order is in sleep mode...")
}


//нельзя использовать замену на нелогическое значение
/*
 if newNum {
 
 */
//надо
if newNum == 10 {
    print("Nice attempt!")
}
if intNum == 10 {
    print("Nice attempt!")
}



//кортежи группируют несколько значений в одно составное

let error = (404, "Not Found")

let (statusCode, statusMode) = error
print("The status code is \(statusCode)")
print("The status mode is \(statusMode)")

// можно опускать ненужное

let (code, _) = error
print("the error code is \(code)")

// способ обращения к частям кортежа
print("The status code is \(error.0)")

print("The status message is \(error.1)")

//можно давать имена отдельным элементам кортежа во время объявления

let newStatus = (code: 200, strokeMode: "Ok")
print("Now the status code is \(newStatus.code)", terminator: " "); print("The mode is \(newStatus.strokeMode)")
// использовать полезно в возвращаемых значениях функций




// видео про переменные

var name1 = "Alex"
name1 = "Oleg"

let name2 = "Nikolai"
//name2 = "John"

print(name1 + " " + name2)

// camel case - стиль объявления переменных в свифте

var colorBlue = "Blue"



// документация - базовые операторы

/* унарные
 -a
  префиксные: !b
 постфиксные: c!
*/
/* бинарные - между двумя величинами
    a / b
 */
/* тернарные
    a ? b : c     - если а то b, нет - с
 */

// оператор присваивания

var a = 5
var b = 10
b = a // b = 5

// оператор сравнения
if a == b {
    print(true)
}
//арифметические операторы
a / b
a * b
a - b
a + b


a % b // остаток от деления

// унарный минус - меняпт знак числа, унарный плюс - без изменений оставляет

-a
+a // == -a
-a // == a

// составные операторы присваивания

a += b //сокращенная запись a = a + b


//операторы сравнения- результат - true/false   они часто используются в условных конструкциях
a == b
a != b
a > b
a < b
a >= b
a <= b

// можно сравнивать кортежи с одинаковым количеством значений и одного и того же типа
let cortegeZebra = (100, "Zebra")
let cortegeElephant = (1000, "Elephant")
cortegeZebra < cortegeElephant ? print(cortegeElephant.1) : print(cortegeZebra.1) // данная запись заменяет
if cortegeZebra < cortegeElephant {
    print(cortegeElephant.1)
} else {
    print(cortegeZebra.1)
}
// если первые элементы кортежей одинаковые то сравнивываются вторые и тд
// к bool операторы сравнения не применяются

//оператор сравнения по nil

// a ?? b // заменяет a != nil ? a! : b        a - должен быть опциональным



//диапозоны

var valueForCycle = 0
//замкнутый диапозон - для цикла for in
for _ in 0...5 {
    valueForCycle += 1
}
let namesArray = ["Kirill", "Artem", "Maks", "Pavel"]
// полузамкнутый
var count = namesArray.count
for index in 0..<count {
    print("\(index+1) name is \(namesArray[index])")
}
 
//односторонние диапозоны
for name in namesArray[..<3] { //kirill artem maks
    print(name)
}

print("Next cycle")

for name in namesArray[1...] { // artem maks pavel
    print(name)
}
print("Next cycle")

for name in namesArray[...3] { // kirill artem maks pavel
    print(name)
}
//рпвоерка имеет ли диапозон это значение
let range = ...3
range.contains(2)
range.contains(7)


//логические операторы
var hasJob = true
var student = false
// && - логическое и - оба операнда должны соответствовать условию
if hasJob && student {
    print("correct")
} else{
    print("uncorrect")
}

// || - логическое или - один из операндов должен соответсвовать условию
hasJob || student ? print(true) : print(false)

// ! - логическое не - инвертирует false на true и наоборот
print(!hasJob)
// можно комбинировать операторы

if isWorker && hasJob || !student && !isReady { //isReady был false: если работник и имеет работу или не студент и готов
    print("Your are a great employee")
}
// также можно дополнительно указывать скобки чтобы облегчить восприятие

if (isWorker && hasJob) || (!student && !isReady) { //isReady был false: если работник и имеет работу или не студент и готов
    print("Your are a great employee")
}


// видео базовые типы

let integerNumber = 10
let floatNumber: Float = 1.02101
let doubleNumber = 3.1442343
let sumFloat = Float(integerNumber) + floatNumber
let sumDouble = Double(sumFloat) + doubleNumber
let boolean: Bool = true
if boolean {
    print(true)
} else {
    print(false)
}

// документация - строки

//многострочные строковые литералы //обязательно должно начинаться с новой строки
let manyStrokes = """
My name is Roma
I live in Minsk
I'm 8 years oldъ
"""

//возврат коретки (\r)
let lineBreaks = """

SomeText

"""

//пробелы в завершающих кавычках обозначают сколкьо нужно пропустить пробелов в начале каждой строки
let stringWithSpaces = """
     Это первая строка
     А это вторая строка
     третяя строка
     """

/* специальные символы
\t - табуляция
\n - переход на новую строку
\r - возвращение коретки
\" - двойные ковычки
\' - одинарноые ковычки
\u{n} , где n - 1-8 - юникод
*/
let sparklingHeart = "\u{1F496}"
let lineString1 = #"line1\nline2"# //не будет переводить на новую строку
let lineString2 = #"line1\#nline2"# // переведет

//инициализация пустых строк

let emptyStr1 = ""
let emptyStr2 = String()

// метод проверки пустая ли строка
emptyStr1.isEmpty
greetings.isEmpty
// инициализация чара
let myFirstChar: Character = "y"
//посимвольный вывод строки
for character in greetings {
    print(character)
}
//конкатенация строк и символов
let strForConcatination = greetings + String(myFirstChar)
//конкатенация строк
greetings += helloMessage

// можно добавить чар в строку с помощью метода append
greetings.append(myFirstChar)
// но стринг к чар нельзя добавить


//интерполяция строк
let multiplier = 3
let mulString = "if \(multiplier) times multiply 1.5 we'll get \(Double(multiplier)*1.5)"


//юникоды
let eAcute: Character = "\u{E9}" // é
let combinedEAcute: Character = "\u{65}\u{301}" // e с eAcute равен é

// подсчет символов в строке
let animals = "Коала \u{1f428}, Улитка \u{1f40C}, Пингвин \u{1f427}, Верблюд \u{1f42A}"
 print("строка animals содержит \(animals.count) символов")
// конкатенация может и не менять кол-во символов в строке
var cafe = "Cafe"
cafe.count
cafe += "\u{301}"
cafe.count

// т.к. хранение символов в памяти может иметь разный объем, обращаться к строке по индексам не получится, нужно итерировать строку от начала или конца
greetings[greetings.startIndex] // endIndex нельзя использвать потому что будет указывать на симввол после последнего симв строки
greetings[greetings.index(before: greetings.endIndex)]
greetings[greetings.index(after: greetings.startIndex)]
greetings[greetings.index(greetings.startIndex, offsetBy: 7)]

//доступ к отдельным символам в строке
for index in greetings.indices {
   print("\(greetings[index])", terminator: " ")
}
//добавление символа по индексу
var welcome = "Welcome"
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " Dear Client", at: welcome.index(before: welcome.endIndex))
// удаление символа по индексу
welcome.remove(at: welcome.startIndex)
let stringRange = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(stringRange)

//подстроки используются при проведении операции какое-то время, по завершении нужно подстроку преобразовать в строку
let myName = "Roma Vlasov"
let i = myName.firstIndex(of: " ") ?? myName.endIndex
let name = greetings[..<i]
let newName = String(name)

//сравнение строк

myName == name ? "it is your full name " : "It is just your name"
myName != name ? "you've given only your name" : "You've wrotten full name"
// равенство префиксов и суффиксов
let romeoAndJuliet = [
 "Act 1 Scene 1: Verona, A public place suffix",
 "Act 1 Scene 2: Capulet's mansion suffix"
 ]
var actSceneCount = 0
for scene in romeoAndJuliet {
  if scene.hasPrefix("Act 1 ") {
    actSceneCount += 1
  }
}
 print("\(actSceneCount) сцен в Акте 1")
var exclamation = 0
for scene in romeoAndJuliet {
  if scene.hasSuffix("suffix") {
    exclamation += 1
  }
}
 print("\(exclamation) cуффикса в акте 1")

// юникод представление строк
//utf 8
let dogString = "Dog‼"
for index in dogString.utf8 {
    print("\(index) ", terminator: " ")
}
// тот же алгорит для utf16

// видео про строки

let emptyString = "" // способы задания пустой строки
let someStr = String()

var exampleStr: String = "My first string"
let newString = someStr + exampleStr
if emptyString.isEmpty {
    print("Is empty")
} else {
    print("Not empty")
}
var helloString = "Hello"
print(exampleStr + " " + helloString)

var character: Character = "X" //явно указываем чтобы был char
exampleStr.append(character) //метод добавления в строку символ
helloString += String(character)// добавляем  в строку символ

//цикл посимвольного вывода строки
for char in exampleStr {
    print(char)
}

helloString.hasPrefix("H") //проверка символа в начале
helloString.hasSuffix("X") //проверка символа в конце




//ПРИМЕРЫ

//1 кортежи
let carModel = (company: "BMW", series: "M5 f90 2023")

//2 bool
var hasInStock = true
var fueld = false

//3 тернарный оператор и логический
hasInStock && !fueld ? print("Your \(carModel.company) \(carModel.series) is available", terminator: " ") : print("We'll send you a notification when \(carModel.company) \(carModel.series) would be available")

//4 дробные и явное и неявное указание типа и бинарные операторы
let horsePower: Float = 300.2
let secondFueling = 80
let kilometersGone = 690
var realFuelConsumption: Double = Double(secondFueling) / Double(kilometersGone) * 100 //формула расхода топлива
var factoryFuelConsumption = 10
realFuelConsumption == Double(factoryFuelConsumption) ? print("\nNice consumption") : print("\nSomething with your vehicle")

// 5 работа со строками
var carsInStock = "Audi, Volkswagen, Lada, Porshe"
carsInStock.remove(at: carsInStock.startIndex)
carsInStock.insert("A", at: carsInStock.startIndex)
carsInStock.append(" GEELY")
carsInStock.append(" \u{1f697}")
carsInStock.count

carsInStock.contains("Autobus")
carsInStock.contains("Volkswagen")

//6 инициализация пустой строки
var newStock = "" // var newStock = String()

//7 работа с отдельными символами в строке
for index in carsInStock.indices {
    print(carsInStock[index])
}

// 8 конкотенация и интерполяция
let allCarsInStock = carsInStock + " " + carModel.company
print("On your \(carModel.series) fuel consumption is \(factoryFuelConsumption) and it has \(horsePower) hp")

// 9 метод removeAll
carsInStock.removeAll()
if carsInStock.isEmpty {
    hasInStock = false
}

//10 range
let kilometersLeft = ...1000
if kilometersLeft.contains(1000) {
    print("U have no need to fuel your \(carModel.company)")
}

