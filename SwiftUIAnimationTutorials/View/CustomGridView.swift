//
//  CustomGridView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 6.03.2022.
//

import SwiftUI

struct CustomGridView: View {
    @EnvironmentObject var gridModel: CustomGridViewModel
    @State var width = (UIScreen.main.bounds.width - 45) / 2
    
    // for search bar
    @Binding var filteredItems: [TutorialModel]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridModel.columns, spacing: 15) {
                ForEach(filteredItems, id: \.name) { tutorial in
                    // Build Custom View using ViewBuilder
                    // Our Content goes here
                    CustomView(columns: $gridModel.columns) {
                        Image(tutorial.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: gridModel.columns.count == 1 ? 65 : width, height: gridModel.columns.count == 1 ? 65 : width)
                            .cornerRadius(15)
                    } detail: {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(tutorial.name)
                                .fontWeight(.heavy)
                            
                            Text(tutorial.keys)
                                .font(.caption)
                                .fontWeight(.heavy)
                                .foregroundColor(.gray)
                        }
                    }.onTapGesture {
                        gridModel.selectedTutorial = tutorial
                        gridModel.showTutorial.toggle()
                    }
                }
            }
            NavigationLink(destination: GridDetailView().environmentObject(gridModel).navigationBarHidden(true), isActive: $gridModel.showTutorial) {}
        }.padding(.top, 12)
    }
}

struct CustomView<Content: View, Detail: View>: View {
    
    var content: Content
    var detail: Detail
    @Binding var columns: [GridItem]
    
    init(columns: Binding<[GridItem]>, @ViewBuilder content: () -> Content, @ViewBuilder detail: () -> Detail) {
        self.content = content()
        self.detail = detail()
        self._columns = columns
    }
    
    var body: some View {
        if columns.count == 1 {
            HStack(spacing: 15) {
                content
                detail
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
        } else {
            VStack {
                content
                detail
            }
            .padding(.horizontal)
        }
    }
}

