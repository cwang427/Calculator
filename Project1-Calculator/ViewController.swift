//
//  ViewController.swift
//  Project1-Calculator
//
//  Created by Cassidy Wang on 7/9/15.
//  Copyright (c) 2015 Cassidy Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsTyping = false
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        if userIsTyping {
            display.text = display.text! + sender.currentTitle!
        } else {
            display.text = sender.currentTitle!
            userIsTyping = true
        }
        
    }
    
    @IBAction func delete() {
        if (display.text!).characters.count > 1 {
            display.text!.removeAtIndex(display.text!.endIndex.predecessor())
        } else {
            display.text = "0"
            userIsTyping = false
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        if userIsTyping {
            evaluate()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }
    
    @IBAction func evaluate() {
        userIsTyping = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsTyping = false
        }
        
    }

}