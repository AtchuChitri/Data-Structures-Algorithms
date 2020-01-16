import UIKit

var str = "Hello, playground"

//struct Stack{
//
//    //var stackArry = [String](repeating: nil, count: 10)
//
//    var stackArry = [String]()
//
//  public  mutating func push(element:String){
//
//        if(isStackFull()){
//            return
//        }
//        stackArry.insert(element, at: 0)
//    }
//
//   private func isStackFull()->Bool{
//
//        if(stackArry.capacity == 10  && stackArry.count == 10){
//            return true
//        }
//        return false
//    }
//   private func isEmpty()->Bool{
//
//        if(stackArry.count == 0){
//            return true
//        }
//        return false
//
//    }
//  public  mutating func pop()->String{
//
//        if(isEmpty()){
//            return "empty"
//        }
//    return  stackArry.popLast() as? String ?? ""
//    }
//    public func peek()->String{
//
//        guard let topElement = stackArry.last else { return "stack empty"}
//
//        return topElement ?? ""
//
//    }
//
//
//
//}

//var stack = Stack()
//
//stack.push(element: "Vidhvaan")
//stack.push(element: "Clarion")
//stack.push(element: "ItWorkX")
////stack.pop()
////stack.peek()
//print(stack)


struct StackGenerics<T> {
    
    var stackArry = [T]()

    public  mutating func push(element:T){
        
        if(isStackFull()){
            return
        }
        stackArry.insert(element, at: 0)
    }
    public  mutating func pop()->T{
        
        if(isEmpty()){
            return "empty"
        }
    return  stackArry.popLast()!
    }
    public func peek()->T{
        
        guard let topElement = stackArry.last else { return "stack empty"}
        
        return topElement!
        
    }
    private func isEmpty()->Bool{
        
        if(stackArry.count == 0){
            return true
        }
        return false
        
    }
    private func isStackFull()->Bool{
           
           if(stackArry.capacity == 10  && stackArry.count == 10){
               return true
           }
           return false
       }
    
}
var stack = StackGenerics<String>()

stack.push(element: "Vidhvaan")
stack.push(element: "Vidhvaan1")

print(stack)
