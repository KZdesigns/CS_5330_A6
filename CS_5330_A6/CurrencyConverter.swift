//
//  CurrencyConverter.swift
//  CS_5330_A6
//
//  Created by Kyle Zimmerman on 2/13/24.
//

import Foundation


struct CurrencyConverter {
    
    // rates for calculating US to Currency
    let poundRate: Float = 1.0
    let euroRate: Float = 2.0
    let yenRate: Float = 3.0
    let pesoRate: Float = 4.0
    

    // holds a list of currencies to convert
    var CurrencyToConvert: [String] = []
    
    // holds a list of converted numbers
    var conversions: [Float] = []
    
    // Adds currency selected in controller to list of currencies to convert
    mutating func setCurrencyToConvert(currency: String) {
        CurrencyToConvert.append(currency)
    }
    
    // Adds the converted amounts to a list to be used and displayed
    mutating func setConversions(amount: Int) {
        for currency in CurrencyToConvert {
            var convertedAmount = convert(currency: currency,amount: amount)
            conversions.append(convertedAmount)
        }
    }
    
    // Logic for computing the amount
    func convert(currency:String, amount:Int) -> Float {
        return 1.0
    }
}
