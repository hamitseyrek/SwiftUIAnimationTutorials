//
//  CustomGridViewModel.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 6.03.2022.
//

import SwiftUI

class CustomGridViewModel: ObservableObject {
    @Published var items = tutorials
    
    // Detail Content
    @Published var showTutorial = false
    @Published var selectedTutorial = TutorialModel(name: "hamitt", slug: "slugım", keys: "mykeys", image: "hamit")
    
    @Published var showTContent = false
    
}
