//
//  MainScreenView.swift
//  UnderControl
//
//  Created by Максим Боталов on 21.02.2023.
//

import SwiftUI

struct MainScreenView: View {
    
    // MARK: - Свойства
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
            MainDetailedView(closeView: $showMainDetailedView)
                .offset(y: showMainDetailedView ? 0 : 200)
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
            Section {
                ForEach(0 ..< 2, id: \.self) { index in
                    MainOperationCell()
                        .onTapGesture {
                            showMainDetailedView = true
                        }
                }
            } header: {
                HeaderListView(text: "Расходы")
            }
            
            // Доходы
            Section {
                ForEach(0 ..< 4, id: \.self) { index in
                    MainOperationCell()
                        .onTapGesture {
                            showMainDetailedView = true
                        }
                }
            } header: {
                HeaderListView(text: "Доходы")
            }
        }
        .listStyle(.plain)
    }
}

// MARK: - ПРЕДВАРИТЕЛЬНЫЙ ПРОСМОТР
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
