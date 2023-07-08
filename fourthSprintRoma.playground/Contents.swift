import UIKit

func randomiseArray() -> [Int] {
    var randomArray = [Int]()
    randomArray = (0..<10).map { _ in Int.random(in: 0...100) }
    return randomArray
}

//№ 1
//Напишите функцию, которая возвращает замыкание, которое увеличивает число на единицу.
func increment(_ number: Int) -> ((Int) -> Int) {
    { value in
        number + value
        
    }
}

let count = increment(5)
print(count(3))

//№2
//Напишите функцию, которая принимает целое число и возвращает замыкание, которое увеличивает число на переданное значение.

func addValue(to number: Int) -> ((Int) -> Int) {
    { value in number + value }
}

let increasedValue = addValue(to: 5)
print(increasedValue(4))

//№3
//Напишите функцию, которая принимает строку и возвращает замыкание, которое добавляет переданную строку к существующей.
let doraName = "Привет, это Дора"

func addString(to string: String) ->((String) -> String) {
    return { currentString in
        string + ". " + currentString
    }
}

let spotifyAdvertising = addString(to: doraName)
print(spotifyAdvertising("Я есть спотифай, а ты?"))

//№4
//Напишите функцию, которая принимает массив целых чисел и возвращает замыкание, которое вычисляет сумму всех элементов массив.
let arrayForSum = randomiseArray()

func sumElements(_ array: [Int]) -> (() -> Int) {
    { array.reduce(0, +) }
}

print(sumElements(arrayForSum)())


//№5
//Напишите функцию, которая принимает массив строк и возвращает замыкание, которое объединяет все строки в одну.
let soundToText = ["Май нэйм из Антон",
                   "Я сабинина мама",
                   "Я p*****s",
                   "My name is Tomas Shelby",
                   "Моя главная профессия - поваааар хахахахахахахаха",
                   "This is Elon Musk",
                   "Привет, меня зовут Артур Пирожков",
                   "Меня зовут Саша и я диктор канала мастерская настроения"]

func joinStrings(_ stringsArray: [String]) -> (() -> String) {
    { stringsArray.joined(separator: ", ") }
}
print(joinStrings(soundToText)())

//№6
//Напишите функцию, которая принимает число и возвращает замыкание, которое вычисляет факториал этого числа.
let valueForFindingFactorial = 20
func findFactorial(in number: Int) -> (() -> Int) {
    {
        guard number > 1 else { return 1 }
        var factorial = 1
        for element in 1...number {
            factorial *= element
        }
        return factorial
    }
}
print(findFactorial(in: valueForFindingFactorial)())

//№7
//Напишите функцию, которая принимает строку и возвращает замыкание, которое вычисляет количество вхождений определенного символа в строке.
let tactiks = "Может придумаем какую-нибудь тактику? - На этот раз никакой тактики, тупо мочим!"

func countCharContains(_ string: String) -> ((Character) -> Int) {
    { character in
        string.reduce(0) {$1 == character ? $0 + 1 : $0 }
    }
}

print(countCharContains(tactiks)("а"))


//№8
//Напишите функцию, которая принимает массив чисел и возвращает замыкание, которое вычисляет максимальный элемент массива.
var arrayForFindingMaxElement = randomiseArray()

func findMaxValue(_ array: [Int]) -> (() -> Int) {
    {
        guard let maxElement = array.max() else { return 0 }
        return maxElement
    }
}
print(findMaxValue(arrayForFindingMaxElement)())

//№9
//Напишите функцию, которая принимает массив слов и возвращает замыкание, которое вычисляет длину самого длинного слова в массиве.
let zoolanderDialogWords = ["Excuse", "me", "Bruhh", "You", "Are", "Excused", "If", "You", "See", "us", "in", "the", "club"]

func findMaxLengthOfWord(in stringsArray: [String]) -> (() -> Int) {
    { let sortedArray = stringsArray.sorted(by:{ $0.count < $1.count })
        if let longestWord = sortedArray.last {
            return longestWord.count
        }
        return 0
    }
}

print(findMaxLengthOfWord(in:zoolanderDialogWords)())

//№10
//Напишите функцию, которая принимает массив чисел и возвращает замыкание, которое вычисляет сумму четных чисел в массиве.
let arrayForFindingEvenNumbers = randomiseArray()

func findEvenNumbers(_ array: [Int]) -> (() -> Int) {
    { array.filter{$0 % 2 == 0}.reduce(0, +) }
}

print(findEvenNumbers(arrayForFindingEvenNumbers)())

//№11
//Напишите функцию, которая принимает массив слов и возвращает замыкание, которое вычисляет количество слов, начинающихся с заглавной буквы.
let womanWithCandibober = ["Как", "вам", "сказать", "я", "прожила", "довольно", "долгую", "жизнь", "Ибрагим", "вам", "что-нибудь", "говорит", "Прекрасное", "имя", "Аллах", "Акбар", "Я", "прошла", "афганскую", "войну", "Я", "желаю", "всем", "мужчинам", "пройти", "ее", "Мужчина", "определяется", "делом", "а", "не", "словом", "И", "если", "я", "ношу", "кандибобер", "на", "голове", "это", "не", "значит", "что", "я", "женщина", "или", "балерина"
]

func findWordsWithCapitalLetters(in arrayOfWord: [String]) -> (() -> Int) {
    { arrayOfWord.reduce(0){
            if let firstSymbol = $1.first, firstSymbol.isUppercase {
                return $0 + 1
            } else {
                return $0
            }
        }
    }
}
print(findWordsWithCapitalLetters(in: womanWithCandibober)())

//№12
//Напишите функцию, которая принимает массив чисел и возвращает замыкание, которое вычисляет среднее арифметическое чисел в массиве.

let arrayForAverageValue = randomiseArray()

func findAvereageValue(in array: [Int]) -> (() -> Int) {
    { array.reduce(0, +) / array.count }
}
print(findAvereageValue(in: arrayForAverageValue)())

//№13
//Напишите функцию, которая принимает массив слов и возвращает замыкание, которое вычисляет количество слов, содержащих букву "e".
let noNeedMem = ["Ну", "и", "пожалуйста", "Ну", "и", "не", "нужно", "Ну", "и", "очень", "то", "мне", "нужно", "Подумаешь"]

func countCharContains(in arrayOfWords: [String]) -> (() -> Int) {
    { arrayOfWords.reduce(0) { $1.contains("е") ? $0 + 1 : $0 } }
}
print(countCharContains(in: noNeedMem)())

//№14
//Напишите функцию, которая принимает массив чисел и возвращает замыкание, которое вычисляет сумму четных чисел в массиве  и возводит ее в третью степень.
let arrForEvenNumbers = randomiseArray()

func getSumEvenNumbers(in array: [Int]) -> (() -> Int) {
    { Int(pow(Double(findEvenNumbers(array)()), 3)) }
}

print(getSumEvenNumbers(in: arrForEvenNumbers)())

//№15
//Напишите функцию, которая принимает массив чисел и возвращает замыкание, которое вычисляет произведение чисел в массиве.
let arrayForMultiple = [1,2,3,4,5]

func multiply(_ array: [Int]) -> (() -> Int) {
    {   array.count == 0 ? 0 : array.reduce(1, *) }
}

print(multiply(arrayForMultiple)())

////№1
////Определите перечисление Weekday с днями недели.
//enum Weekday: String, CaseIterable {
//    case Monday
//    case Tuesday
//    case Wednesday
//    case Thursday
//    case Friday
//    case Saturday
//    case Sunday
//
//    var colorOfTheDay: UIColor {
//        switch self {
//        case .Monday:
//            return UIColor(red: 1.0, green: 0.5, blue: 0.6, alpha: 1.0)
//
//        case .Tuesday:
//            return UIColor(red: 0.0, green: 1.5, blue: 0.6, alpha: 1.0)
//
//        case .Wednesday:
//            return UIColor(red: 1.0, green: 1.5, blue: 1.6, alpha: 1.0)
//
//        case .Thursday:
//            return UIColor(red: 0.0, green: 1.5, blue: 0.6, alpha: 1.0)
//
//        case .Friday:
//            return UIColor(red: 1.0, green: 0.5, blue: 0.2, alpha: 1.0)
//
//        case .Saturday:
//            return UIColor(red: 0.5, green: 0.0, blue: 1.2, alpha: 1.0)
//
//        case .Sunday:
//            return UIColor(red: 1.5, green: 2.0, blue: 0.2, alpha: 1.0)
//        }
//    }
//
//    var isWeekend: Bool {
//        self == .Saturday || self == .Sunday ? true : false
//    }
//
//    func nextDay() -> Self {
//        let allCases = Self.allCases
//        guard let index = allCases.firstIndex(of: self) else { return self }
//        let next = allCases.index(after: index)
//        return allCases[next == allCases.endIndex ? allCases.startIndex : next]
//    }
//}
//
////№2
////Определите функцию, которая принимает Weekday и возвращает String с текстом "Сегодня [день недели]".
//func printDay(_ day: Weekday) -> String {
//    "Сегодня \(day.self.rawValue)"
//}
//
//print(printDay(.Monday))
//
////№3
////Добавьте свойство **`color`** в перечисление **`Weekday`** для хранения цвета дня недели.
//let colorOfSunday = Weekday.Sunday.colorOfTheDay
//let colorOfMonday = Weekday.Thursday.colorOfTheDay
//
////№4
////Добавьте в перечисление **`Weekday`** свойство **`isWeekend`**, которое возвращает **`true`** для субботы и воскресенья и **`false`** для остальных дней.
//let isTodayIsWeekend = Weekday.Monday.isWeekend
//
////№5
////Добавьте метод **`nextDay()`** в перечисление **`Weekday`**, который возвращает следующий день.
//
//let nextDayAfter = Weekday.Sunday.nextDay()
//
////доп 6 - проверка реально ли указанный день
//func checkDay(_ weekDay: Weekday) -> String {
//    let f = DateFormatter()
//    let currentDate = f.weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 1]
//    let possibleDay = weekDay.rawValue
//    if currentDate == possibleDay {
//        return "Вы правы, Сегодня \(weekDay)"
//    } else {
//        return "Сегодня другой день недели"
//    }
//}
//
//print(checkDay(Weekday.Tuesday))


enum Weekday: String {
        case Monday
        case Tuesday
        case Wednesday
        case Thursday
        case Friday
        case Saturday
        case Sunday
    
    var color: String {
        switch self {
            
        case .Monday:
            return "Black"
        case .Tuesday:
            return "Blue"
        case .Wednesday:
            return "Green"
        case .Thursday:
            return "Red"
        case .Friday:
            return "White"
        case .Saturday:
            return "yellow"
        case .Sunday:
            return "Gray"
        }
    }
    
    var isWeekend: Bool {
        self == .Saturday || self == .Sunday ? true : false
    }
    
    func nextDay() -> Weekday {
        switch self {
        case .Monday:
            return .Tuesday
        case .Tuesday:
            return .Wednesday
        case .Wednesday:
            return .Thursday
        case .Thursday:
            return .Friday
        case .Friday:
            return .Saturday
        case .Saturday:
            return .Sunday
        case .Sunday:
            return .Monday
        }
    }
}

func whatIsTheDay(_ weekday: Weekday) -> String {
    "сегодня - \(weekday.rawValue)"
}

whatIsTheDay(.Tuesday)
Weekday.Tuesday.color
Weekday.Sunday.isWeekend

Weekday.Tuesday.nextDay()

let arr = [[ 1, 2, 3, 4, 5 ],[5,6,7,8,9], [10,11,12,13,14,15,16,17]]

//func sumOfMinimums(_ numbers: [[Int]]) -> Int {
//    guard var firstMin = numbers[0].min(), var secondMin = numbers[1].min() else { return 0 }
//    return secondMin + firstMin
//    var sum = 0
//    for array in numbers {
//        guard let min = array.min() else { return 0 }
//        sum += min
//    }
//    return sum
//    numbers.reduce(0) {
//        if let min = $1.min() {
//           return $0 + min
//        } else {
//           return $0
//        }
//    }
//}
//sumOfMinimums(arr)
//1

//    func solution(_ num: Int) -> Int {
//        guard num >= 0 else { return 0 }
//        var sum = 0
//        for number in 1..<num{
//          if number % 3 == 0 || number % 5 == 0 {
//                sum += number
//            }
//        }
//        return sum
//        //return num < 3 ? 0 : (3..<num).filter({($0 % 3) * ($0 % 5) == 0}).reduce(0, +)
//    }
//solution(21)
//func spinWords(in sentence: String) -> String {
//    guard sentence != "" else { return "" }
//    return sentence.components(separatedBy: " ")
//        .map{ $0.count > 4 ? String($0.reversed()) : $0 }
//        .joined(separator: " ")
//}
//let arr12 = "Hey fellow warriors"
//spinWords(in: arr12)


//Создайте функцию-калькулятор. Функция принимает на вход массив чисел типа Double, а также массив операций типа (Double,Double)->(Double). Для массива входных чисел N, число операций операций должно быть N-1. Функция берет первых два числа и проводит с ними операцию (например сложения) согласно второму массиву. Затем результат операции сложения берется в качестве первого параметра второй операции, а в качестве второго уже берется третий элемент массива входных чисел,  Например: значения: [1,2,3,4] операции /, - , +  вернет 1.5, так как 1/2 - 3 + 4 = 1.5

func calculator(douv) -> Double {
   
    }


let res = calculator(values: [1,2,3,4],
                     operations: [{$0/$1}, { $0-$1}, { $0+$1}]) res
