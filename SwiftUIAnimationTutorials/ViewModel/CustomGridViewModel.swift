//
//  CustomGridViewModel.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 6.03.2022.
//

import SwiftUI

class CustomGridViewModel: ObservableObject {
    @Published var showTutorial = false
    @Published var selectedTutorial = TutorialModel(name: "Wawes", animationView: AnyView(WawesView()), keys: "mykeys", image: "hamit")
    @Published var showTContent = false
    
}
