//
//  TipCalc.swift
//  TipCalc
//
//  Created by Aleksandr Pronin on 12/19/15.
//  Copyright © 2015 RIT. All rights reserved.
//

import Foundation

class TipCalc {
    var amountBeforeTax: Float = 0
    var tipPercentage: Float = 0
    var taxPercentage: Float = 0
    var personCount: Int = 1
    
    var tipAmount: Float {
        get {
            return amountBeforeTax * tipPercentage
        }
    }
    
    var tipAmountString: String {
        get {
            return String(format: "Tip amount: %0.2f", arguments: [tipAmount])
        }
    }
    
    var amountBeforeTaxString: String {
        get {
            return String(format: "%0.2f", arguments: [amountBeforeTax])
        }
    }
    
    var tipPercentageString: String {
        get {
            return String(format: "%0.2f", arguments: [tipPercentage])
        }
    }
    
    var taxPercentageString: String {
        get {
            return String(format: "%0.2f", arguments: [taxPercentage])
        }
    }
    
    var totalBill: Float {
        get {
            let currentTotalBill = amountBeforeTax * (1 + taxPercentage + tipPercentage)
            return currentTotalBill
        }
    }
    
    var amountAfterTax: Float {
        get {
            return amountBeforeTax * (1 + taxPercentage)
        }
    }
    
    var totalBillString: String {
        get {
            return String(format: "Amount after tax: %0.2f Your tip: %0.2f Your total bill: %0.2f", arguments: [amountAfterTax, tipAmount, totalBill])
        }
    }
    
    var perPersonTotal: Float {
        get {
            return totalBill / Float(personCount)
        }
    }
    
    var perPersonTotalString: String {
        get {
            return String(format: "Per-person total: %0.2f", arguments: [perPersonTotal])
        }
    }
    
    init(amountBeforeTax:Float = 100, tipPercentage:Float = 0.2, taxPercentage:Float = 0, personCount:Int = 1) {
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
        self.taxPercentage = taxPercentage
    }
}