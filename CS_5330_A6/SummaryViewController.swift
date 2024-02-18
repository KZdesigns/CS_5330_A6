//
//  SummaryViewController.swift
//  CS_5330_A6
//
//  Created by Kyle Zimmerman on 2/12/24.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var BackToMainButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BackToMainButton.setTitle("Back To Main", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPressBackToMainButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    //TODO: Get the results from the conversions array from the CurrencyConverter, one issue I see right now is we dont currently have the name of the currencies, we call the resetCurrencyToConvert() when the calculate button is clicked, but maybe we need to reset after this view is set up?

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
