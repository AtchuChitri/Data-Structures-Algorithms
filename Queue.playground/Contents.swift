import UIKit

var str = "Hello, playground"

struct Queue{
    
    var myQueueArry = [String]()
    
  public  mutating func enQueue(element:String){
        
    myQueueArry.append(element)
        
    }
    
   private func isEmpty()->Bool{
        
    if(myQueueArry.count == 0){
        return true
    }
    return false
    }
    
    public mutating func deQueue()->String{
        
        if(isEmpty()){
            return "queue empty"
        }
        
        myQueueArry.remove(at: 0)
        
        return myQueueArry.first ?? ""
        
    }
    
    
}


var queue = Queue()
queue.enQueue(element: "Vidhvaan")
queue.enQueue(element: "Vidhvaan1")
queue.enQueue(element: "Vidhvaan2")

print(queue)
queue.deQueue()
print(queue)

