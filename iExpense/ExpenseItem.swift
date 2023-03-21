//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Maximilian Berndt on 2023/03/21.
//

import Foundation

enum ExpenseType: String, CaseIterable, Codable {
    case personal
    case business
}

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: ExpenseType
    let amount: Double
}
