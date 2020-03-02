import UIKit

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 */
struct Queue<T>{
    private var arrayElements: [T] = []
    
    mutating func push(_ element: T) {
        arrayElements.append(element)
    }
    mutating func pop() -> T? {
        guard arrayElements.isEmpty == false else {
            return nil
        }
        return arrayElements.removeFirst()
    }

    /*
    2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
    */
    func isContainsSpace(contSpace: (T) -> Bool) -> [T]{
        var tmpArray: [T] = []
        for elements in arrayElements{
            if contSpace(elements) == false{
                tmpArray.append(elements)
            }
        }
        return tmpArray
    }
    
    /*
    3. *Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
    */
    subscript(elements: Int) -> T?{
        guard arrayElements.count >= elements else {
            return nil
        }
        
        return arrayElements[elements]
    }

}

let spaceInString = { (element: String) -> Bool in
    return element.contains(" ")
}

var stakString = Queue<String>()
stakString.push("qwerty")
stakString.push("qwe rty")
stakString.push(" ")
stakString.push("qwerty12345")
stakString.push("12345")

stakString.pop()

stakString[1]

stakString.isContainsSpace(contSpace: spaceInString)

