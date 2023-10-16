//
//  MealCreationView.swift
//  Prepped
//
//  Created by Daniel Priestley on 13/10/2023.
//

import SwiftUI

struct MealCreationView: View {
    @State private var meal = Meal()
    @State private var mealTitle = ""
    @State private var mealCalories = ""
    @State private var showingIngredientsSection = false
    
    enum FocusableField: Hashable {
        case title, calories
    }
    
    @FocusState private var focusedField: FocusableField?
    
    var body: some View {
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
            
            
            TextField(text: $mealCalories) {
                Text("Calories")
            }
            .keyboardType(.numberPad)
            .padding(.bottom)
            .focused($focusedField, equals: .calories)
            .onSubmit {
                // call to show add ingredient view here
                withAnimation {
                    showingIngredientsSection = true
                }
                
            }
            
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
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Text("Add to upcoming day")
                    .foregroundColor(.gray)
                
                Spacer()
                
                Button("Create") {
                }
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
