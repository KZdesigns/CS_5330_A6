//
//  ViewController.swift
//  CS_5330_A6
//
//  Created by Kyle Zimmerman on 2/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var ErrorMessageLabel: UILabel!
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
    
    var isValid: Bool = true
    
    var currencyConverter = CurrencyConverter()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        AmountTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged) 
        CurrencyOneSwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        CurrencyTwoSwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        CurrencyThreeSwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        CurrencyFourSwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        updateConvertButtonState()
        setErrorMessage()
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        updateConvertButtonState()
        setErrorMessage()
    }
    
    func setupUI() {
        setHeader()
        setAmountInput()
        setCurrencyOne()
        setCurrencyTwo()
        setCurrencyThree()
        setCurrencyFour()
        setButtonText()
        setErrorMessage()
    }
    
    func isInputValid(input: String) -> Bool {
        return Int(input) != nil
    }
    
    func setErrorMessage() {
        if !isValid {
            ErrorMessageLabel.text = "Error: Amount is not a valid integer"
            ErrorMessageLabel.isHidden = false
        } else {
            ErrorMessageLabel.isHidden = true
        }
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
        ConvertButton.isEnabled = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
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
        currencyConverter.setConversions(amount: Double(AmountTextField.text!)!)
        
        // perform segue
        self.performSegue(withIdentifier: "toSummaryView", sender: self)
        
        // clean up data
        currencyConverter.resetCurrencyToConvert()
        currencyConverter.resetConversions()
    }
    
    func updateConvertButtonState() {
        let inputIsValid = isInputValid(input: AmountTextField.text ?? "")
        let atLeastOneSwitchIsOn = CurrencyOneSwitch.isOn || CurrencyTwoSwitch.isOn || CurrencyThreeSwitch.isOn || CurrencyFourSwitch.isOn
        isValid = inputIsValid
        setErrorMessage()
        ConvertButton.isEnabled = inputIsValid && atLeastOneSwitchIsOn
    }
    
    // pass data to SummaryViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSummaryView" {
            let converterNavigation = segue.destination as! SummaryViewController
            converterNavigation.enteredAmount = AmountTextField.text!
            converterNavigation.convertedCurrenciesLabels = currencyConverter.CurrencyToConvert
            converterNavigation.convertedCurrenciesAmounts  = currencyConverter.conversions
        }
    }
}

