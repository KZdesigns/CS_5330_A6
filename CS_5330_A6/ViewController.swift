//
//  ViewController.swift
//  CS_5330_A6
//
//  Created by Kyle Zimmerman on 2/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onCalculateButtonPress(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toSummaryView", sender: self)
        
    }
    
}

