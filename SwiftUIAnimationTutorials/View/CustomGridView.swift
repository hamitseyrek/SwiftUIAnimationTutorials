//
//  CustomGridView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 6.03.2022.
//

import SwiftUI

struct CustomGridView: View {
    @StateObject var gridModel = CustomGridViewModel()
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)
    @State var width = (UIScreen.main.bounds.width - 45) / 2
    
    // for search bar
    @Binding var filteredItems: [TutorialModel]
    
    var body: some View {
        ScrollView {
            HStack {
                Text("Popular")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    // reducing to row
                    withAnimation(.easeOut) {
                        if columns.count == 2 {
                            columns.removeLast()
                        } else {
                            columns.append(GridItem(.flexible(), spacing: 15))
                        }
                    }
                }) {
                    Image(systemName: columns.count == 1 ? "rectangle.grid.1x2": "square.grid.2x2")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
            .padding(.top, 25)
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(filteredItems, id: \.name) { tutorial in
                    // Build Custom View using ViewBuilder
                    // Our Content goes here
                    CustomView(columns: $columns) {
                        Image(tutorial.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: columns.count == 1 ? 65 : width, height: columns.count == 1 ? 65 : width)
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
        }
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

