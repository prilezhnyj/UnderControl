//
//  MainDetailedView.swift
//  UnderControl
//
//  Created by Максим Боталов on 21.02.2023.
//

import SwiftUI

struct MainDetailedView: View {
    
    //MARK: - Свойства
    @Binding var closeView: Bool
    
    // MARK: - ТЕЛО
    var body: some View {
        VStack(spacing: 16) {
            Capsule()
                .frame(width: 50, height: 8)
                .foregroundColor(.black.opacity(0.1))
            
            // Основной контент
            HStack(spacing: 16) {
                // Иконка
                Text("🥬")
                    .frame(minWidth: 40, minHeight: 40)
                    .background(Color.black.opacity(0.05))
                    .clipShape(Circle())
                
                // Описание
                VStack(alignment: .leading) {
                    Text("Продукты")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    Text("Расходы")
                        .font(.system(size: 14, weight: .regular, design: .default))
                }
                
                Spacer()
                
                // Сумма
                Text("- 1 000 000₽")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            }
            
            // Кнопки
            HStack {
                Spacer()
                // Удаление
                Button {
                    // действие удаления
                } label: {
                    Image(systemName: "trash")
                    
                        .frame(width: 90, height: 30)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .clipShape(Capsule())
                        .shadow(color: .red.opacity(0.05), radius: 5, x: 0, y: 0)
                }
                
                // Кнопка закрытия
                Button {
                    closeView = false
                } label: {
                    Image(systemName: "xmark")
                        .frame(width: 60, height: 30)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 0)
                }
            }
        }
        .padding(16)
        .padding(.bottom)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: -10)
    }
}

// MARK: - ПРЕДВАРИТЕЛЬНЫЙ ПРОСМОТР
struct MainDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        MainDetailedView(closeView: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
