//
//  CustomGridViewModel.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 6.03.2022.
//

import SwiftUI

class CustomGridViewModel: ObservableObject {
    @Published var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)
    
    public func changeGridView () {
        // reducing to row
        withAnimation(.easeOut) {
            if columns.count == 2 {
                columns.removeLast()
            } else {
                columns.append(GridItem(.flexible(), spacing: 15))
            }
        }
    }
    
    @Published var showTutorial = false
    @Published var selectedTutorial = TutorialModel(name: "Wawes", animationView: AnyView(WawesView()), keys: "mykeys", image: "WawesView")
    @Published var showTContent = false
}

