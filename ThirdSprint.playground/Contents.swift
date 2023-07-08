import UIKit

//№1
let array: [Int]? = [1, 1, 1, 2, 2, 2, 3, 3, 3]

func deleteDuplicates(_ array: [Int]?) -> [Int] {
    array != nil ? Array(Set(array!)) : []
}

deleteDuplicates(array)

//№2 
let array2: [Int]? = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

func findMaxInArray(_ array: [Int]?) -> Int {
    guard let array, var maxValue = array.first else { return 0 }
    
    for element in array where element > maxValue {
            maxValue = element
    }
    
    return maxValue
}

findMaxInArray(array2)

//№3
let array3: [Int]? = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

func findSum(_ array: [Int]?) -> Int {
    guard let array else { return 0 }
    
    var sum = 0
    
    for element in array {
        sum += element
    }
    
    return sum
}

findSum(array3)

//№4
let array4: [Int]? = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

func sortHighToLow(_ array: [Int]?) -> [Int] {
    array != nil ? array!.sorted(by: >) : []
}

sortHighToLow(array4)

//№5
let array5: [Int]? = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

func getEvenArray(_ array: [Int]?) -> [Int] {
    guard let array else { return [] }
    
    var evenArray = [Int]()
    
    for element in array where element % 2 == 0 {
        evenArray.append(element)
    }
    
    return evenArray
}

getEvenArray(array5)

//№6
let array6: [Int]? = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

func getOddArray(_ array: [Int]?) -> [Double] {
    guard let array else { return [] }

    var oddArray = [Double]()

    for element in array where element % 2 != 0 {
        oddArray.append(Double(element))
    }
    
    return oddArray.sorted(by: >)
}

getOddArray(array6)

//№7
let array7: [Int]? = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

func isContains(array: [Int]?, number: Int) -> Bool {
    array != nil ? array!.contains(number) : false
}

isContains(array: array7, number: 3)

//№8
let array8: [Int]? = [1, 2, 3, 4, 5]
let array9: [Double]? = [6.0, 7.0, 8.0, 9.0]

func concatenateArrays(_ firstArray: [Int]?, _ secondArray: [Double]?) -> [Int] {
    guard let firstArray, let secondArray else { return [] }
    
    var concatenetedArray = firstArray

    for element in secondArray {
        concatenetedArray.append(Int(element))
    }
    var i = 0
    while i < concatenetedArray.count {
        if concatenetedArray[i] == 9 || concatenetedArray[i] == 2 || concatenetedArray[i] == 1 {
            concatenetedArray.remove(at: i)
        } else {
            i += 1
        }
    }
    
    return concatenetedArray
}
concatenateArrays(array8, array9)

//№9
let value = 17

func findFactorial(_ number: Int) -> Int {
    guard number > 1 else { return 1 }
    
    return number * findFactorial(number - 1)
}

findFactorial(value)

//№10
let name = "Heisenberg"

func strCount(count string: String) -> Int { string.count }

strCount(count: name)

//№11
let array10 = ["Hello", "my", "name", "is", "Instasamka"]

func concatenateStrings(_ stringsArray: [String]) -> String {
    var concatenatedString = ""
    
    for string in stringsArray {
        concatenatedString.append(string + " ") //сделал с пробелами
    }
    
    return concatenatedString
}

concatenateStrings(array10)


//№12
let array11 = [11, 12, 1, 3, 4]

func averageValue(_ array: [Int]) -> Int {
    findSum(array) / array.count
}

averageValue(array11)

//№13
let value1 = 45
let value2 = 67

func findBiggeNumber(_ firstNumber: Int, _ secondNumber: Int) -> Int {
    firstNumber > secondNumber ? firstNumber : secondNumber
}

findBiggeNumber(value1, value2)

//№14
let array12 = ["Hello", "my", "name", "is", "Instasamka"]

func makeString(from stringsArray: [String]) -> String {
    var concatenatedString = stringsArray.first ?? ""
    
    for string in stringsArray.dropFirst() {
        concatenatedString.append(", " + string)
    }
    
    return concatenatedString
}

//№15
let value3 = 4567

func sumCharacters(in num: Int) -> Int {
    var sumOfCharacters = 0
    
    for char in String(num) {
        sumOfCharacters += Int(String(char))!
    }
    
    return sumOfCharacters
}

sumCharacters(in: value3)

//№16
let array13 = [1, 2, 3, 4, 5, 6, 7, 8, 9]

func sumEvenNumbers(_ array: [Int]) -> Int {

    var sum = 0
    
    for element in array where element % 2 == 0{
        sum += element
    }
    
    return sum
}
sumEvenNumbers(array13)

//№17
let string = "Я не делаю фиты, но за деньги да. За деньги да, за деньги да!"

func uniqueSymbols(in string: String) -> String {
    var uniqueString = ""
    
    for character in string {
        if !uniqueString.contains(character) {
            uniqueString.append(character)
        }
    }
    
    return uniqueString
}

uniqueSymbols(in: string)

//№18
let dictionary: [String: Int] = ["Kirill": 30, "Oleg": 24, "Max": 45]

func sortKeys(_ dictionary: [String: Int]) -> [String] {
    dictionary.keys.sorted(by: >)
}

sortKeys(dictionary)

//№19
let array14 = [10, 15, 5, 20, 45, 115, 95, 4, 5, 6]

func sumMultiple5(_ array: [Int]) -> Int {
    var sum = 0
    
    for element in array where element % 10 == 5 {
        sum += element
    }
    
    return sum
}

sumMultiple5(array14)

//№20
let value4 = 2
let array15 = ["Hello", "Oh", "My", "name", "Walter", "White"]

func getGreaterLength(then num: Int, in strings: [String]) -> [String] {

    var greaterLength = [String]()
    
    for string in strings {
        if string.count > num {
            greaterLength.append(string)
        }
    }
    
    return greaterLength
}
getGreaterLength(then: value4, in: array15)

