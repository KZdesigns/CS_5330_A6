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
    
    var currencyConverter = CurrencyConverter()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        AmountTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        // Call your validation function here
        let isValid = isInputValid(input: textField.text ?? "")
        // Update your UI based on validation
    }
    
    func isInputValid(input: String) -> Bool {
        return true
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
        AmountTextField.text = ""
        AmountTextField.placeholder = "Enter Amount"
        AmountTextField.keyboardType = .numberPad
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // trigger conversion functions and segue
    @IBAction func onCalculateButtonPress(_ sender: UIButton) {
        if(CurrencyOneSwitch.isOn == true) {
            currencyConverter.setCurrencyToConvert(currency: CurrencyOneLabel.text!)
        }
        
        if(CurrencyTwoSwitch.isOn == true) {
            currencyConverter.setCurrencyToConvert(currency: CurrencyTwoLabel.text!)
        }
        
        if(CurrencyThreeSwitch.isOn == true) {
            currencyConverter.setCurrencyToConvert(currency: CurrencyThreeLabel.text!)
        }
        
        if(CurrencyFourSwitch.isOn == true) {
            currencyConverter.setCurrencyToConvert(currency: CurrencyFourLabel.text!)
        }
        // TODO: make the amount be a double and get the entered amount from the user
        currencyConverter.setConversions(amount: 10.0)
        
     
        currencyConverter.resetCurrencyToConvert()
        self.performSegue(withIdentifier: "toSummaryView", sender: self)
    }
    
    
    
   
}

