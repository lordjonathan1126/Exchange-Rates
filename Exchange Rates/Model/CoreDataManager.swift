//
//  CoreDataManager.swift
//  Exchange Rates
//
//  Created by Jonathan Ng on 19/03/2021.
//

import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init() {}
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    func saveHistory(date: Date,toCurrency: String, finalCurrencyValue: Double, fromCurrency: String, value: Double) {
        let context = self.appDelegate!.persistentContainer.newBackgroundContext()
        context.perform {
            let entity = Historical.entity()
            let historical = Historical(entity: entity, insertInto: context)
            historical.date = date
            historical.toCurrency = toCurrency
            historical.finalCurrencyValue = finalCurrencyValue
            historical.fromCurrency = fromCurrency
            historical.value = value
            do {
                try context.save()
            } catch {
                return
            }
        }
    }
    
}
