//
//  ContentView.swift
//  Recipe List App
//
//  Created by Alex Tosspon on 6/24/22.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var model =  RecipeModel()
    
    var body: some View {
    
        NavigationStack {
            List(model.recipes) { r in
                
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
                        Text(r.name)
                    }
                }

               
            
            }.navigationTitle("All Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
