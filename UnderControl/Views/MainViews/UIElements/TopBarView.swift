//
//  TopBarView.swift
//  UnderControl
//
//  Created by Максим Боталов on 21.02.2023.
//

import SwiftUI

struct TopBarView: View {
    
    // MARK: - ТЕЛО
    var body: some View {
        HStack {
            // Текущая дата (День недели + дата)
            VStack(alignment: .leading, spacing: 4) {
                Text("Понедельник")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Text("20 февраля 2023")
                    .font(.system(size: 14, weight: .regular, design: .default))
            }
            .foregroundColor(.black)
            .frame(maxHeight: 48)
            
            Spacer()
            
            // Изображение пользователя
            Image("Avatar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: 48)
    }
}

// MARK: - ПРЕДВАРИТЕЛЬНЫЙ ПРОСМОТР
struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
            .previewLayout(.sizeThatFits)
    }
}
