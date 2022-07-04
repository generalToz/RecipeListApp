//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Alex Tosspon on 6/29/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0

    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .padding(.leading)
                .padding(.top,40)
                .bold()
                .font(Font.custom("Avenir Heavy", size: 24))
            
            GeometryReader { geo in
                TabView (selection: $tabSelectionIndex ){
                    
                    // Loop through each recipe
                    ForEach (0..<model.recipes.count, id: \.self) { index in
                        
                        // Only show those that should be featured
                        if model.recipes[index].featured == true {
                            
                            Button {
                                //Show the Recipe Detail sheet
                                self.isDetailViewShowing = true
                                
                            } label: {
                                // Recipe card
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .font(Font.custom("Avenir", size: 15))
                                            .padding(5)
                                    }
                                }
                            }
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing) {
                                // Show the Recipe Detail view
                                RecipeDetailView(recipe:model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color:Color(red: 0, green: 0, blue: 0,opacity: 0.5), radius: 10, x:-5, y:5)
                            
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time")
                    .font(Font.custom("Avenir Heavy", size: 16))
                    .onAppear {
                        setFeaturedIndex()
                    }
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(hightlights: model.recipes[tabSelectionIndex].highlights)
            }.padding([.bottom,.leading])
        }

    }
        
    func setFeaturedIndex() {
        
        // Find the first recipe that is featured
        let index = model.recipes.firstIndex { recipe in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}




struct RecipeFeaturedView_Previews: PreviewProvider {
   
    @EnvironmentObject var model:RecipeModel
    @State var tabSelectionIndex = 0
    
    static var previews: some View {
        
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
    func setFeaturedIndex() {
        
        // Find the first recipe that is featured
        let index = model.recipes.firstIndex { recipe in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}
