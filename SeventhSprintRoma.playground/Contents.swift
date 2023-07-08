import UIKit

// MARK: - 1 Какой век?
//https://www.codewars.com/kata/52fb87703c1351ebd200081f/train/swift

//Первое решение

func whatCentury(_ year: String) -> String {
    guard let intYear = Int(year) else { return "" }
    
    let century = (intYear + 99) / 100
    
    switch century % 10 {
    case 1 where century != 11:
        return "\(century)st"
    case 2 where century != 12:
        return "\(century)nd"
    case 3 where century != 13:
        return "\(century)rd"
    default:
        return "\(century)th"
    }
}

/* Описание решения: проверяю можно ли привести год к числу, вычисляю век, проверяю последнюю цифру века с помощью оператора switch и остатка от деленияна 10, в зависимости от кейса возвращаю правильную строку*/

//Популярное решение

extension Int {
    var spokenSuffix: String {
        let ones = self % 10
        let tens = (self / 10) % 10
        
        guard tens != 1 else { return "th" }
        
        switch ones {
        case 1: return "st"
        case 2: return "nd"
        case 3: return "rd"
        default: return "th"
        }
    }
}

func whatCentury1(_ year: String) -> String {
    guard let year = Int(year) else { return "bad input" }
    let century = (year - 1) / 100 + 1
    return String(century) + century.spokenSuffix
}

/* Описание решения: лучше решения не нашел но это самое популярное, использует расширение Int, чтобы определить последнюю цифру века c помощью вычисляемого свойства, которое дает последнюю цифру на основе отстатка от деления на 10 и значений десятков и единиц, далее функция через конкатенацию возвращает нужный век */

// MARK: - 2 Проверить равны ли числа первого массива квадратам чисел второго массива
//https://www.codewars.com/kata/550498447451fbbd7600041c/train/swift

//Первое решение

func comp(_ a: [Int], _ b: [Int]) -> Bool {
    return a.map{ $0 * $0 }.sorted() == b.sorted() ? true : false
}
comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361])
/* Описание решения: преобразую через map каждый элемент не квадратичного массива a в квадратичный, сортирую массивы a и b чтобы сравнить оба массива на идентичность*/

//Оптимальное решение

func comp1(_ a: [Int], _ b: [Int]) -> Bool {
    return a.map{ $0 * $0 }.sorted() == b.sorted()
}

/* Описание решения: не используется тернарный оператор, который не нужен, т.к. само сравнение дает булево значение */

// MARK: - 3 Зашифровать первый символ в аски код, второй поменять с последним местами(в каждом слове)
//https://www.codewars.com/kata/5848565e273af816fb000449/train/swift

//Первое решение

func encryptThis(text: String) -> String {
    let words = text.split(separator: " ")
    
    let encryptedWords = words.map { word -> String in
        let asciiCode = word.first?.asciiValue ?? 0
        var characters = String(asciiCode)
        var wordWithoutFirst = String(word.dropFirst())
        
        if word.count == 2 {
            return characters + wordWithoutFirst
        } else if word.count > 2 {
            let secondChar = String(wordWithoutFirst.removeFirst())
            let lastChar = String(wordWithoutFirst.removeLast())
            let half = word.dropFirst(2).dropLast()
            
            characters += lastChar + half + secondChar
        }
        return characters
    }
    return encryptedWords.joined(separator: " ")
}

encryptThis(text: "hello world")

/* Описание решения: разбиваю строку на массив слов, каждое слово через map шифрую: записываю аски код первого символа, создаю строку для результата шифрования и инициализирую ее аски кодом первого символа, создаю доп переменную чтобы потом меньше вызывать метод dropFirst. Если в слове 2 символа, вовзращаю слово из аски кода и второго символа(wordWithoutFirst), а если символов больше 2, создаю и инициализурую новую строки из второго и последнего символов в слове, создаю середину в котрой нет первых двух и последнего символов, возвращаю массив слов, преобразуя его в строку */

//Популярное решение

func encryptThis1(text:String) -> String {
    return text
        .components(separatedBy: " ")
        .map {
            var a = $0.map { String($0) }
            a[0] = String(a[0].unicodeScalars.first!.value)
            
            if a.count > 2 {
                a.swapAt(1, a.count-1)
            }
            
            return a.joined()
        }
        .joined(separator: " ")
}

/* Описание решения: решение выполняет тот же алгоритм, но имеет более краткое решение, не использует лишних переменных, использует force unwrap :((( . через map для каждого слова создает новый массив строк(из отдельного символа) а,  первой строке присваивает юникод первого символа, далее если слово больше 2, через swapAt меняет местами второй и последний символ слова, склеивает этот массив в строку и возвращает полученное слово, затем переход на новое слово  */

// MARK: - 4 Найти следующее число, имеющее только 2 различные цифры
//https://www.codewars.com/kata/604287495a72ae00131685c7/train/swift

//Первое решение

func doubleton(_ num: Int) -> Int {
    for n in (num + 1)..<1_000_000 {
        if Set(String(n)).count == 2 {
            return n
        }
    }
    return 0
}

/* Описание решения: в цикле по каждому числу с num + 1 до 1_000_000 проверяю число на предмет наличия двух уникальных цифр. Если найдено, возвращаю его как результат.*/

//Популярное  решение

func doubleton1(_ num: Int) -> Int {
    return Set(Array(String(num + 1))).count == 2 ? num + 1 : doubleton(num + 1)
}

/* Описание решения: громоздкое, рекурсивно вызывает саму себя при false */

// MARK: - 5 Получить строку с увеличением повторяющихся символов по возрастанию их индексов
//https://www.codewars.com/kata/5667e8f4e3f572a8f2000039/train/swift

//Первое решение

func accum(_ s: String) -> String {
    var accumulatedString = ""
    
    for (index, char) in s.enumerated() {
        let repeatedChar = String(Array(repeating: char, count: index + 1))
        accumulatedString.append(repeatedChar.capitalized + "-")
    }
    return String(accumulatedString.dropLast())
}
/* Описание решения: создаю пустую строку для аккумуляции, в цикле по индексу и значению создаю новую строку с повторяющимся символом в количестве равному его индексу + 1, добавляю эту строку с заглавной буквой и - в аккумулятор, после цикла возвращаю строку без последнего - */

//Оптимальное решение

func accum1(_ str: String) -> String {
    return str.enumerated().map {
        String(repeating: $1, count: $0 + 1).capitalized
    }.joined(separator: "-")
}

/* Описание решения: более краткое и лаконичное решение, тот же способ, благодаря joined не нужно использовать dropLast*/

// MARK: - 6 Отразить "зеркало" горизонтально и вертикально, и написать функцию высшего порядка для них
//https://www.codewars.com/kata/56dbe0e313c2f63be4000b25/train/swift

//Первое решение

func horMirror(_ s: String) -> String {
    return s.split(separator: "\n")
        .reversed()
        .joined(separator: "\n")
}

func vertMirror(_ s: String) -> String {
    return String(s.split(separator: "\n")
        .map{ $0.reversed() }
        .joined(separator: "\n"))
}

func oper(_ fct: (String) -> String, _ s: String) -> String {
    return fct(s)
}

/* Описание решения: горизонтальная: создаю массив каждой стороны зеркала, переваричиваю массив "горизонтально", возвращаю объединенные стороны; вертикальная: создаю массив каждой стороны зеркала, переваричиваю каждую сторону "вертикально", возвращаю объединенные стороны */

//Популярное решение

func horMirror1(_ s: String) -> String {
    return s.components(separatedBy: "\n").reversed().joined(separator: "\n")
}

func vertMirror1(_ s: String) -> String {
    return s.components(separatedBy: "\n").map({ String($0.reversed()) }).joined(separator: "\n")
}

func oper1(_ f: (String) -> (String), _ s: String) -> String {
    return f(s)
}

/* Описание решения: делает тоже самое, но больше 2 функциональных методов - это длинно, и поэтому менее читабельно */

// MARK: - 7 Найти волка и вернуть овцу которая правее его
//https://www.codewars.com/kata/5c8bfa44b9d1192e1ebd3d15/train/swift

//Первое решение

func warnTheSheep(_ queue: [String]) -> String {
    guard queue.last != "wolf" else { return "Pls go away and stop eating my sheep" }
    
    for (index, sheep) in queue.reversed().enumerated() {
        if sheep == "wolf" {
            return "Oi! Sheep number \(index)! You are about to be eaten by a wolf!"
        }
    }
    return ""
}

/* Описание решения: проверяю равен ли последний элемент "wolf", если равен возвращаю требуемую строку, иначе дальше иду по коду. Через цикл в перевернутом массиве ищу "wolf", через enumerated беру индекс найденного волка*/

func warnTheSheep1(_ queue: [String]) -> String {
    let ind = Array(queue.reversed()).firstIndex(where: { $0 == "wolf" })
    return ind == 0 ? "Pls go away and stop eating my sheep" : "Oi! Sheep number \(ind!)! You are about to be eaten by a wolf!"
}

/* Описание решения: лаконичное решение, создается переменная которая будет равна индексу волка(вычисляется по перевернутому массиву овец и методу firstIndex, который как раз и находит индекс волка, через тернарник проверяется условие если волк под нулевым индексом и вовзращает строку по требованиям задачи, использует force unwrap :( */

// MARK: - 8 Вернуть квартал месяца
//https://www.codewars.com/kata/5ce9c1000bab0b001134f5af/train/swift

//Первое решение

func quarter(of month: Int) -> Int {
    switch month {
    case 1...3:
        return 1
    case 4...6:
        return 2
    case 7...9:
        return 3
    default:
        return 4
    }
}

/* Описание решения: через switch case вовзращаю квартал */

//Оптимальное решение

func quarter1(of month: Int) -> Int {
    return (month + 2) / 3
}

/* Описание решения: лаконичное решение */

// MARK: - 9
//https://www.codewars.com/kata/583710ccaa6717322c000105/train/swift

//Первое решение

func simpleMultiplication(_ num: Int) -> Int {
    num % 2 == 0 ? num * 8 : num * 9
}

/* Описание решения:  */

//Оптимальное решение

func simpleMultiplication1(_ num: Int) -> Int {
    num % 2 == 0 ? num * 8 : num * 9
}

/* Описание решения:  */

// MARK: - 10
//https://www.codewars.com/kata/55f9bca8ecaa9eac7100004a/train/swift

//Первое решение

func past(_ h: Int, _ m: Int, _ s: Int) -> Int {
    return h * 3600000 + m * 60000 + s * 1000
}

/* Описание решения:  */

//Оптимальное решение

func past1(_ h: Int, _ m: Int, _ s: Int) -> Int {
    return s * 1000 + m * 60000 + h * 3600000
}

/* Описание решения:  */

// MARK: - 11 Найти наибольшую строку, созданную из последовательности из k строк массива строк
//https://www.codewars.com/kata/56a5d994ac971f1ac500003e/train/swift

//Первое решение

func longestConsec(_ strarr: [String], _ k: Int) -> String {
    let wordsCount = strarr.count
    
    if wordsCount == 0 || k > wordsCount || k <= 0 {
        return ""
    }
    
    var longestJoinedStrings = ""
    
    for i in 0...(wordsCount - k) {
        let joinedStringsInRange = strarr[i..<(i + k)].joined()
        if joinedStringsInRange.count > longestJoinedStrings.count {
            longestJoinedStrings = joinedStringsInRange
        }
    }
    return longestJoinedStrings
}

/* Описание решения: создаю доп переменную для хранения количества строк, делаю проверки чтобы не было пустого массива, значения k которое должно быть меньше, чем количество слов, создаю переменную которая будет хранить самую динные строки. В цикле иду по каждой индексу строки от 0 до wordsCount-k(нужно объединить k строк,т.к. последние k-1 элементов массива будут использованы в последней итерации, и поэтому ограничиваю до wordsCount-k). Далее создаю массив строк с i до i+k. Через joined() объединию строки, проверяю если длина соединенной сейчас строки больше, чем длина наибольшей строки. Если это так, обновляю значение переменной самой длинной строки. Вовзращаю первую самую длинную строку */

//Оптимальное решение

func longestConsec1(_ strarr: [String], _ k: Int) -> String {
    if strarr.count == 0 || k > strarr.count || k <= 0 {
        return ""
    }
    
    var longestString: String = ""
    for index in 0..<strarr.count - k + 1 {
        var newStr = ""
        for i in 0..<k {
            newStr += strarr[index + i]
        }
        
        if newStr.count > longestString.count {
            longestString = newStr
        }
    }
    
    return longestString
}


/* Описание решения: решение использует 2 цикла для перебора индексов и создания очередной последовательной строки, возможно решение более понятное */

// MARK: - 12 Найти n-ое треугольное число
//https://www.codewars.com/kata/525e5a1cb735154b320002c8/train/swift

//Первое решение

func triangular(_ n: Int) -> Int{
    guard n > 0 else { return 0 }
    return (1...n).reduce(0, +)
}

/* Описание решения: треугольное число - это сумма посследовательных чисел от 1 до n*/

//Один из вариантов решения

func triangular1(_ n: Int) -> Int{
    guard n > 0 else { return 0 }
    return n * (1 + n) / 2
}

/* Описание решения: использует формулу треугольного числа из википедии, мое решение более доступное */

// MARK: - 13 Найти больше ли -1 чем 1 в массиве
//https://www.codewars.com/kata/58acfe4ae0201e1708000075/train/swift

//Первое решение

func inviteMoreWomen(_ arr: [Int]) -> Bool {
    return arr.reduce(0) { $1 == -1 ? $0 + 1 : $0 } < arr.reduce(0) { $1 == 1 ? $0 + 1 : $0}
}

/* Описание решения: сравниваю количество -1 и 1, если -1 меньше чем 1, то true */

//Оптимальное решение

func inviteMoreWomen1(_ arr: [Int]) -> Bool {
    return arr.reduce(0, +) > 0
}
/* Описание решения: решение с меньшим кол-вом операций, если сложение -1 и 1 перевеишвает 0, то вернет true */

// MARK: - 14 Найти число из array которого нет в mixArray
//https://www.codewars.com/kata/595aa94353e43a8746000120/train/swift

//Первое решение

func findDeletedNumber(_ array: [Int], _ mixArray: [Int]) -> Int {
    return array.first(where: { !mixArray.contains($0) }) ?? 0
}

/* Описание решения: метод first проверяет что элемент из array отсутствует в mixArray через метод contains, если нет такого элемента вернет 0 или если array пуст то также вернется 0 */

//Оптимальное решение

func findDeletedNumber1(_ array: [Int], _ mixArray: [Int]) -> Int {
    return array.first(where: { !mixArray.contains($0) }) ?? 0
}

/* Описание решения: идентично */

// MARK: - 15 Найти n-ую цифру в числе
//https://www.codewars.com/kata/577b9960df78c19bca00007e/train/swift

//Первое решение

func findDigit(_ num: Int, _ nth: Int) -> Int {
    // guard String(num).count > nth else { return 0 }
    guard nth > 0 else { return -1 }
    return (num > 0 ? num : -num) / Int(pow(10, Double(nth - 1))) % 10
}

/* Описание решения:  */

//Оптимальное решение

func findDigit1(_ num:Int, _ nth: Int) -> Int {
    return nth > 0 ? (abs(num) / Int(pow(10.0,Double(nth-1)))) % 10 : -1
}

/* Описание решения:  */

// MARK: - 16 Перевести год в римские цифры и наоборот
//https://www.codewars.com/kata/51b66044bce5799a7f000003/train/swift

//Первое решение

class RomanNumerals {
    
    static func toRoman(_ number: Int) -> String {
        var roman = ""
        var num = number
        
        while num / 1000 > 0 {
            roman.append("M")
            num -= 1000
        }
        
        if num / 100 == 9 {
            roman += "CM"
            num -= 900
        } else {
            while num / 500 > 0 {
                roman.append("D")
                num -= 500
            }
        }
        
        if num / 100 == 4 {
            roman += "CD"
            num -= 400
        } else {
            while num / 100 > 0 {
                roman.append("C")
                num -= 100
            }
        }
        
        if num / 10 == 9 {
            roman += "XC"
            num -= 90
        } else {
            while num / 50 > 0 {
                roman.append("L")
                num -= 50
            }
        }
        
        if num / 10 == 4 {
            roman += "XL"
            num -= 40
        } else {
            while num / 10 > 0 {
                roman.append("X")
                num -= 10
            }
        }
        
        if num == 9 {
            roman += "IX"
            num -= 9
        } else {
            while num / 5 > 0 {
                roman.append("V")
                num -= 5
            }
        }
        
        if num == 4 {
            roman += "IV"
            num -= 4
        } else {
            while num / 1 > 0 {
                roman.append("I")
                num -= 1
            }
        }
        return roman
    }
        
    static func digitFromChar(_ char: String.Element) -> Int {
        switch char {
        case "M":
            return 1000
        case "D":
            return 500
        case "C":
            return 100
        case "L":
            return 50
        case "X":
            return 10
        case "V":
            return 5
        case "I":
            return 1
        default:
            return 0
        }
    }
    
    static func fromRoman(_ roman: String) -> Int {
        var lastDigit = 0
        var result = 0
        
        for char in roman.reversed() {
            let currentDigit = digitFromChar(char)
            result += lastDigit > currentDigit ? -currentDigit : currentDigit
            lastDigit = currentDigit
        }
        return result
    }
}

/* Описание решения: toRoman: последовательно вычитаю из оригинального числа римские символы, пока это число не станет равным нулю. Сделал через условные операторы и циклы while чтобы добавлять римские символы в строку roman в порядке убывания
 В начале инициализирую пустую строку roman и значение аргумента number в num. Затем идет проверка сколько тысяч входит в число num и добавляет соответствующее количество символов "M" в строку roman, вычитая 1000 из num, пока оно не станет меньше 1000. Потом если значение num больше или равно 900, добавляю символы "CM" в строку roman и вычитаю из num 900. В противном случае, если num больше или равен 500, добавляю символы "D" в roman и вычитаю из num 500, пока num не станет меньше 500. Точно также проходится по остальным символам, пока num не станет равным 0.
 fromRoman: прохожусь по каждому символу в строке roman, начиная с последнего символа, вычисляя его десятичное значение через метод digitFromChar, сравниваю это значение с предыдущим значением и вычитает текущее значение из результата, если оно меньше предыдущего значения, иначе добавляю его к результату. digitFromChar использует  switch, чтобы возвращать соответствующее значение для каждого символа римской системы счисления. */

//Оптимальное решение

class RomanNumerals1 {
    static func toRoman(_ number: Int) -> String {
        let romanDigits = [1:"I", 4:"IV", 5:"V", 9:"IX", 10:"X", 40:"XL", 50:"L", 90:"XC", 100:"C", 400:"CD", 500:"D", 900:"CM", 1000:"M"]
        var left = number
        var ans = String()
        while left > 0 {
            let curr = romanDigits.sorted{$0.key < $1.key}.last{$0.key <= left}!
            left -= curr.key
            ans += curr.value
        }
        return ans
    }
    static func fromRoman(_ roman: String) -> Int {
        return (1..<4000).first{toRoman($0) == roman}!
    }
}

/* Описание решения: даже не смотря на то, что все значения символов захардкожены(40, 90, 400, 900), решение более лакончиное и читабельное -  использует словарь для хранения соответствия между арабскими и римскими цифрами, в цикле while(для построения римской цифры) избегает дублирования кода. Через sorted получает наименьшую римскую цифру, которую можно вычесть из оставшейся части(эффективно и быстро).Использует метод range для нахождения арабского числа, соответствующего римской цифре */

// MARK: - 17 Найти противоположное число в круге
//https://www.codewars.com/kata/58841cb52a077503c4000015/solutions/swift

//Первое решение

func circleOfNumbers(_ n: Int, _ fst: Int) -> Int {
    return n / 2 > fst ? n / 2 + fst : fst - n / 2
}

/* Описание решения:  нахожу противоположное число через сравнение fst и n/2. Если fst меньше n/2, то противоположный номер равен сумме n/2 и fst, иначе он равен разности fst и n/2.*/

//Оптимальное решение

func circleOfNumbers1(_ n: Int, _ fst: Int) -> Int {
    return (fst + n / 2) % n
}

/* Описание решения: использует остаток от деления, чтобы найти противоположный номер. Он просто вычисляет сумму fst и n/2, затем находит остаток от деления этой суммы на n. Короче и понятнее, чем мое, потому что избегает условных операторов и просто использует остаток от деления, чтобы найти противоположный номер */

// MARK: - 18 Сложить буквы в англ алфавите и получить новую букву
//https://www.codewars.com/kata/513e08acc600c94f01000001/train/swift

//Первое решение

func addLetters(_ letters: [Character]) -> Character {
    guard !letters.isEmpty else { return "z" }
    
    let firstLetter = Int(Character("a").asciiValue ?? 0)
    var sum = letters.reduce(0) { $0 + Int($1.asciiValue ?? 0) - firstLetter + 1}
    sum -= 1
    let lastLetter = Int((Character("z").asciiValue ?? 0)) - firstLetter + 1
    
    if sum >= lastLetter {
        return Character(UnicodeScalar(UInt8(sum % lastLetter + firstLetter)))
    } else {
        return Character(UnicodeScalar(UInt8(sum + firstLetter)))
    }
}

/* Описание решения: проверяю, пустой ли массив letters. Если да, то возвращает z. Иначе, начальная буква a используется для поиска числового значения каждой буквы в массиве, а затем их суммы. Каждую букву в массиве преобразую в числовое значение, вычитая из его кода аски значение a и добавляя 1, для того, чтобы символ a имел значение 1, b - 2, и т.д. Результаты суммирую и сохраняю в sum, значение sum нужно уменьшить на 1, потому что суммирование начинается с 1, а не с 0. Затем вычисляю значение последней буквы z в алфавите, вычитая из кода аски буквы z значение кода буквы a и добавляя 1. Если результат больше 26 (количество букв в английском алфавите), то возвращаю остаток от деления результата на 26 и прибавляю к нему аски код a. Благодаря этому получаю новую букву в алфавите, начиная с "a"(например если результат равен 28, то берется остаток от деления на 26, который равен 2, и прибавляется к нему a, что дает c). Если результат меньше или равен 26, то к нему прибавляется аски код a(например результат равен 3 - прибавляется 97 = буква d. Перед return привожу к безнаковому числу UInt8, чтобы привести из аскикода в символьный вид, а потом к символу. */

//Оптимальное решение

func addLetters1(_ letters: [Character]) -> Character {
    guard !letters.isEmpty else { return "z" }

    let aCodeMinusOne = 96
    let maxLetterCount = 26
    var sum = 0

    letters.forEach { cur in
        sum += Int(cur.asciiValue!) - aCodeMinusOne
    }

    if sum > maxLetterCount {
        sum = sum % maxLetterCount == 0 ? maxLetterCount : (sum % maxLetterCount)
    }
    sum = sum + aCodeMinusOne

    let scalar = UnicodeScalar(UInt8(sum))
    return Character(scalar)
}

/* Описание решения: немного проще и легче читается, не использует манипуляций с аски кодом, при этом расписав что является каким значением в начальных переменных  */

// MARK: - 19 Представить числа в шестнадцатиричной системе счисления
//https://www.codewars.com/kata/5d50e3914861a500121e1958/train/swift

//Первое решение

func rgb(_ r: Int, _ g: Int, _ b: Int) -> String {
    let color = [r, g, b].map {
        switch $0 {
        case 256...:
            return 255
        case ..<0:
            return 0
        default:
            return $0
        }
    }
    return String(format: "%02X%02X%02X",  arguments: color)
}

/* Описание решения: внутри map проверяю каждый элемент, находится ли значение в допустимом диапазоне от 0 до 255. Если значение меньше нуля, то заменяю на 0, а если больше 255, то заменяю на 255, если от 0 до 255 - без изменений. Использую String(format:arguments:) для форматирования строкового представления RGB-цвета в шестнадцатеричном формате - используется формат %02X%02X%02X, который означает, что необходимо сформировать строку из трех шестнадцатеричных чисел.*/

//Оптимальное решение

func rgb1(_ r: Int, _ g: Int, _ b: Int) -> String {
    let color = [r, g, b].map {
        switch $0 {
        case 256...:
            return 255
        case ..<0:
            return 0
        default:
            return $0
        }
    }
    return String(format: "%02X%02X%02X",  arguments: color)
}

/* Описание решения: мое решение самое понятное  */

// MARK: - 20 Найти упрощенный путь
//["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"] -> ["WEST"]
//https://www.codewars.com/kata/550f22f4d758534c1100025a/train/swift

//Первое решение

func dirReduc(_ arr: [String]) -> [String] {
    var road = [String]()
    let reversedSides = ["SOUTH" : "NORTH", "NORTH" : "SOUTH", "WEST" : "EAST", "EAST" : "WEST"]
    
    for side in arr {
        if road.last == reversedSides[side] {
            road.removeLast()
        } else {
            road.append(side)
        }
    }
    return road
}

dirReduc(["NORTH", "WEST", "SOUTH", "EAST"])
/* Описание решения: задача представляет собой путь на карте, где каждая строка обозначает направление движения на один шаг. Нужно убрать все противоположные направления, такие как "NORTH" и "SOUTH", "WEST" и "EAST", которые взаимно уничтожают друг друга и вернуть новый массив, которыйи и есть упрощенный путь. Алгоритм: создаю road, в котором хранятся пройденные направления, прохожу по каждому направлению side в arr. Если side противоположно последнему добавленному направлению в road, то последнее направление удаляется, иначе текущее направление добавляется в конец road. */

//Оптимальное решение

func dirReduc1(_ arr: [String]) -> [String] {
    var road = [String]()
    var reversedSides = ["SOUTH" : "NORTH", "NORTH" : "SOUTH", "WEST" : "EAST", "EAST" : "WEST"]
    
    for side in arr {
        if road.last == reversedSides[side] {
            road.removeLast()
        } else {
            road.append(side)
        }
    }
    return road
}

/* Описание решения: мое решение самое понятное */

// MARK: - Практическое домашнее задание
// №1
//Создайте структуру **`Person`**, которая содержит свойства **`firstName`** и **`lastName`**. Создайте инициализатор, который принимает значения для обоих свойств. Если значения не указаны, то по умолчанию они должны быть пустыми строками.

struct Person {
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    init() {
        self.init(firstName: "", lastName: "")
    }
}

let elonMusk = Person()

//№2
//Создайте класс **`Vehicle`**, который содержит свойства **`name`**, **`numberOfWheels`** и **`topSpeed`**. Создайте инициализатор, который принимает значения для **`name`** и **`numberOfWheels`**. Если **`topSpeed`** не указан, то она должна быть равна 0.

final class Vehicle {
    let name: String
    let numberOfWheels: Int
    var topSpeed: Int
    
    init(name: String, numberOfWheels: Int, topSpeed: Int = 0) {
        self.name = name
        self.numberOfWheels = numberOfWheels
        self.topSpeed = topSpeed
    }
}

let m21 = Vehicle(name: "BMW E34", numberOfWheels: 4)

let m20 = Vehicle(name: "BMW E34", numberOfWheels: 4, topSpeed: 240)

//№3
//Создайте класс **`User`**, который содержит свойства **`username`** и **`email`**. Создайте инициализатор, который принимает значение для **`username`**. Значение для **`email`** должно генерироваться на основе **`username`**, добавляя "@example.com" в конец.

final class User {
    var username: String
    let email: String
    
    init(username: String) {
        self.username = username
        self.email = "\(username.lowercased())@example.com"
    }
}

let vipUser = User(username: "Adolph")

//№4
//Создайте класс **`Rectangle`**, который содержит свойства **`width`** и **`height`**. Создайте инициализатор, который принимает значение для **`width`** и вычисляет значение для **`height`** на основе **`width`**, умноженного на 2.

final class Rectangle {
    let width: Double
    let height: Double
    
    init(width: Double) {
        self.width = width
        self.height = width * 2
    }
}

let myRectangle = Rectangle(width: 13.2)

//№5
//Создайте структуру **`Address`**, которая содержит свойства **`street`**, **`city`** и **`state`**. Создайте инициализатор, который принимает значение для **`street`** и генерирует случайные значения для **`city`** и **`state`** из заранее определенных массивов.

let citiesList = ["Boston", "Ulsan", "Hamburg", "Dakar", "Davao City", "Managua", "Almaty"]
let statesList = ["Alabama",
                  "Alaska",
                  "Arizona",
                  "Arkansas",
                  "California",
                  "Colorado",
                  "Connecticut",
                  "Delaware",
                  "District of Columbia",
                  "Florida", "Georgia",
                  "Hawaii",
                  "Idaho",
                  "Illinois",
                  "Indiana",
                  "Iowa",
                  "Kansas"
]

struct Address {
    var street: String
    var city: String
    var state: String
    
    init(street: String) {
        self.street = street
        self.city = citiesList.randomElement() ?? "Some city"
        self.state = statesList.randomElement() ?? "Some state"
    }
}

let vpnAddress = Address(street: "Kolcova")

//№6
//Создайте класс "Фигура", который содержит свойства "ширина" и "высота". Создайте класс "Прямоугольник", который наследует класс "Фигура" и содержит метод "площадь". Создайте объект класса "Прямоугольник" и вызовите метод "площадь".

class Figure {
    let width: Double
    let height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}

final class Rect: Figure {
    func area() -> Double {
        return width * height
    }
}

let rectangleToFindArea = Rect(width: 14.5, height: 20.9)
rectangleToFindArea.area()

//№7
//Создайте базовый класс **`Person`** с двумя свойствами **`name`** и **`age`**. Создайте подкласс **`Student`**, который наследует от **`Person`**, и добавьте ему свойство **`major`**.

class Human {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

final class Student: Human {
    var major: String
    
    init(name: String, age: Int, major: String) {
        self.major = major
        super.init(name: name, age: age)
    }
}

let nonGraduatedStud = Student(name: "Bill", age: 68, major: "Lawyer")

//№8
//Создайте класс **`Shape`**, который имеет свойства **`width`**и **`height`**. Создайте подклассы **`Rectangle`**и **`Triangle`**, которые наследуют от **`Shape`**и имеют свои собственные методы для вычисления площади.

class Shape {
    let width: Double
    let height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}

final class Rectang: Shape {
    func area() -> Double {
        return width * height
    }
}

final class Triangle: Shape {
    func area() -> Double {
        return 0.5 * width * height
    }
}

let abstraсtRectang = Rectang(width: 20, height: 10.8)
abstraсtRectang.area()

let unknownTriangle = Triangle(width: 12.0, height: 10)
unknownTriangle.area()

//№9
//Создайте класс **`Animal`** с методом **`makeSound`**. Создайте подклассы **`Cat`**, **`Dog`** и **`Cow`**, которые наследуют от **`Animal`** и переопределяют метод **`makeSound`**.

class Animal {
    func makeSound() {
        print("Arrr-Arrrr")
    }
}

final class Cat: Animal {
    override func makeSound() {
        print("Meow - Meeoooww")
    }
}

final class Dog: Animal {
    override func makeSound() {
        print("woof-woooof-woof")
    }
}

final class Cow: Animal {
    override func makeSound() {
        print("MOOOOOOOOOOO")
    }
}

let defaultCat = Cat()
defaultCat.makeSound()

let defaultDog = Dog()
defaultDog.makeSound()

let defaultCow = Cow()
defaultCow.makeSound()

//№10
//Создайте базовый класс **`Vehicle`** с свойствами **`make`**, **`model`** и **`year`**. Создайте подклассы **`Car`**, **`Truck`** и **`Motorcycle`**, которые наследуют от **`Vehicle`** и имеют свои собственные свойства, такие как **`numberOfDoors`**, **`cargoCapacity`** и **`hasSidecar`**.

class Vehicle2 {
    let make: String
    let model: String
    let year: Int
    
    init(make: String, model: String, year: Int) {
        self.make = make
        self.model = model
        self.year = year
    }
}

final class Car: Vehicle2 {
    let numberOfDoors: Int
    
    init(make: String, model: String, year: Int, numberOfDoors: Int = 4) {
        self.numberOfDoors = numberOfDoors
        super.init(make: make, model: model, year: year)
    }
}

final class Truck: Vehicle2 {
    let cargoCapacity: Double
    
    init(make: String, model: String, year: Int, cargoCapacity: Double) {
        self.cargoCapacity = cargoCapacity
        super.init(make: make, model: model, year: year)
    }
}

final class Motorcycle: Vehicle2 {
    let hasSidecar: Bool
    
    init(make: String, model: String, year: Int, hasSidecar: Bool = false) {
        self.hasSidecar = hasSidecar
        super.init(make: make, model: model, year: year)
    }
}

let russianCar = Car(make: "Lada", model: "Vesta", year: 2010)
let germanTruck = Truck(make: "Mersedes", model: "Big boy", year: 2020, cargoCapacity: 100.5)
let japaneseMotorcycle = Motorcycle(make: "Honda", model: "Golden Wing", year: 1997, hasSidecar: true)

//№11
//Создайте класс **`Person`** с свойством **`name`**. При деинициализации экземпляра класса должно выводиться сообщение “Объект деинициаоищирован” в консоль.

final class Person2 {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Объект деинициализирован")
    }
}

var anton: Person2? = Person2(name: "Anton")
anton = nil

//№12
//Создайте класс **`NetworkConnection`** с методами **`connect`** и **`disconnect`**. При деинициализации экземпляра класса соединение должно отключаться.

final class NetworkConnection {
    var isConnected: Bool = false

    func connect() {
        isConnected = true
        print("Internet has been connected!")
    }
    
    func disconnect() {
        isConnected = false
        print("На что я жмал")
    }
    
    deinit {
        disconnect()
        print("Cabel is disconnected")
    }
}

var schoolNetwork: NetworkConnection? = NetworkConnection()
schoolNetwork?.connect()
schoolNetwork = nil

//№13
//Создайте класс в котором будет опциональное свойство, которое является другим классом. С помощью опциональной цепочки получите значение

final class NetworkMember {
    var userData: User?
    var bankAccount: Double
    
    init(bankAccount: Double) {
        self.bankAccount = bankAccount
    }
}

func sendNudes(someMember: NetworkMember?) {
    if let memberEmail = someMember?.userData?.email {
        print("Send nudes to \(memberEmail)")
    } else {
        print("I can't send nudes to member with no email")
    }
}

let momsMinecrafter = NetworkMember(bankAccount: 0)
sendNudes(someMember: momsMinecrafter)
momsMinecrafter.userData = User(username: "Puk")
sendNudes(someMember: momsMinecrafter)

//№14
//Напишите пример кода, который нарушает принцип DRY, а затем перепишите этот код, так, чтобы он его соблюдал.

final class Product {
    var name: String
    var price: Double
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
    
    func getDescription() -> String {
        return "\(name) - \(price) руб."
    }
}

final class Book {
    var name: String
    var price: Double
    var author: String
    var genre: String
    
    init(name: String, price: Double, author: String, genre: String) {
        self.name = name
        self.price = price
        self.author = author
        self.genre = genre
    }
    
    func getDescription() -> String {
        return "\(name) - \(author) (\(genre)) - \(price) руб."
    }
}

final class CD {
    var name: String
    var price: Double
    var artist: String
    var duration: Int
    
    init(name: String, price: Double, artist: String, duration: Int) {
        self.name = name
        self.price = price
        self.artist = artist
        self.duration = duration
    }
    
    func getDescription() -> String {
        let minutes = duration / 60
        let seconds = duration % 60
        return "\(name) - \(artist) (\(minutes):\(seconds)) - \(price) руб."
    }
}

//Соответствует

class Product2 {
    var name: String
    var price: Double
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
    
    func getDescription() -> String {
        return "\(name) - \(price) руб."
    }
}

final class Book2: Product2 {
    var author: String
    var genre: String
    
    init(name: String, price: Double, author: String, genre: String) {
        self.author = author
        self.genre = genre
        super.init(name: name, price: price)
    }
    
    override func getDescription() -> String {
        return "\(name) - \(author) (\(genre)) - \(price) руб."
    }
}

final class CD2: Product2 {
    var artist: String
    var duration: Int
    
    init(name: String, price: Double, artist: String, duration: Int) {
        self.artist = artist
        self.duration = duration
        super.init(name: name, price: price)
    }
    
    override func getDescription() -> String {
        let minutes = duration / 60
        let seconds = duration % 60
        return "\(name) - \(artist) (\(minutes):\(seconds)) - \(price) руб."
    }
}

//Еще пример

func sum(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func difference(_ a: Int, _ b: Int) -> Int {
    return a - b
}

func multiply(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func division(_ a: Int, _ b: Int) -> Int {
    return a / b
}

//Соответствует

func calculate(_ a: Int, _ b: Int, operation: String) -> Int {
    switch operation {
    case "+":
        return a + b
    case "-":
        return a - b
    case "*":
        return a * b
    case "/":
        return a / b
    default:
        return 0
    }
}

//№15
//Напишите пример кода, который нарушает принцип KISS, а затем перепишите этот код, так, чтобы он его соблюдал.

func checkLoginAndPassword(login: String?, password: String?) -> Bool {
    if let login, let password {
        if !login.isEmpty && !password.isEmpty {
            if login.count > 3 && login.count <= 8 {
                if password.count > 6 && password.count <= 8 {
                    return true
                }
            }
        }
    }
    return false
}

//Соответствует

func checkLoginAndPassword2(login: String?, password: String?) -> Bool {
    guard let login, let password else { return false }
    let symbolsRangeInLogin = 3...8
    let symbolsRangeInPassword = 6...8
    return symbolsRangeInLogin.contains(login.count) && symbolsRangeInPassword.contains(password.count)
}

checkLoginAndPassword2(login: "ABCD", password: "ewrefffrw")
