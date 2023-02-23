//
//  MainDetailedView.swift
//  UnderControl
//
//  Created by Максим Боталов on 21.02.2023.
//

import SwiftUI

struct MainDetailedView: View {
    
    //MARK: - Свойства
    @ObservedObject var viewModel: MainViewModel
    @Binding var closeView: Bool
    
    // MARK: - ТЕЛО
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Spacer()
                Capsule()
                    .frame(width: 50, height: 8)
                    .foregroundColor(.black.opacity(0.1))
                Spacer()
            }
            
            // Основной контент
            HStack(spacing: 16) {
                // Иконка
                Text(viewModel.currentOperation.category.image)
                    .frame(minWidth: 40, minHeight: 40)
                    .background(Color.black.opacity(0.05))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                // Описание
                VStack(alignment: .leading) {
                    Text(viewModel.currentOperation.category.title)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    Text(viewModel.currentOperation.type.rawValue)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Сумма
                Text(viewModel.currentOperation.type == .minus ? "-\(viewModel.currentOperation.amount.formattedWithSeparator)₽" : "+\(viewModel.currentOperation.amount.formattedWithSeparator)₽")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(viewModel.currentOperation.type == .minus ? .red : .green)
            }
            
            if viewModel.currentOperation.description != nil {
                Text(viewModel.currentOperation.description ?? "")
                    .font(.system(size: 16, weight: .regular, design: .rounded))
            }
            
            // Кнопки
            HStack {
                Spacer()
                // Удаление
                Button {
                    withAnimation(.spring()) {
                        viewModel.deleteOperation()
                        closeView = false
                    }
                } label: {
                    Image(systemName: "trash")
                        .frame(width: 90, height: 30)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
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
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 0)
                }
            }
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: -10)
    }
}

// MARK: - ПРЕДВАРИТЕЛЬНЫЙ ПРОСМОТР
struct MainDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        MainDetailedView(viewModel: MainViewModel(), closeView: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
