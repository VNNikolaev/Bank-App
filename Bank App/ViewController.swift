//
//  ViewController.swift
//  Bank App
//
//  Created by Nikolaev Vasiliy on 09.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var amountLabel: UILabel?
    @IBOutlet weak var monthlyPaymentLabel: UILabel?
    @IBOutlet weak var nperTextField: UITextField?
    @IBOutlet weak var pvTextField: UITextField?
    @IBOutlet weak var rateTextField: UITextField?
    
    // MARK: - Properties
    var amount: Double = 10000 {
        didSet {
            updateAmountLabel()
            
        }
    }
    
    // MARK: - Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    func updateAmountLabel() {
    
        amountLabel?.text = amount.asCurrency()
    }
    
    func updateMonthlyAmountLabel() {
        
        monthlyPaymentLabel?.text = nil
        guard let nper = Double(nperTextField?.text ?? "") else { return }
        guard let pv = Double(pvTextField?.text ?? "") else { return }
        guard let rate = Double(rateTextField?.text ?? "") else { return }
        
        let monthlyPayment = abs(ExcelFormulas.pmt(rate: rate / 100 / 12, nper: nper, pv: pv))
        monthlyPaymentLabel?.text = monthlyPayment.asCurrency()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateAmountLabel()
        updateMonthlyAmountLabel()
        
    }
    
    // MARK: - Actions

    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        updateMonthlyAmountLabel()
    }
    
}

