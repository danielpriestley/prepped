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
    @State private var showingCaloriesSection = false
    @State private var showingIngredientsSection = false
    @State private var showingStepsSection = false
    @State private var submittedCalories = false
    @State private var isKeyboardPresented = false
    @State private var addingIngredient = false
    @State private var addingStep = false
    @State private var newIngredientName = ""
    @State private var ingredientsList: [String] = []
    
    let rowHeight: CGFloat = 44
    
    enum FocusableField: Hashable {
        case title, calories, ingredient, step
    }
    
    @FocusState private var focusedField: FocusableField?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Meal Name")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                    
                    TextField(text: $mealTitle) {
                        Text("Meal Name")
                    }
                    .padding(.bottom)
                    .focused($focusedField, equals: .title)
                    .onSubmit {
                        showingCaloriesSection = true
                        focusedField = .calories
                    }
                    .onReceive(keyboardPublisher) { value in
                        isKeyboardPresented = value
                    }
                    
                    
                    
                    
                    if showingCaloriesSection {
                        HStack (spacing: 2){
                            Text("Calories")
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
                            .keyboardType(.numbersAndPunctuation)
                            .focused($focusedField, equals: .calories)
                            .onSubmit {
                                // call to show add ingredient view here
                                withAnimation {
                                    showingIngredientsSection = true
                                    showingStepsSection = true
                                }
                            }
                            .onReceive(keyboardPublisher) { value in
                                isKeyboardPresented = value
                            }
                            
                        }
                        .padding(.bottom)
                    }
                    
                    if showingIngredientsSection {
                        HStack (spacing: 2){
                            Text("Ingredients")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.gray)
                            
                            Text("(optional)")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                        
                        
                        
                        VStack(alignment: .leading, spacing: 8) {
                                ForEach(ingredientsList, id: \.self) { ingredient in
                                    HStack {
                                        Text("\(ingredient)")
                                            .listRowInsets(.init(top: 0,
                                                                 leading: 0,
                                                                 bottom: 0,
                                                                 trailing: 0))
                                            .bold()
                                        Spacer()
                                        Button {
                                            
                                        } label: {
                                            Image(systemName: "minus")
                                        }
                                        .tint(.appPrimary)
                                    }
                                    
                                        
                                }
                            }
                            .frame(maxHeight: (rowHeight) * CGFloat(ingredientsList.count))
                            .padding(.bottom, addingIngredient ? 4 : 0)
                           
                        
                        
                        
                        if addingIngredient {
                            TextField(text: $newIngredientName) {
                                Text("Ingredient Name")
                            }
                            .padding(.bottom, 4)
                            .focused($focusedField, equals: .ingredient)
                            .onSubmit {
                                withAnimation {
                                    ingredientsList.append(newIngredientName)
                                    newIngredientName = ""
                                }
                                focusedField = .ingredient
                            }
                            
                        }
                        
                        Button {
                            withAnimation {
                                focusedField = .ingredient
                                addingIngredient.toggle()
                            }
                            
                        } label: {
                            HStack{
                                Image(systemName: "plus.circle")
                                Text("Add Ingredient")
                            }
                            //                        .font(.headline)
                            .foregroundStyle(.appPrimary)
                            .modifier(PreppedSecondaryButtonLabelModifier())
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                            
                        }
                        .padding(.bottom)
                    }
                    
                    if showingStepsSection {
                        HStack (spacing: 2){
                            Text("Steps")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.gray)
                            
                            Text("(optional)")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                        Button {
                        } label: {
                            HStack{
                                Image(systemName: "plus.circle")
                                Text("Add Step")
                            }
                            .foregroundStyle(.appPrimary)
                            .modifier(PreppedSecondaryButtonLabelModifier())
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                            
                        }
                        .padding(.bottom)
                    }
                    
                    Spacer()
                    
                    if !mealTitle.isEmpty && focusedField == nil {
                        Button {
                            
                        } label: {
                            HStack{
                                Text("Add Meal")
                            }
                            .modifier(PreppedPrimaryButtonLabelModifier())
                            
                        }
                        .padding(.bottom)
                    }
                    
                    
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
