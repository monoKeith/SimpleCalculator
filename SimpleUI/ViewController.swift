//
//  ViewController.swift
//  SimpleUI
//
//  Created by Keith H on 2018-07-08.
//  Copyright © 2018 Keith H. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    //Vars
    var displaying = 0.0
    var previous = 0.0
    var floatstate = false
    var inputtmp: String = "0"
    var currentOperation = "Equal"
    
    //Display
    
    @IBOutlet weak var Monitor: NSTextField!
    
    //Button Controllers
    
    @IBAction func Press_Dot(_ sender: Any) {
        //If the number is already in float state, do nothing
        if !floatstate {
            floatstate = true
            inputtmp += "."
            UpdateDisplay()
        }
    }
    
    @IBAction func Press_Clear(_ sender: Any) {
        clear()
    }
    
    @IBAction func Press_Calc(_ sender: Any) {
        Calculate()
    }
    
    @IBAction func Press_Div(_ sender: Any) {
        Operation(operate: "Div")
    }
    
    @IBAction func Press_Mul(_ sender: Any) {
        Operation(operate: "Mul")
    }
    
    @IBAction func Press_Sub(_ sender: Any) {
        Operation(operate: "Sub")
    }
    
    @IBAction func Press_Add(_ sender: Any) {
        Operation(operate: "Add")
    }
    
    @IBAction func Press_0(_ sender: Any) {
        PressDigit(value: 0)
    }
    
    @IBAction func Press_1(_ sender: Any) {
        PressDigit(value: 1)
    }
    
    @IBAction func Press_2(_ sender: Any) {
        PressDigit(value: 2)
    }
    
    @IBAction func Press_3(_ sender: Any) {
        PressDigit(value: 3)
    }
    
    @IBAction func Press_4(_ sender: Any) {
        PressDigit(value: 4)
    }
    
    @IBAction func Press_5(_ sender: Any) {
        PressDigit(value: 5)
    }
    
    @IBAction func Press_6(_ sender: Any) {
        PressDigit(value: 6)
    }
    
    @IBAction func Press_7(_ sender: Any) {
        PressDigit(value: 7)
    }
    
    @IBAction func Press_8(_ sender: Any) {
        PressDigit(value: 8)
    }
    
    @IBAction func Press_9(_ sender: Any) {
        PressDigit(value: 9)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Show welcome text
        Monitor.stringValue = "Hi Keith!"
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func clear(){
        displaying = 0
        previous = 0
        inputtmp = "0"
        floatstate = false
        currentOperation = "Equal"
        Monitor.stringValue = "0"
    }
    
    func PressDigit(value: Double){
        if floatstate{
            inputtmp += String(Int(value))
            displaying = Double(inputtmp)!
        }else{
            displaying = displaying*10 + value
            inputtmp = String(Int(displaying))
        }
        UpdateDisplay()
    }
    
    func UpdateDisplay(){
        //Detect if the content is float and adjust display style
        if Double(inputtmp) != displaying{
            if floatstate{
                Monitor.stringValue = String(displaying)
            }else{
                Monitor.stringValue = String(Int(displaying))
            }
        }else{
            Monitor.stringValue = inputtmp
        }
    }
    
    func Operation(operate: String){
        if currentOperation != "Equal"{
            switch currentOperation {
                case "Add":
                    displaying = previous + displaying
                
                case "Sub":
                    displaying = previous - displaying
                
                case "Mul":
                    displaying = previous * displaying
                
                case "Div":
                    displaying = previous / displaying
                
                default:
                    break
            }
        }
        
        //Refresh Monitor
        UpdateDisplay()
        previous = displaying
        displaying = 0.0
        inputtmp = "0"
        floatstate = false
        
        //Set the operation type
        currentOperation = operate
    }
    
    func Calculate(){
        switch currentOperation {
        case "Equal":
            break
            
        case "Add":
            displaying = previous + displaying
            
        case "Sub":
            displaying = previous - displaying
            
        case "Mul":
            displaying = previous * displaying
            
        case "Div":
            displaying = previous / displaying
            
        default:
            break
        }
        UpdateDisplay()
        previous = displaying
        
        //Set operation type
        currentOperation = "Equal"
    }

}

