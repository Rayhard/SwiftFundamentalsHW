import UIKit

enum Door{
    case open, close
}
enum Motor {
    case run, stop
}

/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
*/
protocol Car{
    var mark: String {get}
    var year: Int {get}
    var door: Door {get set}
    var motor: Motor {get set}
    
    func changeDoorState()
    func changeMotorState()
    
}

/*
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
*/
extension Car {
    mutating func changeDoorState(_ status: Door){
        door = status
    }
    mutating func changeMotorState(_ status: Motor){
        motor = status
    }
}

/*
 3. Создать два класса, имплементирующих протокол «Car»: tunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
*/
class TunkCar: Car{
    var mark: String
    var year: Int
    var door: Door
    var motor: Motor

    let maxBagVolume: Int
    var bagVolume: Int
    
    init(mark: String, year: Int, door: Door = .close, motor: Motor = .stop, maxBagVolume: Int, bagVolume: Int) {
        self.mark = mark
        self.year = year
        self.door = door
        self.motor = motor
        self.maxBagVolume = maxBagVolume
        self.bagVolume = bagVolume
    }
    
    func changeDoorState() {
    }
    
    func changeMotorState() {
    }
}

class SportCar: Car{
    var mark: String
    var year: Int
    var door: Door
    var motor: Motor
    
    let maxSpeed: Int
    var speed: Int
    
    init(mark: String, year: Int, door: Door = .close, motor: Motor = .stop, maxSpeed: Int, speed: Int) {
        self.mark = mark
        self.year = year
        self.door = door
        self.motor = motor
        self.maxSpeed = maxSpeed
        self.speed = speed
    }
    
    func changeDoorState() {
    }

    func changeMotorState() {
    }
}

/*
 4. Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
*/
extension SportCar: CustomStringConvertible{
    var description: String {
        return "Марка машины: \(mark)\nГод выпуска: \(year)\nСостояние мотора: \(motor)\nСостояние Дверей: \(door)\nМаксимальная скорость: \(maxSpeed)\nТекущая скорость: \(speed)\n"
    }
}

extension TunkCar: CustomStringConvertible{
    var description: String {
        return "Марка машины: \(mark)\nГод выпуска: \(year)\nСостояние мотора: \(motor)\nСостояние Дверей: \(door)\nРазмер багажника: \(maxBagVolume)\nКол-во вещей в багажнике: \(bagVolume)\n"
    }
}

/*
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
*/
var tesla = TunkCar(mark: "Tesla", year: 2019, maxBagVolume: 10, bagVolume: 0)
tesla.changeDoorState(.open)

var laborghini = SportCar(mark: "laborghini", year: 2008, maxSpeed: 200, speed: 0)
laborghini.changeMotorState(.run)

/*
 6. Вывести сами объекты в консоль.
 */
print(tesla)
print(laborghini)
