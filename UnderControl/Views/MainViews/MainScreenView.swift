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
    @State private var showMainDetailedView = false
    @State private var showNewOperationView = false
    
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
            
            addOperationButton()
            
            // Окно с детальной информацией
            MainDetailedView(viewModel: viewModel, closeView: $showMainDetailedView)
                .offset(y: showMainDetailedView ? 0 : 300)
                .transition(.move(edge: .bottom))
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .animation(.spring(), value: showMainDetailedView)
        .fullScreenCover(isPresented: $showNewOperationView) {
            showNewOperationView = false
        } content: {
            NewOperationScreenView(dismiss: $showNewOperationView)
        }

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
    
    // Кнопка добавления новой операци
    private func addOperationButton() -> some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    showNewOperationView = true
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .frame(width: 60, height: 60)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 0)
                        .padding()
                }
            }
        }
    }
}

// MARK: - ПРЕДВАРИТЕЛЬНЫЙ ПРОСМОТР
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
