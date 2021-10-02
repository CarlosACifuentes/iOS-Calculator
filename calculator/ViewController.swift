/*
Autor: Carlos Cifuentes.
StudentID: 301140805
Date: 09/26/2021
Version: 1
Description: Project to create a calculator, this initial milestone includes the definition of the UI, creation of elements and application of constraints.
 */

import UIKit

class ViewController: UIViewController {
    // Variables
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var result: Double = 0
    var activeNumber:String = ""
    var operationSelected: Int = 0
   
    
    // Outlets
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var operationLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Actions
    
    @IBAction func OnSpecialButton_Pressed(_ sender: UIButton)
    {
        if sender.tag == 1 && activeNumber.count > 1 // back
        {
            activeNumber.removeLast()
        } else if sender.tag == 1 && activeNumber.count == 1 {
            
            activeNumber = "0"
        }
        
        if sender.tag == 2 && !activeNumber.contains("-") && activeNumber != "0" {
            activeNumber.insert("-", at: activeNumber.startIndex)
        } else if sender.tag == 2 && activeNumber != "0" {
            activeNumber.remove(at: activeNumber.startIndex)
        }
        
        if sender.tag == 3{
            activeNumber = "0"
        }
        
        resultLabel.text = activeNumber
        
    }
    
    @IBAction func OnNumberButton_Pressed(_ sender: UIButton)
    {
        let button_text = sender.titleLabel?.text
        
        switch button_text
        {
        case ".":
            if !activeNumber.contains(".") && activeNumber.count < 9
            {
                activeNumber.append(button_text!)
                
            }
        case "0":
            if activeNumber != "0" && activeNumber.count < 10
            {
                activeNumber.append(button_text!)
                
            }
            
            
        default:
            if activeNumber.count < 10
            {
                if activeNumber == "0"
                {
                    activeNumber = button_text!
                } else
                    {
                        activeNumber.append(button_text!)
                    }
            }
            
            
        }
        resultLabel.text = activeNumber
    }
    
    @IBAction func OnOperationButton_Pressed(_ sender: UIButton)
    {
       
        
        if sender.tag == 5{ // suma
            
            firstNumber = Double(activeNumber)!
            activeNumber = "0"
            operationSelected = 1
        }
        if sender.tag == 7{
            firstNumber = Double(activeNumber)!
            activeNumber = "0"
            operationSelected = 2
        }
        if sender.tag == 8{
            firstNumber = Double(activeNumber)!
            activeNumber = "0"
            operationSelected = 3
        }
        if sender.tag == 9{
            firstNumber = Double(activeNumber)!
            activeNumber = "0"
           // resultLabel.text = ""
            operationSelected = 4
        }
        
        
        if sender.tag == 6 && operationSelected == 1{
            secondNumber = Double(activeNumber)!
            result = firstNumber + secondNumber
            resultLabel.text = "\(result)"
            //firstNumber = result
        }else if sender.tag == 6 && operationSelected == 2{
            secondNumber = Double(activeNumber)!
            result = firstNumber - secondNumber
            resultLabel.text = "\(result)"
        }else if sender.tag == 6 && operationSelected == 3{
            secondNumber = Double(activeNumber)!
            result = firstNumber * secondNumber
            resultLabel.text = "\(result)"
        }else if sender.tag == 6 && operationSelected == 4{
            secondNumber = Double(activeNumber)!
            result = firstNumber / secondNumber
            resultLabel.text = "\(result)"
        }
        
    }
    
}

