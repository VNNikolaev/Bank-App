//
//  ViewController.swift
//  Bank App
//
//  Created by Nikolaev Vasiliy on 09.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountLabel: UILabel!
    
    var amount: Double = 10000 {
        didSet {
            updateAmountLabel()
        }
    }
    
    func updateAmountLabel() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "₽"
        
        amountLabel.text = formatter.string(from: NSNumber(value: amount))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateAmountLabel()
        
    }


}

