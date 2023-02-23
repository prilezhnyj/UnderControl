//
//  NewOperationCategoriesView.swift
//  UnderControl
//
//  Created by Максим Боталов on 22.02.2023.
//

import SwiftUI

struct NewOperationCategoriesView: View {
    
    // MARK: - СВОЙСТВА
    @StateObject var viewModel = CategoryViewModel()
    @Binding var showAllCategories: Bool
    @Binding var operationType: OperationType
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8, alignment: .center),
        GridItem(.flexible(), spacing: 8, alignment: .center),
        GridItem(.flexible(), spacing: 8, alignment: .center),
        GridItem(.flexible(), spacing: 8, alignment: .center),
    ]
    
    // MARK: - ТЕЛО
    var body: some View {
        allView()
    }
    
    // MARK: - ФУНКЦИИ && UI
    // Хедер View
    private func headerView() -> some View {
        HStack(alignment: .center, spacing: 0) {
            // Заголовок
            Text("Категории")
                .font(.system(size: 16, weight: .bold, design: .rounded))
            
            Spacer()
            
            // Кнопка раскрытия и закрытия всех категории
            Button {
                withAnimation(.spring()) {
                    showAllCategories.toggle()
                }
            } label: {
                Text(showAllCategories ? "Скрыть" : "Показать")
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(showAllCategories ? .red : .black)
            }
        }
        .padding(16)
    }
    
    // Категории
    private func categories(for array: [CategoryModel]) -> some View {
        ForEach(array) { item in
            VStack {
                // Фон иконки
                Text(item.image)
                    .frame(minWidth: 40, minHeight: 40)
                    .background(Color.black.opacity(0.05))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                // Текст категории
                Text("Продукты")
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .onTapGesture {
                withAnimation(.spring()) {
                    // пеереключение на выборанную категорию
                }
            }
        }
    }
    
    // Общая сетка
    private func gridCategories() -> some View {
        LazyVGrid(columns: columns, alignment: .center, spacing: 8) {
            if operationType == .minus {
                categories(for: viewModel.category.filter({ $0.type == .minus }))
            }
            
            if operationType == .plus {
                categories(for: viewModel.category.filter({ $0.type == .plus }))
            }
        }
        .padding(.horizontal, 16)
    }
    
    // Сетка в ScrollView
    private func gridInScrollView() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            gridCategories()
        }
    }
    
    // Все элементы
    private func allView() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            headerView()
            gridInScrollView()
        }
        .frame(height: showAllCategories ? 230 : 150)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
        .animation(.spring(), value: showAllCategories)
    }
}

struct NewOperationCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NewOperationCategoriesView(showAllCategories: .constant(false), operationType: .constant(.plus))
            .previewLayout(.sizeThatFits)
    }
}
