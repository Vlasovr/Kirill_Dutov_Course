import UIKit

// MARK: - 1 Удалить все гласные буквы в строке
//https://www.codewars.com/kata/52fba66badcd10859f00097e/train/swift

//Первое решение

func disemvowel(_ s: String) -> String {
    let vowels: Set<Character> = ["A", "E", "I", "O", "U", "a", "e", "i", "o", "u"]
    return String(s.filter { !vowels.contains($0) })
}

/* Описание решения: создаю множество символов(для более быстрой фильтрации по сравнению с массивами);
 фильтрую строку проверяя есть ли такой символ в переданной строке */

//Популярное решение

func disemvowel1(_ s: String) -> String {
  return s.replacingOccurrences(of: "[aeiou]", with: "", options: [.regularExpression, .caseInsensitive])
}

/* Описание решения: это решение лучше тем, что не создает доп константу в памяти, оно просто заменяет найденные гласные пустой строкой, но решение менее читаемое */

// MARK: - 2 Возвести в квадрат каждую цифру числа и вернуть новое число, состоящее из квадратов каждой цифры.
//https://www.codewars.com/kata/546e2562b03326a88e000020/train/swift

//Первое решение

func squareDigits(_ num: Int) -> Int {
    var squaredSymbols = ""

    String(num).forEach {
        squaredSymbols += String((Int(String($0)) ?? 0) * (Int(String($0)) ?? 0))
    }

    return Int(squaredSymbols) ?? 0
}

/* Описание решения: Создаю пустую строку, привожу число к строке, в цикле каждый символ привожу к инту(перемножая символ сам на себя) и добавляю к строке которую приведу к инту */

//Оптимальное решение

func squareDigits1(_ num: Int) -> Int {
  return Int(String(num).compactMap { Int(String($0)) }.compactMap { String($0 * $0) }.joined()) ?? 0
}

/*Описание решения:  решение лучше тем, что используется compactMap, чтобы сначала преобразовать число в массив цифр, затем возвести каждую цифру в квадрат и снова преобразовать в массив строк. В конце методом joined() строки объединяются в одну строку, которая затем преобразуется в Int. В этом решении используется арифметическое умножение для возведения в квадрат, в моем решении используется умножение с преобразованием типов. Более просто и лаконично задача решается 2 способом*/

// MARK: - 3 Посчитать сумму всех целых чисел, содержащихся в строке.
//https://www.codewars.com/kata/598f76a44f613e0e0b000026/train/swift

//Первое решение

func sumOfIntegersInString(_ string: String) -> Int {
    return string.components(separatedBy: CharacterSet.decimalDigits.inverted)
                 .reduce(0) { $0 + (Int($1) ?? 0) }
}

/* Описание решения: для разделения строки на массив подстрок, разделенных символами, не являющимися числами использую
    componentns(seperatedBy:), будет массив из пустых строк(вместо каждого символа, не являющимся числом) и чисел.  Затем через reduce вычисляю сумму всех символов, приведенных к инту, в массиве*/

//Оптимальное решение

func sumOfIntegersInString1(_ string: String) -> Int {
    return string.split { !$0.isNumber }.compactMap { Int($0) }.reduce(0, +)
}
/* Описание решения: через split решение более очевидно и лаконично */

// MARK: - 4 Получить год и вернуть его век
//https://www.codewars.com/kata/5a3fe3dde1ce0e8ed6000097/train/swift

//Первое решение

func century(_ year: Int) -> Int {
    return (year + 99) / 100
}

/* Описание решения: сначала к году прибавляется 99, чтобы убедиться, что округляю до следующего века, если год не оканчивается
    на 00 (например, 1901 будет округлен до 20-го века). Затем полученное число делится на 100, что дает номер века. */

//Оптимальное решение

func century1(_ year: Int) -> Int {
    return Int((Double(year) / 100).rounded(.up))
}
/* Описание решения: год преобразуется в Double, а затем делится на 100, чтобы получить число, представляющее процентное
    соотношение этого года в текущем веке. Затем результат округляется вверх через rounded(.up). Решение может быть быстрее, потому что не требуется выполнение операции сложения. */

// MARK: - 5 Переупорядочить цифры числа, чтобы получить максимальное число
//https://www.codewars.com/kata/5467e4d82edf8bbf40000155/train/swift

//Первое решение

func descendingOrder(of number: Int) -> Int {
    return Int(String(number).sorted(by: >)
                             .compactMap{String($0)}
                             .joined()) ?? 0
}

/* Описание решения: привожу Int к String, .sorted - чтобы отсортировать цифры входного числа в порядке убывания. Затем, используя compactMap{String($0)}.joined(), преобразовал отсортированный массив цифр в строку и затем в число. */

//Оптимальное решение

func descendingOrder1(of number: Int) -> Int {
  return Int(String(String(number).sorted{
    $0 > $1
  })) ?? 0
}

/* Описание решения: в задаче лучше использовать приведение к string, чем использовать .compactMap{String($0)}.joined()) */

// MARK: - 6 Вернуть длину самого короткого слова в строке
//https://www.codewars.com/kata/57cebe1dc6fdc20c57000ac9/train/swift

//Первое решение

func find_short(_ str: String) -> Int {
    return str.components(separatedBy: " ")
            .sorted(by: { $0.count < $1.count} )
            .first?.count ?? 0
}

/* Описание решения: сортирую слова в порядке возрастания их длины, затем возвращаю длину первого (то есть самого короткого)
    слова из отсортированного массива. */

//Оптимальное решение

func find_short1(_ str: String) -> Int {
  return str.components(separatedBy: " ").map { $0.count }.min() ?? 0
}

/* Описание решения: создает массив длин слов через map, затем использует min() для нахождения мин значения в этом массиве. мой
    способ решения является менее эффективным, так как он сортирует весь массив слов, когда нужно только найти самое короткое. */

// MARK: - 7
//https://www.codewars.com/kata/5a2fd38b55519ed98f0000ce/train/swift

//Первое решение

func multi_table(_ number: Int) -> String {
    return "1 * \(number) = \(1 * number)\n2 * \(number) = \(2 * number)\n3 * \(number) = \(3 * number)\n4 * \(number) = \(4 * number)\n5 * \(number) = \(5 * number)\n6 * \(number) = \(6 * number)\n7 * \(number) = \(7 * number)\n8 * \(number) = \(8 * number)\n9 * \(number) = \(9 * number)\n10 * \(number) = \(10 * number)"

}
/* Описание решения: захардкодил решение, при изменении условий задачи, нужно будет много переделывать */

//Оптимальное решение

func multi_table1(_ number: Int) -> String {
    (1...10).map {"\($0) * \(number) = \($0 * number)"}.joined(separator: "\n")
}

/* Описание решения: легкочитаемое лаконичное решение: создается массив строк из диапозона, после чего все строки объединяются в одну*/

// MARK: - 8 Приходит три числа a,b,c, верните наибольшее число, полученное после вставки следующих операторов и скобок: +, *, ()
//https://www.codewars.com/kata/5ae62fcf252e66d44d00008e/train/swift

//Первое решение

func expressionMatter(_ a: Int, _ b: Int, _ c: Int) -> Int {
   return [ a * (b + c), a * b * c, a + b * c, (a + b) * c, a + b + c].max() ?? 0
}

/* Описание решения: использую массив для хранения всех возможных вариантов выражения и затем нахожу максимальное значение с помощью метода max().  */

//Оптимальное решение

func expressionMatter1(_ a: Int, _ b: Int, _ c: Int) -> Int {
  return max(a + b + c, (a + b) * c, a * (b + c),  a * b * c)
}

/* Описание решения: сразу вычисляет максимальное значение, не создавая доп массивов. Мой способ решения создает доп массив, что менее эффективно*/

// MARK: - 9 Преобразовать первую букву каждого слова строки в заглавную
//https://www.codewars.com/kata/5390bac347d09b7da40006f6/train/swift

//Первое решение

extension String {
    func toJadenCase() -> String {
        return self.capitalized
    }
}

/* Описание решения: преобразую первую букву каждого слова строки в заглавную через capitalized */

//Оптимальное решение

extension String {
    func toJadenCase1() -> String {
        return capitalized
    }
}

/* Описание решения: в моем решении использую self. Это не обязательно, так как внутри метода уже доступно значение self */

// MARK: - 10 Найти сумму нечет чисел в треугольнике из нечетных чисел
//https://www.codewars.com/kata/55fd2d567d94ac3bc9000064/train/swift

//Первое решение

func rowSumOddNumbers(_ row: Int) -> Int {
    return Int(pow(Double(row), 3))
}

/* Описание решения: по примерам в задаче видно, что каждая новая строка(по номеру) возводится в 3 степень */

//Оптимальное решение

func rowSumOddNumbers1(_ row: Int) -> Int {
    return row * row * row
}

/* Описание решения: данное решение может быть более эффективным, так как тут используется только умножение, а не вызов встроенной функции возведения, но если условие поменяется, больше кода придется написать */

// MARK: - 11 Найдите первое непоследовательное число
//https://www.codewars.com/kata/58f8a3a27a5c28d92e000144/train/swift

//Первое решение

func firstNonConsecutive (_ arr: [Int]) -> Int? {
    for index in 1..<arr.count {
        if arr[index] != arr[index-1] + 1 {
            return arr[index]
        }
    }
    return nil
}

/* Описание решения: цикл начинается со 2 элемента, проверяю, равно ли значение текущего элемента предыдущему элементу плюс 1. Если это не так, то текущий элемент возвращается из функции, если ничего нет, возвращается nil*/

//Оптимальное решение

func firstNonConsecutive1(_ arr: [Int]) -> Int? {
  for i in 1..<arr.count {
    if arr[i] - arr[i-1] > 1 { return arr[i] }
  }
    return nil
}

/* Описание решения: проверяется, насколько отличается значение текущего элемента от предыдущего. Если разница больше 1, то текущий элемент возвращается из функции. Разницы в решении нет, там и там происходят вычисления в условной конструкции*/

// MARK: - 12 Перевернуть диапозон чисел до n
//https://www.codewars.com/kata/5a00e05cc374cb34d100000d/train/swift

//Первое решение

func reverseSeq(n: Int) -> [Int] {
    return (1...n).reversed()
}

/* Описание решения: создаю массив через от 1 до n черех оператор диапозона, и потом просто меняю порядок чисел наоборот */

//Оптимальное решение

func reverseSeq1(n: Int) -> [Int] {
    return (1...n).reversed()
}

/* Описание решения: идентично */

// MARK: - 13 Найдите число, которое появляется нечетное количество раз.
//https://www.codewars.com/kata/54da5a58ea159efa38000836/train/swift

//Первое решение

func findIt(_ seq: [Int]) -> Int {
    var count = 0
    for i in 0..<seq.count {
        count = 0
        for j in 0..<seq.count {
            if seq[i] == seq[j] {
                count += 1
            }
        }
        if count % 2 != 0{
            return seq[i]
        }
    }
    return 0
}

/* Описание решения: для каждого элемента в массиве seq подсчитываю количество его вхождений в массив, а затем проверка, является ли это количество нечетным. Если количество нечетное, то элемент возвращается как результат. Скорость решения низкая из-за вложенного цикла */

//Оптимальное решение

func findIt1(_ seq: [Int]) -> Int {
  seq.reduce(0, ^)
}

/* Описание решения: данное решение более эффективное, используется оператор исключающего ИЛИ (^), который применяется к каждому элементу, чтобы вычислить и вернуть XOR всех элементов в массиве. Это значит, что если элемент повторяется четное количество раз, он будет отброшен, а если он повторяется нечетное - будет возвращен как результат. */

// MARK: - 14 Делится ли число на x и y
//https://www.codewars.com/kata/5545f109004975ea66000086/train/swift

//Первое решение

func isDivisible(_ n: Int, _ x: Int, _ y: Int) -> Bool {
    return n % y == 0 && n % x == 0
}

/* Описание решения: через тернарный оператор проверка делится ли нацело число на х и y */

//Оптимальное решение

func isDivisible1(_ n: Int, _ x: Int, _ y: Int) -> Bool {
    return n % x == 0 && n % y == 0
}

/* Описание решения: идентично */

// MARK: - 15 Вернуть bool в строковом представлении
//https://www.codewars.com/kata/551b4501ac0447318f0009cd/train/swift

//Первое решение

func booleanToString(_ b: Bool) -> String {
    return b.description
}

/* Описание решения: description является частью протокола CustomStringConvertible и по умолчанию возвращает строку "true" или "false".*/

//Оптимальное решение

func booleanToString1(_ b: Bool) -> String {
  return String(b)
}

/* Описание решения: решение является более явным и читаемым */

// MARK: - 16 Сумма положительных чисел
//https://www.codewars.com/kata/5715eaedb436cf5606000381/train/swift

//Первое решение

func sumOfPositives (_ numbers: [Int] ) -> Int {
    return numbers.reduce(0) { $1 > 0 ? $0 + $1 : $0 }
}

/* Описание решения: начальное значение суммы установлено равным 0, а затем каждый элемент массива сравнивается с нулем. Если элемент больше нуля, то он добавляется к аккумулятору */

//Популярное решение

func sumOfPositives1(_ numbers: [Int] ) -> Int {
    return numbers.filter{ $0 > 0 }.reduce(0, +)
}

/* Описание решения: мой способ более эффективный по скорости, так как использует только один проход по массиву, в то время как этот использует сначала filter, однако это решение может быть более читаемым */

// MARK: - 17 Противоположное число
//https://www.codewars.com/kata/56dec885c54a926dcd001095/train/swift

//Первое решение

func opposite(number: Double) -> Double {
    return -number
}

/* Описание решения: при возврате числа с минусом число будет в любом случае противоположным  */

//Оптимальное решение

func opposite1(number: Double) -> Double {
  return -number
}

/* Описание решения: идентично */

// MARK: - 18 вернуть массив с удвоенными элементами
//https://www.codewars.com/kata/57f781872e3d8ca2a000007e/train/swift

//Первое решение

func maps(a : Array<Int>) -> Array<Int> {
    return a.map { $0 * 2 }
}

/* Описание решения: через map возвращается новый массив с удвоенными элементами */

//Оптимальное решение

func maps1(a : Array<Int>) -> Array<Int> {
return a.map { $0 * 2}
}

/* Описание решения: идентично */

// MARK: - 19 Приходит строка(слово), вернуть массив одного и того же слова(в количестве, равном количеству букв в этом слове):
//wave("hello") => {"Hello", "hEllo", "heLlo", "helLo", "hellO"}
//https://www.codewars.com/kata/58f5c63f1e26ecda7e000029/train/swift

//Первое решение

func wave(_ y: String) -> [String] {
    var resultString = [String]()
    
    for(index, char) in y.enumerated() {
        if char.isLetter {
            var wave = y
            let charIndex = wave.index(wave.startIndex, offsetBy: index)
            wave.replaceSubrange(charIndex...charIndex, with: String(char).uppercased())
            resultString.append(wave)
        }
    }
    
    return resultString
}

/* Описание решения: Создаю пустой массив строк, в цикле перебираю все символы строки вместе с индексами. Если текущий символ char является буквой, то создаю копию строки(wave). Затем нахожу индекс текущего символа в wave. Через replaceSubrange в wave заменяем символ по индексу charIndex на заглавный через uppercased(); wave на текущей итерации добавляю в resultString.*/

//Оптимальное решение

func wave1(_ y: String) -> [String] {
  var wave = [String]()
  for i in y.indices {
    if !y[i].isWhitespace {
      wave.append(y[..<i] + y[i].uppercased() + y[y.index(after: i)...])
    }
  }
  return wave
}

/* Описание решения: решение формирует новую строку для каждой буквы, и создается меньше временных переменных, что будет лучше по производительности, но займет больше памяти если входная строка большая  */

// MARK: - 20 Спрятать решетками номер кредитки(оставив последние 4 цифры)
//https://www.codewars.com/kata/5412509bd436bd33920011bc/train/swift

//Первое решение

func maskify(_ string:String) -> String {
    guard string.count > 4 else { return string }
    return string.replacingCharacters(in: string.startIndex..<string.index(string.endIndex, offsetBy: -4),
                                      with: String(repeatElement("#", count: string.count - 4)))
}

/* Описание решения: проверяю больше ли 4 элементов в строке. Если нет - возвращаю исходную строку. Замещаю поверх всех сивмолов до 4 последних символов решетками */

//Популярное решение

func maskify1(_ string:String) -> String {
  string.enumerated().map { $0 < string.count - 4 ? "#" : "\($1)"}.joined()
}

/* Описание решения: решение менее эффективно по скорости, т.к используется enumerated, потом map в котором проверка, создается новый массив символов, который потом преобразует в строку. При большой строке на вычисления уйдет больше времени, но решение более читаемое. Мое решение просто изменяет часть исходной строки и есть guard благодаря которому, если что, можно сразу выйти из функции */

// MARK: - 21 Вернуть строку, повторяющиюся n раз
//https://www.codewars.com/kata/57a0e5c372292dd76d000d7e/train/swift

//Первое решение

func repeatStr(_ n: Int, _ string: String) -> String {
    return String(repeating: string, count: n)
}

/* Описание решения: использую repeating для создания повторяющейся строки n раз */

//Оптимальное решение

func repeatStr1(_ n: Int, _ string: String) -> String {
  return String(repeating: string, count: n)
}

/* Описание решения: идентично */

// MARK: - 22 Проверить прыжковое число(число, в котором все соседние цифры в нем отличаются на 1)
//https://www.codewars.com/kata/5a54e796b3bfa8932c0000ed/train/swift

//Первое решение

func jumpingNumber(_ number: Int) -> String {
    guard number > 9 else { return "Jumping!!"}
    let arrayOfNumbers = String(number).compactMap{ Int(String($0)) }
    
    for i in 0..<arrayOfNumbers.count - 1 {
        if abs(arrayOfNumbers[i+1] - arrayOfNumbers[i]) != 1 {  return "Not!!" }
    }
    
    return "Jumping!!"
}

/* Описание решения: проверяю, что заданное число содержит не менее двух цифр; преобразую число в массив цифр через compactMap(_:) при этом отбрасывая nil. Прохожусь по массиву, проверяя, что каждая следующая цифра отличается от предыдущей на единицу. Если есть пара цифр, у которых разница не равна единице, то вернется "NOT!!", иначе "Jumping!!". */

//Популярное решение

func jumpingNumber1(_ number: Int) -> String {
  let numbers = String(number).compactMap { c in c.wholeNumberValue }
  for i in 1..<numbers.count {
      if abs(numbers[i - 1] - numbers[i]) != 1 {
          return "Not!!";
      }
  }
  return "Jumping!!";
}

/* Описание решения: похожее решение, но не используется guard, а благодаря этому можно сразу выйти из функции */

// MARK: - 23 Найти сумму минимальных положительных чисел
//https://www.codewars.com/kata/558fc85d8fd1938afb000014/train/swift

//Первое решение

func sumOfTwoSmallestIntegersIn(_ array: [Int]) -> Int {
    let positiveSortedArray = array.sorted(by: <)
    return positiveSortedArray[0] + positiveSortedArray[1]
}

/* Описание решения: инициализирую массив отсортированных чисел, складываю 2 первых элемента массива */

//Оптимальное решение

func sumOfTwoSmallestIntegersIn1(_ array: [Int]) -> Int {
  return array.sorted()[0...1].reduce(0, +)
}

/* Описание решения: использует sorted() без аргументов, берет первые два элемента с помощью диапазона 0...1 и суммирует их. Решение лаконичнее */

// MARK: - 24 Подсчитать количество чисел в диапозоне, числа не должны содержать цифру 5
//https://www.codewars.com/kata/5813d19765d81c592200001a/train/swift

//Первое решение

func dontGiveMeFive(_ start: Int, _ end: Int) -> Int {
    return (start...end)
            .filter{ !String($0).contains("5") }
            .count
}

/* Описание решения: создаю диапозон, фильтрую его цифрами, которые не содержат цифру в строковом представлении, затем считаю кол-во элементов полученного массива */

//Самое популярное

func dontGiveMeFive1(_ start: Int, _ end: Int) -> Int {
  return (start...end).filter { !String($0).contains("5") }.count
}

/* Описание решения: идентично */

// MARK: - 25 Формула Герона
//https://www.codewars.com/kata/57aa218e72292d98d500240f/train/swift

//Первое решение

func heron(_ a: Double, _ b: Double, _ c: Double) -> Double {
    let square = (a + b + c) / 2
    return sqrt(square * (square - a) * (square - b) * (square - c))
}

/* Описание решения: создаю константу площадь по формуле, возвращаю результат извлечения квадртного корня по формуле Герона  */

//Оптимальное решение

func heron1(_ a: Double, _ b: Double, _ c: Double) -> Double {
  let s = (a + b + c) / 2
  return sqrt(s * (s - a) * (s - b) * (s - c))
}

/* Описание решения: решение самое лаконичное, если не использовать доп константу, будет больше арифметических вычислений */

// MARK: - 26 - Рассчитать необходимое количество рулонов обоев
//https://www.codewars.com/kata/567501aec64b81e252000003/train/swift

//Первое решение

func wallpaper(_ l: Double, _  w: Double,_  h: Double) -> String {
    let numbers = ["zero", "one", "two", "three", "four", "five",
               "six", "seven", "eight", "nine", "ten",
               "eleven", "twelve", "thirteen", "fourteen", "fifteen",
               "sixteen", "seventeen", "eighteen", "nineteen", "twenty"]

    return w * h * l == 0 ? numbers[0] :
           numbers[Int(ceil((l * h * 2 + w * h * 2) * 1.15 / 5.2))]
}

/* Описание решения: проверяю дают ли 0 параметры комнтаты, если да - возвращаем первый элемент массива, нет - возвращаем элемент под индексом, вычисленныым через выведенную формулу, округленную до большего числа через ceil() (для покупки с запасом) */

//Оптимальное решение

func wallpaper1(_ l: Double, _  w: Double,_  h: Double) -> String {
    let numbers = ["zero", "one", "two", "three", "four", "five",
               "six", "seven", "eight", "nine", "ten",
               "eleven", "twelve", "thirteen", "fourteen", "fifteen",
               "sixteen", "seventeen", "eighteen", "nineteen", "twenty"]
    return l*w*h == 0 ? "zero" : numbers[Int((l * 2 + w * 2) / 0.52 * h / 10 * 1.15) + 1]
}

/* Описание решения: решение не округляет, а просто прибавляет дополнительный рулон, соответственно не надо вызывать доп функцию ceil()*/

// MARK: - 27 Вернуть строку, соответствующую вычисленному ИМТ
//https://www.codewars.com/kata/57a429e253ba3381850000fb

//Первое решение

func bmi(_ weight: Int, _ height: Double) -> String {
    let bmi = Double(weight) / (height * height)
    return bmi <= 18.5 ? "Underweight" : bmi <= 25.0 ? "Normal" : bmi <= 30.0 ? "Overweight" : "Obese"
}
/* Описание решения: создаю константу, хранящую вычисление ИМТ, через тернарный оператор проверяю на условие если false, перехожу ко 2 условию и т.д., из-за вложеного тернарного оператора решение трудночитаемое */

//Оптимальное решение

func bmi1(_ weight: Int, _ height: Double) -> String {
    switch Double(weight)/pow(height, 2) {
      case ...18.5: return "Underweight"
      case ...25.0: return "Normal"
      case ...30.0: return "Overweight"
      default: return "Obese"
    }
}
/* Описание решения: не создает в памяти константу, использует оператор switch для определения ИМТ, что делает решение более структурированным и читаемым */

// MARK: - 28 Хватит ли пуль герою, чтобы выжить(2 пули = 1 дракон)
//https://www.codewars.com/kata/59ca8246d751df55cc00014c/train/swift

//Первое решение

func hero(bullets: Int, dragons: Int) -> Bool {
    return bullets - 2 * dragons >= 0 ? true : false
}

/* Описание решения: через тернарный проверю меньше ли 0 количество пуль(если да и герою хватит пуль вернется true */

//Оптимальное решение

func hero1(bullets: Int, dragons: Int) -> Bool {
    return bullets >= dragons * 2
}

/* Описание решения: не использует тернарник, делает код более читаемым за счет проверки больше или равно количество пуль чтобы убить всех драконов. Решение использует на арифметическую операцию меньше */

// MARK: - 29 Вернуть мультипликативную устойчивость числа, которая представляет собой количество раз, которое необходимо перемножить цифры в num, чтобы достичь одной цифры.
// Example: 39 --> 3 (because 3*9 = 27, 2*7 = 14, 1*4 = 4 and 4 has only one digit)
//https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/train/swift

//Первое решение

func persistence(for num: Int) -> Int {
    guard num > 9 else { return 0 }
    let intermediateMultiply = String(num).compactMap{ Int(String($0)) }.reduce(1, *)
    return persistence(for: intermediateMultiply) + 1
}

/* Описание решения: проверяю если число больше 9, то можно создавать промежуточное умножение - создаю массив цифр через compactMap, через reduce перемножаю все цифры; затем рекурсивно вызываю функцию, передавая результат перемножения, и увеличваю результат на 1. Функция вызывается рекурсивно, пока промежуточный результат не станет равен десятичной цифре */

// Оптимальное решение

func persistence1(for num: Int) -> Int {
  guard num > 9 else { return 0 }
  return 1 + persistence(for: String(num).reduce(1) { $0 * Int(String($1))! })
}

/* Описание решения: cразу рекурисивно вызывает, без создания промежуточных констант, плюс сразу в reduce переводит каждый символ в Int и перемножает каждое с произведением. Не использует compactMap, соответственно на одно создание и один проход меньше. Плохо, что использует force unwrap */

//Понравившееся решение

func persistence2(for num: Int) -> Int {
    let multipleNumbers: (Int) -> Int = { String($0).filter({ $0 != "1" && $0 != "0" }).compactMap({ $0.wholeNumberValue }).reduce(1, *) }
    var multipleCount = 0
    var multipleResult = num

    while multipleResult > 9 {
        multipleResult = multipleNumbers(multipleResult)
        multipleCount += 1
    }

    return multipleCount
}

/* Описание решения: не считаю это самым оптимальным, но оно довольно читаемое, понравилось использованием замыкания */

// MARK: - 30 Зажигание лампочек дрона
//https://www.codewars.com/kata/58356a94f8358058f30004b5/train/swift

//Первое решение

func flyBy(lamps: String, drone: String) -> String {
    return lamps.replacingCharacters(in: lamps.startIndex...drone.index(before: drone.endIndex),
                                     with: String(repeatElement("o", count: drone.count)))
}

/* Описание решения: использую замену символов replacingCharacters в диапозоне от начала ламп до индекса перед символом T, меняя на строку из "o", и это конкатенируется со строкой с оставшимися "х"*/

//Оптимальное решение

func flyBy1( lamps: String, drone: String) -> String {
 String(repeating: "o", count: drone.count) + String(repeating: "x", count: (lamps.count - drone.count))
}

/* Описание решения: через repeating(_:count:) создается строка, из "o", а затем конкатенируется со строкой, из "x".Код более простой и понятный. Также, решение не создает внутреннюю копию строки lamps, что может сэкономить память*/

// MARK: - 31 Найти, сколько раз цифра d встречается в квадрате каждого числа до n
//https://www.codewars.com/kata/566fc12495810954b1000030/train/swift

//Первое решение

func nbDig(_ n: Int, _ d: Int) -> Int {
    var countDigit = 0
    for i in 0...n {
        let square = String(i * i)
        countDigit += square.filter { String($0) == "\(d)" }.count
    }
    return countDigit
}

/* Описание решения: прохожусь циклом от 0 до n и для каждого числа вычисляю квадрат, потом преобразую квадрат в строку и филтрую все символы, кроме d. Возвращаю количество вхождений d */

//Оптимальное решение

func nbDig1(_ n: Int, _ d: Int) -> Int {
    return (0...n)
            .map {String($0*$0)}
            .joined()
            .filter{"\($0)" == "\(d)"}
            .count
}

/* Описание решения: благодаря использованию функциональных методов, решение лаконично. */

// MARK: - 32 Найти день, когда растение вырастет до нужного размера
//https://www.codewars.com/kata/58941fec8afa3618c9000184/train/swift

//Первое решение

func growingPlant(_ upSpeed: Int, _ downSpeed: Int, _ desiredHeight: Int) -> Int {
    var currentHeight = 0
    var countDay = 0
    
    while desiredHeight >= currentHeight {
        currentHeight += upSpeed
        countDay += 1
        if desiredHeight <= currentHeight {
            return countDay
        }
        currentHeight -= downSpeed
    }
    
    return countDay
}

/* Описание решения: в цикле while увеличиваю высоту растения и уменьшаю высоту ночью, пока высота не достигнет desiredHeight, прошедшие дни до достижения цели, сохраняю в countDay., в условном операторе проверяю, вдруг растение уже выросло до наступления ночи*/

//Оптимальное решение

func growingPlant1(_ upSpeed: Int, _ downSpeed: Int, _ desiredHeight: Int) -> Int {
    var currentHeight = upSpeed
    var days = 1
    while currentHeight < desiredHeight {
        currentHeight -= downSpeed
        currentHeight += upSpeed
        days += 1
    }
 return days
}

/* Описание решения: решение делает меньше операций и требует меньше проверок: цикл while продолжает выполняться, пока текущая высота меньше желаемой высоты, что уменьшает количество проверок в цикле.*/

// MARK: - 33 Преоразовать двумерный массив в одномерный и отсортировать по возрастанию элементы
//https://www.codewars.com/kata/57ee99a16c8df7b02d00045f/train/swift

//Первое решение

func flattenAndSort<T: Comparable>(_ arr: [[T]]) -> [T] {
    return arr.flatMap{$0}.sorted()
}

/* Описание решения: через flatMap преобразую двумерный массив в одномерный, объединяя все подмассивы в один массив, потом сортирую */

//Оптимальное решение

func flattenAndSort1<T: Comparable>(_ arr: [[T]]) -> [T] {
  return arr.flatMap{ $0 }.sorted()
}

/* Описание решения: идентично */

// MARK: - 34 Найти все не последовательные элементы, вернуть кортежем индекс и элемент
//https://www.codewars.com/kata/58f8b35fda19c0c79400020f/train/swift

//Первое решение

func allNonConsecutive (_ arr: [Int]) -> [(Int, Int)] {
    guard arr.count > 1 else { return []}
    
    var arrayOfTuples = [(Int, Int)]()
        for index in 1..<arr.count {
            if arr[index] != arr[index-1] + 1 {
                arrayOfTuples.append((index, arr[index]))
            }
        }
    
    return arrayOfTuples
}
/* Описание решения: проверяю чтобы кол-во элементов было больше 1, создаю пустой массив кортежей. Цикл начинается со 2 элемента, проверяю, равно ли значение текущего элемента предыдущему элементу плюс 1. Возвращаю кортеж, содержащий индекс и значение каждого элемента, который не соответствует требованию непоследовательности */

//Понравившееся решение

func allNonConsecutive1 (_ arr: [Int]) -> [(Int, Int)] {
  arr.enumerated().dropFirst().filter { arr[$0.0 - 1] != $0.1 - 1 }
}

/* Описание решения: По производительности решение будет работать быстрее, потому что не создает новый массив кортежей, вместо этого использует метод enumerated(), чтобы получить индекс и значение, потом фильтрует этот список, оставляя только элементы, которые не соответствуют условию непоследовательности. Однако, мое решение более читабельное, поскольку явно возвращает индекс и значение для каждого непоследовательного элемента */

// MARK: - 35 Найти максимальное число которое делится на d и не больше b
//https://www.codewars.com/kata/5aba780a6a176b029800041c/train/swift

//Первое решение

func maxMultiple(_ d: Int, _ b: Int) -> Int {
    return (1...10000)
            .filter{ $0 % d == 0 && $0 <= b }
            .max() ?? 0
}
maxMultiple(2, 7)
/* Описание решения: создаю диапозон до условного максимума(10000), фильтрую чтобы элемент подходил условию задачи, беру максимальный элемент, решение не до конца верное и малоэффективное, избыточные вычисления из-за такого диапозона */

//Оптимальное решение

func maxMultiple1(_ d: Int, _ b: Int) -> Int {
    return (b / d) * d
}

/* Описание решения: решение выполняет только одно деление(получим наибольшее число которое может делиться) и одно умножение(результат - наибольшее число, которое можно получить путем умножения на d и не превышающим b), чтобы получить результат, в то время как мое решение делает кучу операций */

// MARK: - 36 Добавить пробелы между символами
//https://www.codewars.com/kata/57f8ee485cae443c4d000127/train/swift

//Первое решение

func spacify(_ str: String) -> String {
    return str.map { String($0) }.joined(separator: " ")
}
spacify("Hello world")

/* Описание решения: через map создаю массив строк */

//Оптимальное решение

func spacify1(_ str: String) -> String {
  return str.map { String($0) }.joined(separator: " ")
}

/* Описание решения: читаемое и лаконичное решение */

// MARK: - 37 Определить адрес дома на противоположное стороне улицы
//https://www.codewars.com/kata/5f0ed36164f2bc00283aed07/train/swift

//Первое решение

func overTheRoad(address: Int, street: Int) -> Int {
    if address % 2 != 0{
        let leftHouses = (1...street * 2).filter{ $0 % 2 != 0 }
        let rightHouses = Array(leftHouses.reversed().map{ $0 + 1 })
        
        for (index, value) in rightHouses.enumerated() {
            if value == address {
                return rightHouses[index]
            }
        }
        
    } else {
        let leftHouses = (1...street * 2).filter{ $0 % 2 == 0 }
        let rightHouses = Array(leftHouses.reversed().map{ $0 - 1 })
        
        for (index, value) in rightHouses.enumerated() {
            if value == address {
                return rightHouses[index]
            }
        }
    }
    
    return 0
}

/* Описание решения: проверяю адрес своего дома на четность, создаю левую сторону улицы через диапозон из всех домов, фильтрую чтобы были только четные/нечетные, во второй стороне переворачиваю первый массив, через map прибавляю/вычитаю каждый элемент на 1. В цикле условие - если значение равно адресу дома, возвращем число из второго массива под таким же индексом */

//Оптимальное решение

func overTheRoad1(address: Int, street: Int) -> Int {
    street * 2 + 1 - address
}

/* Описание решения: можно даже не озвучивать, чем лучше.. Читабельно, лакончино, не использует хранение констант, циклов, использует только арифметические операции */

// MARK: - 38 Подсчитать число десятичных чисел
//https://www.codewars.com/kata/58fa273ca6d84c158e000052/solutions/swift

//Первое решение

func digits(num n: UInt64) -> Int {
    return String(n).count
}

/* Описание решения: привожу число к строке, считаю кол-во символов в строке*/

//Оптимальное решение

func digits1(num n: UInt64) -> Int {
  return String(n).count
}

/* Описание решения: это самое лаконичное и простое решение */

// MARK: - 39 Отсортировать мужчин от мальчиков
//https://www.codewars.com/kata/5af15a37de4c7f223e00012d/train/swift

//Первое решение

func menFromBoys(_ arr: [Int]) -> [Int] {
    var arrayOfArray = [[Int]]()
    arrayOfArray.append(Set(arr).filter{ $0 % 2 == 0 }.sorted())
    arrayOfArray.append(Set(arr).filter{ $0 % 2 != 0 }.sorted(by: >))
    return arrayOfArray.flatMap{ $0 }
}

/* Описание решения: создаю двумерный массив, добавляю в него уникальный массив отсортированных четных чисел, а потом нечетных, возвращаю через flatMap преобразованный массив */

//Оптимальное решение

func menFromBoys1(_ arr: [Int]) -> [Int] {
    let men: [Int] = Array(Set(arr.filter{ $0 % 2 == 0 })).sorted()
    let boys: [Int] = Array(Set(arr.filter{ $0 % 2 != 0 })).sorted { $0 > $1 }
    return men + boys
}

/* Описание решения: создает 2 константы, приведение к Array лишнее, не использует flatMap по каждому элементу, а просто складывает 2 массива, т.е. тратит чуть больше памяти, зато производительнее */

// MARK: - 40 Считать сумму цифр, пока не станет десятичным числом
//https://www.codewars.com/kata/541c8630095125aba6000c00/train/swift

//Первое решение

func digitalRoot(of number: Int) -> Int {
    guard number > 9 else { return number }
    return digitalRoot(of: String(number).reduce(0) {
        $0 + (Int(String($1)) ?? 0)
    })
}

/* Описание решения: рекурсивно вызываю функцию, с каждым вызовом новое число преобразуется в строку; и считаю сумму цифр */

//Самое популярное

func digitalRoot1(of number: Int) -> Int {
    return (1 + (number - 1) % 9)
}

/* Описание решения: (number - 1) % 9 выражение находит остаток от деления (остаток от деления на 9 равен тому же числу, что и остаток от деления на 9 остатка от деления на 9, т.е. (a % 9) % 9 = a % 9)). Этот остаток от деления (number - 1) на 9 может принимать значения от 0 до 8, которые соответствуют суммам цифр числа, кратным 9. Добавляем 1 к остатку от деления (number - 1) на 9, чтобы получить цифровой корень. Добавление единицы означает, что к остатку от деления на 9 добавляется единица, если number не кратно 9, иначе цифровой корень будет равен 9.
    Считаю решение прикольным, но запутанным, оптимальнее моего решения не нашел*/
