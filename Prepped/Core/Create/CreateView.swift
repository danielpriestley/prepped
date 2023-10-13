//
//  CreateView.swift
//  Prepped
//
//  Created by Daniel Priestley on 12/10/2023.
//

import SwiftUI

enum CreateMenuOptions: Int, CaseIterable, Identifiable {
    case addMeal
    case addIngredient
    case addShopping
    
    var title: String {
        switch self {
        case.addMeal: return "New Meal"
        case.addIngredient: return "Add Ingredient"
        case.addShopping: return "Create Shopping Item"
        }
    }
    
    var subtitle: String {
        switch self {
        case.addMeal: return "Create a new meal"
        case.addIngredient: return "Add a new ingredient to your inventory"
        case.addShopping: return "Add an item to your shopping list"
        }
    }
    
    var icon: String {
        switch self {
        case.addMeal: return "plus.square"
        case.addIngredient: return "list.bullet.below.rectangle"
        case.addShopping: return "cart.badge.plus"
        }
    }
    
    
    var id: Int { return self.rawValue}
    
    
    
}

struct CreateView: View {
    @Environment(\.dismiss) private var dismiss
    @State var meal = Meal()
    @Binding var sheetDetents: PresentationDetent
    
    
    private func isCreatingSomething() -> Bool {
        if meal.creationState == .none {
            return false
        }
        return true
    }
    
    
    // Handlers
    //    var onCommit: (_ meal: Meal) -> Void
    
    
    // Functions
    private func commit() {
        //        onCommit(meal)
        dismiss()
    }
    
    private func cancel() {
        dismiss()
    }
    
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                if isCreatingSomething() == false {
                    ForEach(CreateMenuOptions.allCases, id: \.self) { menuOption in
                        Button {
                            switch menuOption {
                            case .addMeal:
                                DispatchQueue.main.async {
                                    self.meal.creationState = .meal
                                    self.sheetDetents = PresentationDetent.large
                                }
                            case .addIngredient:
                                DispatchQueue.main.async {
                                    self.meal.creationState = .ingredient
                                    self.sheetDetents = PresentationDetent.large
                                }
                            case .addShopping:
                                DispatchQueue.main.async {
                                    self.meal.creationState = .shopping
                                    self.sheetDetents = PresentationDetent.large
                                }
                            }
                            
                        } label: {
                            HStack(alignment: .center) {
                                Image(systemName: menuOption.icon)
                                    .padding(.leading, 8)
                                    .padding(.trailing)
                                VStack(alignment: .leading) {
                                    Text(menuOption.title)
                                        .fontWeight(.semibold)
                                    Text(menuOption.subtitle)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                                Spacer()
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.gray.opacity(0.2), lineWidth: 1)
                            )
                        }
                        .padding(.bottom, 4)
                    }
                    
                    .tint(Color.primary)
                    Spacer()
                }
                
                
                
                if isCreatingSomething() == true {
                    switch meal.creationState {
                    case .meal:
                        MealCreationView()
                    case .shopping:
                        Text("Shopping")
                    case .ingredient:
                        Text("Ingredient")
                    case .none:
                        Text("")
                    }
                }
                
                
                
            }
            .padding(.horizontal)
            .padding(.top)
            
            .navigationTitle("Add New")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        withAnimation {
                            meal.resetCreationState()
                        }
                        
                        cancel()
                    } label: {
                        Text("Cancel")
                    }
                    .tint(Color.primaryColor)
                }
            }
        }
        
        
        
    }
}

//#Preview {
//    NavigationStack {
//        CreateView(sheetDetents: $PresentationDetent.large)
//    }
//
//}
