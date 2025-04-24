//
//  TDButton.swift
//  ToDoAppSwiftUI
//
//  Created by sunflow on 21/4/25.
//

import SwiftUI

struct TDButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(backgroundColor)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TDButton(title: "Title", backgroundColor: .blue) {
        // action
    }
}
