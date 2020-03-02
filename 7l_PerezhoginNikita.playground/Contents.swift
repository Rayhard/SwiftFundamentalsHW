import UIKit

enum CarError: Error{
    case motorNotFound, veryMoreSpeed
}

/*
 1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
 2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.
 */
class CarClass{

    let maxSpeed: Int
    var speed: Int
    var motor: Bool?
    
    init(maxSpeed: Int, speed: Int, motor: Bool?) {
        self.maxSpeed = maxSpeed
        self.speed = speed
        self.motor = motor
    }
    
    func addSpeed(_ newSpeed: Int) throws {
        guard motor == true else {
            throw CarError.motorNotFound
        }
        guard (speed + newSpeed) < maxSpeed else {
            throw CarError.veryMoreSpeed
        }
        speed += newSpeed
    }
}
var car1 = CarClass(maxSpeed: 10, speed: 0, motor: nil)
do{
    try car1.addSpeed(15)
}catch CarError.motorNotFound{
    print("В машине нет мотора или он выключен")
}catch CarError.veryMoreSpeed{
    print("Скорость превышает максимально возможную")
}catch let error{
    print(error.localizedDescription)
}

