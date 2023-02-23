//
//  NewOperationScreenView.swift
//  UnderControl
//
//  Created by Максим Боталов on 22.02.2023.
//

import SwiftUI

struct NewOperationScreenView: View {
    
    // MARK: - СВОЙСТВА
    @Binding var dismiss: Bool
    
    @State private var operationType = OperationType.minus
    @State private var amountOperation: Float = 0
    @State private var showAllCategories = false
    
    // MARK: - ТЕЛО
    var body: some View {
        ZStack(alignment: .top) {
            Color.white.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16) {
                // ТопБар
                NewOperationTopBarView(dismiss: $dismiss)
                    .padding(.horizontal)
                
                // Заголовок
                Text(operationType == .minus ? "Новый расход" : "Новый доход")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding(.horizontal)
                
                // Выбор типа
                Picker("", selection: $operationType) {
                    Text("Расход").tag(0)
                    Text("Доход").tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                Text("\(amountOperation.formattedWithSeparator)₽")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                
                NewOperationCategoriesView(showAllCategories: $showAllCategories, operationType: $operationType)
                    .padding(.horizontal)
            }
        }
    }
    
    // MARK: - UI-ЕЛЕМЕНТЫ
}

// MARK: - ПРЕДВАРИТЕЛЬНЫЙ ПРОСМОТР
struct NewOperationScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NewOperationScreenView(dismiss: .constant(false))
    }
}
