//
//  SummaryViewController.swift
//  CS_5330_A6
//
//  Created by Kyle Zimmerman on 2/12/24.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var BackToMainButton: UIButton!
    
    @IBOutlet weak var AmountLabel: UILabel!
    
    @IBOutlet weak var CurrencyOneLabel: UILabel!
    @IBOutlet weak var CurrencyOneAmount: UILabel!
    
    @IBOutlet weak var CurrencyTwoLabel: UILabel!
    @IBOutlet weak var CurrencyTwoAmount: UILabel!
    
    @IBOutlet weak var CurrencyThreeLabel: UILabel!
    @IBOutlet weak var CurrencyThreeAmount: UILabel!
    
    @IBOutlet weak var CurrencyFourLabel: UILabel!
    @IBOutlet weak var CurrencyFourAmount: UILabel!
    
    var enteredAmount : String = ""
    var convertedCurrenciesLabels: [String] = []
    var convertedCurrenciesAmounts: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BackToMainButton.setTitle("Back To Main", for: .normal)
        AmountLabel.text = "Amount in USD: \(enteredAmount)"
        setLabels()
    }
    
    func setLabels() {
        // Clear all labels first to handle fewer than four currencies
        let currencyLabels = [CurrencyOneLabel, CurrencyTwoLabel, CurrencyThreeLabel, CurrencyFourLabel]
        let currencyAmountLabels = [CurrencyOneAmount, CurrencyTwoAmount, CurrencyThreeAmount, CurrencyFourAmount]

        for label in currencyLabels {
            label?.text = "" // Clear the currency name label
        }

        for amountLabel in currencyAmountLabels {
            amountLabel?.text = "" // Clear the currency amount label
        }

        // Now set the labels based on the converted currencies
        for (index, currencyLabel) in convertedCurrenciesLabels.enumerated() {
            if index < currencyLabels.count {
                currencyLabels[index]?.text = currencyLabel
                if index < convertedCurrenciesAmounts.count {
                    currencyAmountLabels[index]?.text = String(format: "%.2f", convertedCurrenciesAmounts[index])
                }
            }
        }
    }
    
    @IBAction func onPressBackToMainButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
