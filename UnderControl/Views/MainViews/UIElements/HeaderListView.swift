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
    
    // MARK: - ТЕЛО
    var body: some View {
        HStack {
            // Название
            Text(text)
            Spacer()
            // Сумма
            Text("1 000 000₽")
        }
        .foregroundColor(.gray)
    }
}

// MARK: - ПРЕДВАРИТЕЛЬНЫЙ ПРОСМОТР
struct HeaderListView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderListView(text: "Расходы")
            .previewLayout(.sizeThatFits)
    }
}
