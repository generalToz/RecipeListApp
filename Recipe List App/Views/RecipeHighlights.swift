//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Alex Tosspon on 7/3/22.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHightlights = ""
    
    init(hightlights:[String]) {
        
        // Loop through the hightlights and build the string
        for index in 0..<hightlights.count {
            
            // If this is the last time, don't add a comma
            if index == hightlights.count - 1 {
                allHightlights += hightlights[index]
            } else {
                allHightlights += hightlights[index] + ", "
            }
            
        }
        
    }
    
    var body: some View {
        Text(allHightlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(hightlights: ["test","test2","test3"])
    }
}
