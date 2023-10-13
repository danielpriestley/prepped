//
//  Meal.swift
//  Prepped
//
//  Created by Daniel Priestley on 13/10/2023.
//

import SwiftUI
import Observation

enum CreationState {
    case meal, shopping, ingredient, none
}

@Observable class Meal {
    var id = UUID()
    var title = ""
    var creationState: CreationState = .none
//    var isCreatingMeal = false
//    var isCreatingIngredient = false
//    var isCreatingShopping = false
    
    func resetCreationState() {
        self.creationState = .none
//        isCreatingMeal = false
//        isCreatingIngredient = false
//        isCreatingShopping = false
    }
    
    
}
