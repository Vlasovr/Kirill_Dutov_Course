import UIKit

//№1
let array = [1,2,3]
let secondArray = [1,2,3,4,5,6]
let som = Set(array + secondArray)
for element in Set(array + secondArray).sorted() where element % 2 != 0 {
    print(element)
}
print("\n")

//№2
var names = ["Kirill", "Oleg", "Masha"]
names.insert("Roma", at: names.startIndex)
for name in names.dropLast(2) {
    print(name)
}
print("\n")

//№3
let numbers = [1, 4, 4, 5, 7, 8, 8, 8]
var uniqueNumbers = Set(numbers)
for number in 1...10 {
    if !uniqueNumbers.contains(number) {
        uniqueNumbers.insert(number)
    }
}
for number in uniqueNumbers.sorted() {
    switch number {
    case 3, 7, 10:
        print("Science, beeeaaatch")
    default:
        break
    }
}
print("\n")

//№4
var values = [23, 45, 56, 24, 65, 45]
let data = ["Oleg": 17, "Masha": 21, "Sasha": 67]
values.removeAll()
values.isEmpty ? values.append(contentsOf: data.values) : print("Array isn't empty, try again")
for value in values.sorted() where value > 18 {
    print("Somebody is \(value) years old.")
}
print("\n")

//№5
let members = ["Kirill": 30, "Oleg": 45, "Masha": 56, "Walter": 52]
for key in members.keys.sorted() where key.lowercased() != "Kirill".lowercased() {
    print(key)
}

//№6
let arrayOfvalues = [1, 2, 3]
let stringValues = ["one", "two", "three"]
for (number, string) in zip(arrayOfvalues, stringValues) {
    print("\(number) - \(string)")
}

//№7
let twoDimensionalArray = [[1, 2], [3, 4], [5, 6]]
print(twoDimensionalArray.flatMap{$0})

//№8
let firstArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let seconArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let concotenatedArray = (firstArray.filter { $0 % 2 == 0 && $0 <= 10 } + seconArray.filter { $0 % 2 != 0 && $0 <= 10}).sorted()
print(concotenatedArray)
print("\n")

//№9
let dictionary = ["Kirill": 30,
                  "Vasya": 30,
                  "Oleg": 34,
                  "Masha": 34,
                  "Pasha": 65,
                  "Gogy": 65]
print(Set(dictionary.values).sorted())
print("\n")

//№10
let products = ["item1,20,books", "item2,15,books",
                "item3,30,electronics","item4,50,books"]
var uniqueNames: Set<String> = []
var uniqueCategories: Set<String> = []
for product in products {
    let productComponents = product.components(separatedBy: ",")
    uniqueNames.insert(productComponents[0])
    uniqueCategories.insert(productComponents[2])
}
print("Unique names: \(uniqueNames.sorted())")
print("Unique names: \(uniqueCategories.sorted())")
print("\n")



//доп тренировка
/* Найдите имена всех студентов, которые посетили все три лекции. Найдите имена всех студентов, которые посетили первое занятие и не были на втором и третьем. Не используйте циклы для решения.*/
let firstDay: Set = ["Anna", "Benny", "Charlie"]
let secondDay: Set = ["Anna", "Benny", "Danny"]
let thirdDay: Set = ["Anna", "Danny", "Eric"]
print(firstDay.intersection(secondDay).intersection(thirdDay))
print(firstDay.subtracting(secondDay.union(thirdDay)))
print("\n")

/*Дана строка. Проверить все ли символы в строке встречаются не более одного раза. Если хотя бы один символ встречается два раза и более, то возвращать результат false в консоль. Например: в строке "aklbcdefb", символ b встречается 2 раза, возвращаем false. В строке "abnmkl" все символы встречаются не более 1 раза, возвращаем true.*/
let taskString = "abnmkl"
print(Set(taskString).count == taskString.count)
print("\n")

/*Даны два словаря, объедините их в один с названием tables. Если в обоих словарях будет один и тот же ключ, суммируйте значения. Можно через цикл, а можно поискать подходящую функцию */
let firstTable = ["box": 3, "lamp": 1, "pen": 2]
let secondTable = ["box": 2, "PC": 1, "pen": 3]
let tables = firstTable.merging(secondTable, uniquingKeysWith: +)
print(tables)
print("\n")

//Создайте из двух массивов keysNumbers и valuesNumbers словарь типа [String: Int]
let keysNumbers = ["zero","one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
let valuesNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
var joinTwoArrays = zip(keysNumbers, valuesNumbers)
var makeDictionary = Dictionary(uniqueKeysWithValues: joinTwoArrays)
for (key, value) in makeDictionary {
    print("\(key) \(value)")
}
