import UIKit

/*
 Задание 1:
 Решить квадратное уравнение - ax^2 + bx + c = 0
 Примеры для проверки условий:
 1. [1, -3, -4]
 2. [1, -6, 9]
 3. [5, 2, 3]
 */
let params: Array<Double> = [1, -3.1, -4]
let discrim: Double = params[1] * params[1] - 4.0 * params[0] * params[2] // D=b^2-4ac
print("Дискриминант равен: \(NSString(format:"%.1f", discrim))")
if discrim == 0{
    let x: Double = (-params[1] + sqrt(discrim)) / (2.0 * params[0])
    print("Дискриминант равен 0, уравнение имеет один корень: \(NSString(format:"%.1f", x))\n")
} else if discrim < 0{
    print("Дискриминант меньше 0, уравнение не имеет действительных корней\n")
} else {
    let x1: Double = (-params[1] + sqrt(discrim)) / (2.0 * params[0])
    let x2: Double = (-params[1] - sqrt(discrim)) / (2.0 * params[0])
    print("Первый корень равен: \(NSString(format:"%.1f", x1)) \nВторой корень равен: \(NSString(format:"%.1f", x2))\n")
}


/*
 Задание 2:
 Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
 */
let cat1: Double = 10
let cat2: Double = 15

let hypotenuse: Double = sqrt(cat1 * cat1 + cat2 * cat2)
print("Гипотинуза равна: \(NSString(format:"%.3f", hypotenuse))")

let triSquare: Double = (cat1 * cat2) / 2
print("Площадь равна: \(NSString(format:"%.3f", triSquare))")

let triPerimeter: Double = cat1 + cat2 + hypotenuse
print("Периметр равен: \(NSString(format:"%.3f", triPerimeter))\n")


/*
 Задание 3*
 Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
 */
var userRub: Double = 10000
let userPerс: Double = 5.5
var summ = Double()
for index in 1...5{
    summ = userRub * (userPerс / 100)
    userRub += summ
    print("К концу \(index) года, у вас на вкладе будет \(NSString(format:"%.2f", userRub)) рублей")
}
