//
//  ContentView.swift
//  iExpense
//
//  Created by Maximilian Berndt on 2023/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var currencyIdentifier: String {
        return Locale.current.currency?.identifier ?? "USD"
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                            Text(item.type.rawValue)
                        }
                        
                        Spacer()
                        
                        Text(
                            item.amount,
                            format: .currency(
                                code: currencyIdentifier
                            )
                        )
                        .foregroundColor(amountStyle(amount: item.amount))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    private func amountStyle(amount: Double) -> Color {
        switch amount {
        case 0..<10: return Color.green;
        case 10..<100: return Color.yellow;
        default: return Color.red;
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
