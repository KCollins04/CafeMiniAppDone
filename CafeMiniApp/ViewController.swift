//
//  ViewController.swift
//  CafeMiniApp
//
//  Created by KELSEY COLLINS on 9/12/22.
//

import UIKit
class ViewController: UIViewController {
    
    
    @IBOutlet weak var outletCartText: UITextView!
    @IBOutlet weak var outletTotal: UITextField!
    @IBOutlet weak var outletAdd: UITextField!
    @IBOutlet weak var outletRemove: UITextField!
    @IBOutlet weak var outletMenu: UITextView!
    @IBOutlet weak var outletAddMenu: UITextField!
    
    @IBOutlet weak var outletAddPrice: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var t :Double = 0.0
    var a :Double = 0.0
    var cart = [String]()
    struct Menu {
        let name: String
        let price: Double
    }
    
    var menu = [
        "Apple": 0.99,
        "Bread": 1.00,
        "Pizza": 3.99,
        "Candy": 0.50,
        
        
    ]
    
    
    
    
    @IBAction func actionButtonAdd(_ sender: Any) {
        
        
        if outletAdd.text == "Apple"{
            cart.append("Apple")
            t = 0.99
        }
        if outletAdd.text == "Bread"{
            cart.append("Bread")
            t = 1.09
        }
        
        if outletAdd.text == "Pizza"{
            cart.append("Pizza")
            t = 3.99
           
        }
        if outletAdd.text == "Candy"{
            cart.append("Candy")
            t = 0.50
           
        }

           a += t
      
        outletTotal.text! = "\(a)"
        outletCartText.text = "\(cart) "
        
       
     
        
    }
    
    @IBAction func actionButtonRemove(_ sender: Any) {
        
        menu.removeValue(forKey: outletRemove.text!)
        
        var s = ""
           let sortedKeys = Array(menu.keys).sorted(by: <)
           for val in sortedKeys{
               s.append(" \(val): $\(String(describing: menu[val]!))")
           }
           outletMenu.text = "\(s)"

        
        
     //cart.removeAll{ $0 == outletRemove.text!}
        //outletCartText.text = "\(cart) "
        
       // outletMenu.removeAll{ $0 == outletRemove.text!}
       //    outletCartText.text = "\(cart) "
    
    }
    
    
    @IBAction func actionSorteName(_ sender: Any) {
     var s = ""
        let sortedKeys = Array(menu.keys).sorted(by:<)
        for val in sortedKeys{
            s.append(" \(val): $\(String(describing: menu[val]!))")
        }
        outletMenu.text = "\(s)"
    }
    
    
    @IBAction func actionAddMenu(_ sender: Any) {
        menu[outletAddMenu.text!] = Double(outletAddPrice.text!)
        var s = ""
           let sortedKeys = Array(menu.keys).sorted(by: <)
           for val in sortedKeys{
               s.append(" \(val): $\(String(describing: menu[val]!))")
           }
           outletMenu.text = "\(s)"
    }
    
    
    
    @IBAction func actionSortePrice(_ sender: Any) {
        var s = ""
        let sortedByValue = menu.sorted(by: {$0.value < $1.value})
        
        for val in sortedByValue{
            s.append(" \(val.key): $\(String(describing: menu[val.key]!))")
           }
           outletMenu.text = "\(s)"
    }
    
    
    
   

}

