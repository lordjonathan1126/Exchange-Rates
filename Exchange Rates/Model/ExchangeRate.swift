//
//  ExchangeRate.swift
//  Exchange Rates
//
//  Created by Jonathan Ng on 18/03/2021.
//

import Foundation
import Foundation

class ExchangeRate: Codable {
    let rates: [String: Double]
    let base, date: String

    init(rates: [String: Double], base: String, date: String) {
        self.rates = rates
        self.base = base
        self.date = date
    }
}
