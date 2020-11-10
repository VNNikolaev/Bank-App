//
//  Double + asCurrency.swift
//  Bank App
//
//  Created by Nikolaev Vasiliy on 10.11.2020.
//

import Foundation

extension Double {
    func asCurrency(_ symbol: String = "₽") -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = symbol
        
        let number = NSNumber(value: self)
        return formatter.string(from: number)
        
    }
}
