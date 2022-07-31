import Foundation

class Node<Element> {
    var value:Element
    var leftChild:Node?
    var rightChild: Node?
    
    init(value: Element,
         leftChild: Node? = nil,
         rightChild: Node? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        return "value: \(value), left = [" + (leftChild?.description ?? "")  + "], right = [" + (rightChild?.description ?? "") + "]"
    }
}

class BinarySearchTree<Element: Comparable & CustomStringConvertible> {
   private var node: Node<Element>? = nil
    
    func insert(element: Element) {
        let nodeT = Node(value: element)
        if let rootNode = self.node {
            self.insert(rootNode, nodeT)
        } else {
            self.node = nodeT
        }
    }
    
    private func insert(_ rootNode: Node<Element>, _ node: Node<Element>) {
        if rootNode.value > node.value {
            if let leftNode = rootNode.leftChild {
                self.insert(leftNode, node)
            } else {
                rootNode.leftChild = node
            }
        } else if rootNode.value < node.value {
            if let rightNode = rootNode.rightChild {
                self.insert(rightNode, node)
            } else {
                rootNode.rightChild = node
            }
        }
    }
}

extension BinarySearchTree {
    
    func traverse() {
        print("\nPRE-ORDER TRAVERSE")
        self.preorder(self.node)
        print("\n\nIN-ORDER TRAVERSE")
        self.inorder(self.node)
        print("\n\nPOST-ORDER TRAVERSE")
        self.postorder(self.node)
        print("\n")
        print("\n\n Binary Tree")
        print(node)
    }
    
    // LEFT NODE RIGHT
        private func inorder(_ node: Node<Element>?) {
            guard let _ = node else { return }
            self.inorder(node?.leftChild)
            print("\(node!.value)", terminator: " ")
            self.inorder(node?.rightChild)
        }
        
        // NODE LEFT RIGHT
        private func preorder(_ node: Node<Element>?) {
            guard let _ = node else { return }
            print("\(node!.value)", terminator: " ")
            self.preorder(node?.leftChild)
            self.preorder(node?.rightChild)
        }
        
        // LEFT RIGHT NODE
        private func postorder(_ node: Node<Element>?) {
            guard let _ = node else { return }
            self.postorder(node?.leftChild)
            self.postorder(node?.rightChild)
            print("\(node!.value)", terminator: " ")
        }
    
    func search(element: Element) {
        searchNode(self.node, element: element)
       
    }
   private func searchNode(_ node: Node<Element>? , element: Element) {
        guard let nodeT = node else { return}
        if nodeT.value < element {
            searchNode(nodeT.rightChild, element: element)
        } else if nodeT.value > element {
            searchNode(nodeT.leftChild, element: element)
        } else  {
            print("NODE FOUND : \(nodeT.value)")
        }

    }
}

let tree = BinarySearchTree<Int>()

tree.insert(element: 6)
tree.insert(element: 2)
tree.insert(element: 4)
tree.insert(element: 8)
tree.insert(element: 9)
tree.insert(element: 10)
tree.insert(element: 11)
tree.insert(element: 12)
tree.insert(element: 15)
tree.insert(element: 3)
tree.insert(element: 6)
tree.insert(element: 7)
tree.search(element: 10)
 tree.traverse()
