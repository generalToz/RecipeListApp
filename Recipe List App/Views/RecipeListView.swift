//
//  ContentView.swift
//  Recipe List App
//
//  Created by Alex Tosspon on 6/24/22.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .padding(.top,40)
                    .font(Font.custom("Avenir Heavy", size: 24))
    
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach(model.recipes) { r in
                            
                            NavigationLink {
                                RecipeDetailView(recipe: r)
                            } label: {
                                HStack(spacing: 20.0) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50,alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack(alignment: .leading) {
                                        Text(r.name)
                                            .font(Font.custom("Avenir Heavy", size: 16))
                                        RecipeHighlights(hightlights: r.highlights)
                                            .font(.callout)
                                    }.foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
            }.padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView().environmentObject(RecipeModel())
    }
}
