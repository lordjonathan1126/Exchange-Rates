//
//  HistoryViewSwiftUI.swift
//  Exchange Rates
//
//  Created by Jonathan Ng on 19/03/2021.
//

import SwiftUI
import UIKit

struct HistoryView: View {
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        HistoryList()
            .environment(\.managedObjectContext, self.context)
    }
}

struct HistoryList :View{
    @FetchRequest(
        entity: Historical.entity(),
        sortDescriptors: [ NSSortDescriptor(keyPath: \Historical.date, ascending: false)]
    ) var history: FetchedResults<Historical>
    var body: some View{
        List(history, id: \.self){ hist in
            VStack (alignment: .leading){
                Text("\(hist.fromCurrency!) \(String(format: "%.2f", hist.value)) > \(hist.toCurrency!) \(String(format: "%.2f", (hist.value * hist.finalCurrencyValue)))")
                    .bold()
                    .font(.headline)
                Text("\(hist.date!)")
                    .font(.caption)
            }
            
        }
    }
}

struct HistoryViewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
