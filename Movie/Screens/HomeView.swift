//
//  MainView.swift
//  Movie
//
//  Created by Riza Radia Rivaldo on 21/09/24.
//

import SwiftUI

struct HomeView: View {
    @State var tabIndex = 0
    var body: some View {
        VStack {
            CustomTopTabBar(tabindex: $tabIndex)
            MoviesView()
        }
    }
}

#Preview {
    HomeView()
}
