//
//  TabBarView.swift
//  Movie
//
//  Created by Riza Radia Rivaldo on 21/09/24.
//

import SwiftUI

struct TabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        Text(text)
            .fontWeight(isSelected ? .heavy : .regular)
            .padding(.bottom, 10)
            .foregroundStyle(isSelected ? Color.black : Color.gray)
//            .border(Color.black, width: 1)
        
    }
}
