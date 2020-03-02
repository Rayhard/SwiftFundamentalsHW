import UIKit

/*
 Задание 1:
 Написать функцию, которая определяет, четное число или нет.
 */

// Обычная функция
func EvenNumber (_ number: Int) -> Bool{
    if number % 2 == 0{
        return true
    } else {
        return false
    }
}
EvenNumber(4)

// Тернарный оператор
let tenNumber: Int = 5
let even = tenNumber % 2 == 0 ? true : false

/*
 Задание 2:
 Написать функцию, которая определяет, делится ли число без остатка на 3.
 */

// Обычная функция
func divByThree (_ number: Int) -> Bool{
    if number % 3 == 0{
        return true
    } else {
        return false
    }
}
divByThree(7)

// Тернарный оператор
let divByThreeNumber: Int = 6
let evenThree = divByThreeNumber % 3 == 0 ? true : false

/*
 Задание 3:
 Создать возрастающий массив из 100 чисел.
 */
var numberArray: Array<Int> = []
for number in 1...100{
    numberArray.append(number)
}

/*
 Задание 4:
 Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
 */
for value in numberArray{
    if EvenNumber(value) || divByThree(value){
        numberArray.remove(at: numberArray.index(of: value)!)
    }
}

/*
 Задание 5*:
 Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
 */
func fibbonachi(_ number: Int) -> Array<Float80>{
    var fibArray: Array<Float80> = [0, 1]
    
    for index in 0...number-3{
        fibArray.append(fibArray[index] + fibArray[index+1])
    }
    return fibArray
}
fibbonachi(100)

/*
 Задание 6*:
 Заполнить массив из 100 элементов различными простыми числами.
 */
func prime(_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains { number % $0 == 0 }
}

var ezArray: Array<Int> = []
var ezIndex: Int = 0
while ezArray.count < 100 {
    if prime(ezIndex){
        ezArray.append(ezIndex)
    }
    ezIndex += 1
}
