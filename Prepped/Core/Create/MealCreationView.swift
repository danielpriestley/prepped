//
//  MealCreationView.swift
//  Prepped
//
//  Created by Daniel Priestley on 13/10/2023.
//

import SwiftUI

enum CalorieButtonState {
    case add, clear, skip
    
    var text: String {
        switch self {
        case.add: return "Add"
        case.clear: return "Clear"
        case.skip: return "Skip"
        }
    }

}

struct MealCreationView: View {
    @State private var meal = Meal()
    @State private var mealTitle = ""
    @State private var mealCalories = ""
    @State private var showingIngredientsSection = false
    @State private var submittedCalories = false
    @State private var calorieButtonSetting: CalorieButtonState = .skip
    
    enum FocusableField: Hashable {
        case title, calories
    }
    
    @FocusState private var focusedField: FocusableField?
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("What's it called?")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                
                
                TextField(text: $mealTitle) {
                    Text("Meal Name")
                }
                .padding(.bottom)
                .focused($focusedField, equals: .title)
                .onSubmit {
                    focusedField = .calories
                }
                
                
                HStack (spacing: 2){
                    Text("How many calories?")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                    
                    Text("(optional)")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                
                
                HStack(alignment: .center) {
                    TextField(text: $mealCalories) {
                        Text("Calories")
                    }
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: .calories)
                    .onSubmit {
                        // call to show add ingredient view here
                        withAnimation {
                            showingIngredientsSection = true
                        }
                    }
                
                    Button {
                        
                        if !submittedCalories {
                            withAnimation {
                                showingIngredientsSection = true
                                focusedField = nil
                                submittedCalories = true
                            }
                        } else {
                            mealCalories = ""
                            submittedCalories = false
                        }
                        
                        
                    } label: {
                        if submittedCalories {
                            Text(calorieButtonSetting.text)
                                .foregroundStyle(mealCalories.isEmpty ? .white : .blue)
                        } else {
                            Text("Clear")
                                .foregroundStyle(.white)
                        }
                        
                    }
                    .buttonStyle(.bordered)
                    .tint(mealCalories.isEmpty ? .gray : .blue)
                    .clipShape(.capsule)
                }
                .padding(.bottom)
                
                if showingIngredientsSection {
                    HStack (spacing: 2){
                        Text("Add some ingredients")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        
                        Text("(optional)")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
                
                Spacer()
                
                
            }
        }
        .onAppear {
            focusedField = .title
        }
        
        
        
    }
}

#Preview {
    MealCreationView()
}
