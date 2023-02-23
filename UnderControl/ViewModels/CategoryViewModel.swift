//
//  CategoryViewModel.swift
//  UnderControl
//
//  Created by Максим Боталов on 22.02.2023.
//

import Foundation

class CategoryViewModel: ObservableObject {
    @Published var category = [CategoryModel]()
    
    init() {
        categoryMockData()
    }
    
    private func categoryMockData() {
        category.append(CategoryModel(type: .minus, title: "Продукты", image: "🥬"))
        category.append(CategoryModel(type: .minus, title: "Транспорт", image: "🚎"))
        category.append(CategoryModel(type: .minus, title: "Дом", image: "🏠"))
        category.append(CategoryModel(type: .minus, title: "Сладости", image: "🍭"))
        category.append(CategoryModel(type: .minus, title: "Хобби", image: "👟"))
        // ---------- //
        category.append(CategoryModel(type: .plus, title: "Зарплата", image: "💰"))
        category.append(CategoryModel(type: .plus, title: "Донаты", image: "🤑"))
        category.append(CategoryModel(type: .plus, title: "Сбережения", image: "💸"))
        category.append(CategoryModel(type: .plus, title: "Инестиции", image: "💶"))
    }
}
