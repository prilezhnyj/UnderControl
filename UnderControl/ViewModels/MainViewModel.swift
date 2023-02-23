//
//  MainViewModels.swift
//  UnderControl
//
//  Created by Максим Боталов on 22.02.2023.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var operations = [OperationModel]()
    @Published var currentOperation = OperationModel(type: .minus, category: CategoryModel(type: .minus, title: "", image: ""), amount: 1, date: Date())
    
    init() {
        mockData()
    }
    
    private func mockData() {
        operations.append(OperationModel(type: .minus, category: CategoryModel(type: .minus, title: "Транспорт", image: "🚌"), amount: 463, date: Date()))
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

