//
//  MainOperationCell.swift
//  UnderControl
//
//  Created by Максим Боталов on 21.02.2023.
//

import SwiftUI

struct MainOperationCell: View {
    
    // MARK: - Свойства
    let operation: OperationModel
    
    // MARK: - ТЕЛО
    var body: some View {
        HStack(spacing: 16) {
            // Иконка
            Text(operation.category.image)
                .frame(width: 40, height: 40, alignment: .center)
                .background(Color.black.opacity(0.05))
//                .clipShape(Circle())
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // Текст и категория
            VStack(alignment: .leading) {
                Text(operation.category.title)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                
                Text(operation.type.rawValue)
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Цена
            Text(operation.type == .minus ? "-\(operation.amount.formattedWithSeparator)₽" : "+\(operation.amount.formattedWithSeparator)₽")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(operation.type == .minus ? .red : .green)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// MARK: - ПРЕДВАРИТЕЛЬНЫЙ ПРОСМОТР
struct MainOperationCell_Previews: PreviewProvider {
    static var previews: some View {
        MainOperationCell(operation: OperationModel(type: .minus, category: CategoryModel(type: .minus, title: "", image: ""), amount: 1, date: Date()))
            .previewLayout(.sizeThatFits)
    }
}
