//
//  CustomTopTabBar.swift
//  Movie
//
//  Created by Riza Radia Rivaldo on 21/09/24.
//

import SwiftUI

struct CustomTopTabBar: View {
    @Binding var tabindex: Int
    var body: some View {
        HStack(spacing: 20) {
            TabBarButton(text: "Trending", isSelected: .constant(tabindex == 0))
                .onTapGesture {
                    onButtonTapped(index: 0)
                }
            TabBarButton(text: "Horror", isSelected: .constant(tabindex == 1))
                .onTapGesture {
                    onButtonTapped(index: 1)
                }
        }
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation {
            tabindex = index
        }
    }
}


#Preview {
    CustomTopTabBar(tabindex: .constant(0))
}
