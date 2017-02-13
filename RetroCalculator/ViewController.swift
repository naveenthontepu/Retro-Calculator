//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Mac on 2/10/17.
//  Copyright © 2017 naveen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    var runningNumber:String = ""
    var leftValueNumber = "0"
    var rightValueNumber = "0"
    var result = "0"
    
    
    enum Operators: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Equal = "="
        case Empty = ""
    }
    
    var currentOperation = Operators.Empty
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func numberSelected(_ sender:UIButton){
        runningNumber+="\(sender.tag)"
        outputLabel.text = runningNumber
    }
    
    @IBAction func processDivide(_ sender: Any) {
        processOperation(operation: .Divide)
        
    }
    @IBAction func processMultiply(_ sender: Any) {
        processOperation(operation: .Multiply)
    }
    @IBAction func processSubtract(_ sender: Any) {
        processOperation(operation: .Subtract)
    }
    @IBAction func processAdd(_ sender: Any) {
        processOperation(operation: .Add)
    }
    @IBAction func proEqual(_ sender: Any) {
        print("equal clicked")
        processOperation(operation: currentOperation)
    }
    func processOperation(operation: Operators) {
        if currentOperation != Operators.Empty{
            if runningNumber != ""{
                rightValueNumber = runningNumber
                if currentOperation == Operators.Add{
                    result = "\(Double(rightValueNumber)! + Double(leftValueNumber)!)"
                }else if currentOperation == Operators.Subtract{
                    result = "\(Double(leftValueNumber)! - Double(rightValueNumber)!)"
                }else if currentOperation == Operators.Divide{
                    result = "\(Double(leftValueNumber)! / Double(rightValueNumber)!)"
                }else if currentOperation == Operators.Multiply{
                    result = "\(Double(rightValueNumber)! * Double(leftValueNumber)!)"
                }
                leftValueNumber = result
                outputLabel.text = result
            }
        }else{
            if runningNumber != ""{
                leftValueNumber = runningNumber
            }else {
                leftValueNumber = "0"
            }
        }
        runningNumber = ""
        currentOperation = operation
    }
}

