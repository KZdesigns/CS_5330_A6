//
//  CurrencyConverter.swift
//  CS_5330_A6
//
//  Created by Kyle Zimmerman on 2/13/24.
//

import Foundation


struct CurrencyConverter {
    
    // rates for calculating US to Currency
    let poundRate: Float = 0.81
    let euroRate: Float = 0.93
    let yenRate: Float = 134.45
    let pesoRate: Float = 18.76
    
    // holds a list of currencies to convert
    var CurrencyToConvert: [String] = []
    
    // holds a list of converted numbers
    var conversions: [Double] = []
    
    
    mutating func resetCurrencyToConvert() {
        CurrencyToConvert = []
    }
    
    mutating func resetConversions() {
        conversions = []
    }
    
  
    // Adds currency selected in controller to list of currencies to convert
    mutating func setCurrencyToConvert(currency: String) {
        CurrencyToConvert.append(currency)
    }
    
    // Adds the converted amounts to a list to be used and displayed
    mutating func setConversions(amount: Double) {
        for currency in CurrencyToConvert {
            let convertedAmount = convert(currency: currency,amount: amount)
            conversions.append(convertedAmount)
        }
    }
    
    // Logic for computing the amount
    func convert(currency:String, amount:Double) -> Double {
        var convertedAmount = 0.00
        
        if(currency == "POUND") {
            convertedAmount = amount * Double(poundRate)
        }
        
        if(currency == "EURO") {
            convertedAmount = amount * Double(euroRate)
        }
        
        if(currency == "YEN") {
            convertedAmount = amount * Double(yenRate)
        }
        
        if(currency == "PESO") {
            convertedAmount = amount * Double(pesoRate)
        }

        return convertedAmount
    }
}
