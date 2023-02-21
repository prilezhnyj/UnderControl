//
//  OperationModel.swift
//  UnderControl
//
//  Created by Максим Боталов on 21.02.2023.
//

import Foundation

struct OperationModel: Identifiable {
    var id = UUID().uuidString
    var type: OperationType
    var category: CategoryModel
    var amount: Float
    var description: String?
    var date: Date
}

enum OperationType: String {
    case minus = "Расход"
    case plus = "Доход"
}

struct CategoryModel: Identifiable {
    var id = UUID().uuidString
    var title: String
    var image: String
}
