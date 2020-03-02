import UIKit

/*
 1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
*/
struct Car{
    let mark: String
    let year: Int
    let maxBagVolume: Int    // Максимальная вместительность
    var motor: Motor
    var window: Window
    var bagVolume: Int  // Кол-во вещей в данный момент
    
    /*
     4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    */
    mutating func windowStatus(_ status: Window){
        window = status
    }
    mutating func motorStatus(_ status: Motor){
        motor = status
    }
    // Загрузить\выгрузить сколько-то вещей
    mutating func changeBag(mode: Cargo, _ value: Int){
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
    
    // Вывод параметров на консоль
    func printParam() {
        print("Марка машины: \(mark)\nГод выпуска: \(year)\nРазмер багажника: \(maxBagVolume)\nКол-во вещей в багажнике: \(bagVolume)\nСостояние мотора: \(motor)\nСостояние окон: \(window)")
    }
}

struct Truck{
    let mark: String
    let year: Int
    let maxBagVolume: Int    // Максимальная вместительность
    var motor: Motor
    var window: Window
    var bagVolume: Int  // Кол-во вещей в данный момент
    
    init(mark: String, year: Int) {
        self.mark = mark
        self.year = year
        
        self.maxBagVolume = 25
        self.motor = .stop
        self.window = .close
        self.bagVolume = 0
    }
    
    /*
     4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    */
    mutating func windowStatus(_ status: Window){
        window = status
    }
    mutating func motorStatus(_ status: Motor){
        motor = status
    }
}

/*
 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
*/
enum Motor{
    case run, stop
}
enum Window{
    case open, close
}
enum Cargo{
    case add, remove
}

/*
 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
*/
var car1: Car = Car(mark: "Honda", year: 2000, maxBagVolume: 10, motor: .run, window: .open, bagVolume: 0)
car1.windowStatus(.close)
car1.motorStatus(.stop)
car1.changeBag(mode: .add, 5)
car1.changeBag(mode: .remove, 15) // Сработает guard

var truck1: Truck = Truck(mark: "Tesla", year: 2019)
truck1.windowStatus(.close)
truck1.motorStatus(.stop)

/*
 6. Вывести значения свойств экземпляров в консоль.
*/
car1.printParam()
print(truck1)
