//
//  HeaderListView.swift
//  UnderControl
//
//  Created by Максим Боталов on 21.02.2023.
//

import SwiftUI

struct HeaderListView: View {
    
    // MARK: - Свойства
    let text: String
    let array: [OperationModel]
    
    // MARK: - ТЕЛО
    var body: some View {
        HStack {
            // Название
            Text(text)
            
            Spacer()
            
            // Сумма
            if let amount = array.reduce(0, { $0 + $1.amount }) {
                Text(amount.formattedWithSeparator + "₽")
            }
        }
        .foregroundColor(.gray)
    }
}

// MARK: - ПРЕДВАРИТЕЛЬНЫЙ ПРОСМОТР
struct HeaderListView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderListView(text: "", array: [OperationModel(type: .minus, category: CategoryModel(type: .minus, title: "", image: ""), amount: 1, date: Date())])
            .previewLayout(.sizeThatFits)
    }
}
