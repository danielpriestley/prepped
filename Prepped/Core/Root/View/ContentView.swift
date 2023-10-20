//
//  ContentView.swift
//  Prepped
//
//  Created by Daniel Priestley on 12/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                PreppedTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
