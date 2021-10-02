/*
Autor: Carlos Cifuentes.
StudentID: 301140805
Date: 09/26/2021
Version: 1
Description: Project to create a calculator, this initial milestone includes the definition of the UI, creation of elements and application of constraints.
 */

import UIKit

class ViewController: UIViewController {
    // declaration of Variables
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var result: Double = 0
    var resultInt: Int = 0
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
        // Backspace button removing last character until there is only one left.
        if sender.tag == 1 && activeNumber.count > 1 // back
        {
            activeNumber.removeLast()
        }
        // Backspace button when there is only one character, make it cero instead of removing it.
        else if sender.tag == 1 && activeNumber.count == 1
        {
            activeNumber = "0"
        }
        // Plus/minus button actions, validates whether it is negative already and different from cero to add the minus.
        if sender.tag == 2 && !activeNumber.contains("-") && activeNumber != "0"
        {
            activeNumber.insert("-", at: activeNumber.startIndex)
        }
        // if it's negative, removes the minus.
        else if sender.tag == 2 && activeNumber != "0"
        {
            activeNumber.remove(at: activeNumber.startIndex)
        }
        // clear all button, makes active number cero.
        if sender.tag == 3
        {
            activeNumber = "0"
            resultLabel.text = activeNumber
            //operationLable.text = ""
        }
        if sender.tag == 4
        {
            firstNumber = Double(activeNumber)!
            firstNumber = firstNumber / 100
            activeNumber = "\(firstNumber)"
            
        }
        //assigns the final active number to the operator label.
        operationLable.text = activeNumber
    }
    
    @IBAction func OnNumberButton_Pressed(_ sender: UIButton)
    {
        // captures string input from buttons.
        let button_text = sender.titleLabel?.text
        
        switch button_text
        {
            //validates it only adds one, and that there are at least 2 character remaining so that the dot is not the last character.
        case ".":
            if !activeNumber.contains(".") && activeNumber.count < 9
            {
                activeNumber.append(button_text!)
                operationLable.text?.append(button_text!)
                
            }
        case "0":
            if activeNumber != "0" && activeNumber.count < 10
            {
                activeNumber.append(button_text!)
                operationLable.text?.append(button_text!)
            }
            
        default:
            if activeNumber.count < 10
            {
                if activeNumber == "0"
                {
                    activeNumber = button_text!
                    //operationLable.text = button_text!
                } else
                    {
                        activeNumber.append(button_text!)
                        //operationLable.text?.append(button_text!)
                        
                    }
            }; if operationLable.text == "0"
                {
                    operationLable.text = button_text
                }
                else
                {
                    operationLable.text?.append(button_text!)
                }
        }
        //resultLabel.text = activeNumber
        
        
    }
    
    @IBAction func OnOperationButton_Pressed(_ sender: UIButton)
    {
        firstNumber = Double(activeNumber)!
        activeNumber = "0"
        
        if sender.tag == 5{
            operationSelected = 1
            operationLable.text?.append(" + ")
        }
        if sender.tag == 7{
            operationSelected = 2
            operationLable.text?.append(" - ")
        }
        if sender.tag == 8{
            operationSelected = 3
            operationLable.text?.append(" * ")
        }
        if sender.tag == 9{
            operationSelected = 4
            operationLable.text?.append(" / ")
        }
        
 
    }
    
    @IBAction func OnResultButton_Pressed(_ sender: UIButton) {
        
        secondNumber = Double(activeNumber)!
        
        if operationSelected == 1{
            result = firstNumber + secondNumber
        }
        else if operationSelected == 2
        {
            result = firstNumber - secondNumber
        }
        else if operationSelected == 3
        {
            result = firstNumber * secondNumber
        }
        else if operationSelected == 4
        {
            result = firstNumber / secondNumber
        }
        // validating if contains decimals to remove the cero when is not necessary.
        
        if (result.truncatingRemainder(dividingBy: 1) == 0)
        {
            resultInt = Int(result)
            resultLabel.text = "\(resultInt)"
            firstNumber = Double(resultInt)
            
        }
        else
        {
            resultLabel.text = "\(result)"
            firstNumber = result
        }
        
        secondNumber = 0
        activeNumber = "\(result)"
        
    }
}

