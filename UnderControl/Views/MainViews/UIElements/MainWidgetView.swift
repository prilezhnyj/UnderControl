//
//  MainWidgetView.swift
//  UnderControl
//
//  Created by Максим Боталов on 21.02.2023.
//

import SwiftUI

struct MainWidgetView: View {
    
    // MARK: - ТЕЛО
    var body: some View {
        generalView()
    }
    
    // MARK: - UI ЭЛЕМЕНТЫ
    // Элементы слева
    private func informationLeft() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            // Месяц
            VStack(alignment: .leading) {
                Text("В январе")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Text("вы потратили")
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(.gray)
            }
            // Сумма
            Text("1 000 000₽")
                .font(.system(size: 24, weight: .bold, design: .rounded))
            
        }
    }
    
    // Элементы справа
    private func informationRight() -> some View {
        VStack(spacing: 8) {
            // Заработали
            VStack(alignment: .leading) {
                Text("заработали")
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(.gray)
                Text("1 000 000₽")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
            }
            // Потратили
            VStack(alignment: .leading) {
                Text("потратили")
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(.gray)
                Text("1 000 000₽")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
            }
        }
    }
    
    // Прогресс бар
    private func progressBar() -> some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(maxWidth: .infinity)
            .frame(height: 16)
    }
    
    // Общая вью
    private func generalView() -> some View {
        VStack(spacing: 16) {
            HStack(alignment: .top) {
                informationLeft()
                Spacer()
                informationRight()
            }
            .foregroundColor(.black)
            
            progressBar()
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
    }
}

// MARK: - ПРЕДВАРИТЕЛЬНЫЙ ПРОСМОТР
struct MainWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MainWidgetView()
            .previewLayout(.sizeThatFits)
    }
}
