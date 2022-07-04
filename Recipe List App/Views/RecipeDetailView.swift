//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Alex Tosspon on 6/25/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe

    @State var selectedServiceSize = 2
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                // MARK: Serving Size Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                        .font(Font.custom("Avenir", size: 15))
                    Picker("", selection: $selectedServiceSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .font(Font.custom("Avenir", size: 15))
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 180)
                }
                .padding()
               
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Indredients")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.top,.bottom],5)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServiceSize) + " " + item.name.lowercased() )
                            .font(Font.custom("Avenir", size: 15))
                    }
                }.padding(.horizontal)
                
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.top,.bottom],5)
                    
                    ForEach (0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ".  " + recipe.directions[index])
                            .padding(.bottom,5)
                            .font(Font.custom("Avenir", size: 15))
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
