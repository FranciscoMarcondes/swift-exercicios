//
//   CurrencyFormatter.swift
//  ShoppingMVVM
//
//  Created by Francisco Marcondes da Silva Junior on 07/05/26.
//

import Foundation

extension Decimal {
    var brl: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: self as NSDecimalNumber) ?? "R$ 0,00"
    }
}
