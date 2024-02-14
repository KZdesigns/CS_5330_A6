//
//  ViewController.swift
//  CS_5330_A6
//
//  Created by Kyle Zimmerman on 2/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var header: UILabel!
    
    @IBOutlet weak var EnterAmountLabel: UILabel!
    
    @IBOutlet weak var AmountTextField: UITextField!
    
    @IBOutlet weak var CurrencyOneLabel: UILabel!
    @IBOutlet weak var CurrencyOneSwitch: UISwitch!
    
    @IBOutlet weak var CurrencyTwoLabel: UILabel!
    @IBOutlet weak var CurrencyTwoSwitch: UISwitch!
    
    @IBOutlet weak var CurrencyThreeLabel: UILabel!
    @IBOutlet weak var CurrencyThreeSwitch: UISwitch!
    
    @IBOutlet weak var CurrencyFourLabel: UILabel!
    @IBOutlet weak var CurrencyFourSwitch: UISwitch!
    
    @IBOutlet weak var ConvertButton: UIButton!
    
    var enteredAmount: Float  = 0.00
    var currencyOneSelect: Bool = false
    var currencyTwoSelect: Bool = false
    var currencyThreeSelect: Bool = false
    var currencyFourSelect: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    // sets up the view controller scene
    func setupUI() {
        setHeader()
        setAmountInput()
        setCurrencyOne()
        setCurrencyTwo()
        setCurrencyThree()
        setCurrencyFour()
        setButtonText()
    }
    
    func setHeader() {
        header.text = "Currency Converter"
    }
    
    func setAmountInput() {
        EnterAmountLabel.text = "Enter USD:"
        AmountTextField.text = "Amount"
    }
    
    func setCurrencyOne() {
        CurrencyOneLabel.text = "POUND"
        CurrencyOneSwitch.isOn = false
    }
    
    func setCurrencyTwo() {
        CurrencyTwoLabel.text = "EURO"
        CurrencyTwoSwitch.isOn = false
    }
    
    func setCurrencyThree() {
        CurrencyThreeLabel.text = "YEN"
        CurrencyThreeSwitch.isOn = false
    }
    
    func setCurrencyFour() {
        CurrencyFourLabel.text = "PESO"
        CurrencyFourSwitch.isOn = false
    }
    
    func setButtonText() {
        ConvertButton.setTitle("Convert", for: .normal)
    }
    
    
    // trigger conversion functions and segue
    @IBAction func onCalculateButtonPress(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toSummaryView", sender: self)
    }
    
    
    
   
}

