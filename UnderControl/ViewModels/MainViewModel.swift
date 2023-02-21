//
//  MainViewModels.swift
//  UnderControl
//
//  Created by Максим Боталов on 22.02.2023.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var operations = [OperationModel]()
    @Published var currentOperation = OperationModel(type: .minus, category: .init(title: "Продукты", image: "🥬"), amount: 1294, description: "Современные технологии достигли такого уровня, что курс на социально-ориентированный национальный проект требует анализа благоприятных перспектив.", date: Date())
    
    init() {
        mockData()
    }
    
    private func mockData() {
        operations.append(OperationModel(type: .minus, category: CategoryModel(title: "Продукты", image: "🥬"), amount: 140, description: "Современные технологии достигли такого уровня, что курс на социально-ориентированный национальный проект требует анализа благоприятных перспектив.", date: Date()))
        operations.append(OperationModel(type: .minus, category: CategoryModel(title: "Транспорт", image: "🚌"), amount: 463, date: Date()))
        operations.append(OperationModel(type: .minus, category: CategoryModel(title: "Подписки", image: "🎧"), amount: 677, date: Date()))
        
        operations.append(OperationModel(type: .plus, category: CategoryModel(title: "Зарплата", image: "💼"), amount: 2344, date: Date()))
        operations.append(OperationModel(type: .plus, category: CategoryModel(title: "Инвестиции", image: "💸"), amount: 1356, date: Date()))
    }
    
    // MARK: - Поиск элемента в массиве операций
    func findItem(item searchItem: OperationModel, in array: [OperationModel]) -> Int? {
        for (index, item) in array.enumerated() {
            if item.id == searchItem.id {
                return index
            }
        }
        return nil
    }
    
    func deleteOperation() {
        guard let item = findItem(item: currentOperation, in: operations) else { return }
        operations.remove(at: item)
        print(#function)
        
        
    }
}

