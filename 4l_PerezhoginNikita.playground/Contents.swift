import UIKit

/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
*/
class Car{
    let mark: String
    let year: Int
    var motor: Motor
    var window: Window
    
    init(mark: String, year: Int, motor: Motor, window: Window) {
        self.mark = mark
        self.year = year
        self.motor = motor
        self.window = window
    }
    
    func changeStatusMotor(_ status: Motor){
        motor = status
    }
    func changeStatusWindow(_ status: Window){
    }
    func printParam() {
        print("Марка машины: \(mark)\nГод выпуска: \(year)\nСостояние мотора: \(motor)\nСостояние окон: \(window)")
    }
}
/*
 2. Описать пару его наследников trunkCar и sportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
*/
class TrunkCar: Car{
    let maxBagVolume: Int    // Максимальная вместительность(грузоподъемность)
    var bagVolume: Int  // Кол-во груза в данный момент
    
    init(mark: String, year: Int, motor: Motor, window: Window, maxBagVolume: Int, bagVolume: Int) {
        self.maxBagVolume = maxBagVolume
        self.bagVolume = bagVolume
        
        super.init(mark: mark, year: year, motor: motor, window: window)
    }
    
/*
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
*/
    override func changeStatusWindow(_ status: Window) {
        window = status
    }
    
    func changeBag(mode: Cargo, _ value: Int){
        guard (bagVolume + value) < maxBagVolume && (bagVolume + value) > 0 else {
            print("Количество багажа превышает допустимые нормы, или багажа не осталось")
            return
        }
        
        switch mode {
        case .add:
            bagVolume += value
        case .remove:
            bagVolume -= value
        }
    }
    
    override func printParam() {
        super.printParam()
        print("Размер багажника: \(maxBagVolume)\nКол-во вещей в багажнике: \(bagVolume)\n")
    }
}

class SportCar: Car{
    let maxSpeed: Int   //Максимальная скорость
    var speed: Int  // Текущая скорость
    
    init(mark: String, year: Int, motor: Motor, window: Window, maxSpeed: Int, speed: Int = 0) {
        self.maxSpeed = maxSpeed
        self.speed = speed
        
        super.init(mark: mark, year: year, motor: motor, window: window)
    }
    
/*
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
*/
    
    override func changeStatusMotor(_ status: Motor) {
        switch status {
        case .stop:
            speed = 0       // Считаем что, если двигатель остановлен, то машина не едет, а значит ее скорость равна 0
            motor = .stop
        case .run:
            motor = .run
        }
    }
    
    func changeSpeed(mode: Speed, _ value: Int){
        guard (speed + value) < maxSpeed && (speed + value) >= 0 else {
            print("Скорость превышает допустимые нормы, или она меньше 0")
            return
        }
        
        switch mode {
        case .add:
            if motor == .run{
                speed += value  // Можем изменить скорость только если двигатель работает
            }
        case .slowDown:
            speed -= value
        }
    }
    
    override func printParam() {
        super.printParam()
        print("Максимальная скорость: \(maxSpeed)\nТекущая скорость: \(speed)\n")
    }
}
/*
 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
*/
enum Motor{
    case run, stop
}
enum Window{
    case open, close, broken
}
enum Cargo{
    case add, remove
}
enum Speed{
    case add, slowDown
}

/*
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
*/
var lamborghini = SportCar(mark: "Lamborghini", year: 2010, motor: .stop, window: .close, maxSpeed: 200)
lamborghini.changeStatusMotor(.run) // Запускаем двигатель
lamborghini.changeSpeed(mode: .add, 100)    // Разгоняемся
lamborghini.changeSpeed(mode: .slowDown, 50)   //Тормозим


var cyberTruck = TrunkCar(mark: "Tesla CyberTruck", year: 2019, motor: .stop, window: .close, maxBagVolume: 200, bagVolume: 0)
cyberTruck.changeStatusWindow(.broken)
cyberTruck.changeBag(mode: .add, 10)

/*
 6. Вывести значения свойств экземпляров в консоль.
*/
lamborghini.printParam()
cyberTruck.printParam()
