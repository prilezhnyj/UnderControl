//
//  MainScreenView.swift
//  UnderControl
//
//  Created by Максим Боталов on 21.02.2023.
//

import SwiftUI

struct MainScreenView: View {
    
    // MARK: - Свойства
    @StateObject var viewModel = MainViewModel()
    @State var showMainDetailedView = false
    
    // MARK: - ТЕЛО
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white.ignoresSafeArea()
            
            // Основной контент
            VStack(spacing: 16) {
                TopBarView()
                    .padding(.horizontal)
                
                MainWidgetView()
                    .padding(.horizontal)
                
                listOperations()
            }
            
            // Окно с детальной информацией
            MainDetailedView(viewModel: viewModel, closeView: $showMainDetailedView)
                .offset(y: showMainDetailedView ? 0 : 250)
                .transition(.move(edge: .bottom))
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .animation(.spring(), value: showMainDetailedView)
    }
    
    // MARK: - UI ЭЛЕМЕНТЫ
    // Список операций
    private func listOperations() -> some View {
        List {
            // Расходы
            if let expenses = viewModel.operations.filter({ $0.type == .minus }) {
                fillingList(for: expenses, with: "Расходы")
            }
            
            // Доходы
            if let profits = viewModel.operations.filter({ $0.type == .plus }) {
                fillingList(for: profits, with: "Доходы")
            }
        }
        .listStyle(.plain)
    }
    
    // Заполнение списка операций
    private func fillingList(for array: [OperationModel], with header: String) -> some View {
        Section {
            ForEach(array) { operation in
                MainOperationCell(operation: operation)
                    .onTapGesture {
                        viewModel.currentOperation = operation
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            showMainDetailedView = true
                        }
                    }
            }
        } header: {
            HeaderListView(text: header, array: array)
        }
    }
}

// MARK: - ПРЕДВАРИТЕЛЬНЫЙ ПРОСМОТР
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(showMainDetailedView: false)
    }
}
