//
//  ViewController.swift
//  TipCalc
//
//  Created by Aleksandr Pronin on 12/19/15.
//  Copyright © 2015 RIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var taxPercentageLabel: UILabel!
    @IBOutlet weak var peopleCountLabel: UILabel!
    @IBOutlet weak var perPersonTotalLabel: UILabel!
    
    //MARK: Properties
    let tipCalc = TipCalc()
    
    //MARK: ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountBeforeTaxTextField.text = tipCalc.amountBeforeTaxString
        tipPercentageLabel.text = tipCalc.tipPercentageString
        taxPercentageLabel.text = tipCalc.taxPercentageString
        peopleCountLabel.text = String(tipCalc.personCount)
        calcTip()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    @IBAction func tipPercentageSlider(sender: UISlider) {
        let newPercentage = sender.value / 100
        tipCalc.tipPercentage = newPercentage
        tipPercentageLabel.text = tipCalc.tipPercentageString
        calcTip()
    }
    
    @IBAction func taxPercentageSlider(sender: UISlider) {
        let newPercentage = sender.value / 100
        tipCalc.taxPercentage = newPercentage
        taxPercentageLabel.text = tipCalc.taxPercentageString
        calcTip()
    }
    
    @IBAction func amountBeforeTaxEditingChangedAction(sender: UITextField) {
        calcTip()
    }
    
    @IBAction func peopleCountSliderAction(sender: UISlider) {
        tipCalc.personCount = Int(sender.value)
        peopleCountLabel.text = String(tipCalc.personCount)
        calcTip()
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: Helper methods
    
    func calcTip() {
        tipCalc.amountBeforeTax = (amountBeforeTaxTextField.text! as NSString).floatValue
        resultLabel.text = tipCalc.totalBillString
        perPersonTotalLabel.text = tipCalc.perPersonTotalString
    }
    
}

