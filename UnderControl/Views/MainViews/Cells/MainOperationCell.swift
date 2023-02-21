//
//  MainOperationCell.swift
//  UnderControl
//
//  Created by Максим Боталов on 21.02.2023.
//

import SwiftUI

struct MainOperationCell: View {
    
    // MARK: - ТЕЛО
    var body: some View {
        HStack(spacing: 16) {
            // Иконка
            Text("🥬")
                .frame(width: 40, height: 40, alignment: .center)
                .background(Color.black.opacity(0.05))
                .clipShape(Circle())
            
            // Текст и категория
            VStack(alignment: .leading) {
                Text("Продукты")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                
                Text("Расход")
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Цена
            Text("- 1 000 000₽")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.red)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// MARK: - ПРЕДВАРИТЕЛЬНЫЙ ПРОСМОТР
struct MainOperationCell_Previews: PreviewProvider {
    static var previews: some View {
        MainOperationCell()
            .previewLayout(.sizeThatFits)
    }
}
