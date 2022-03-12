//
//  HomeView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 6.03.2022.
//

import SwiftUI

struct HomeView: View {
    @Binding var filteredItems: [TutorialModel]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            CustomGridView(filteredItems: $filteredItems)
        }
        .background(
            Color.black.opacity(0.05)
                .edgesIgnoringSafeArea(.all)
        )
    }
}
