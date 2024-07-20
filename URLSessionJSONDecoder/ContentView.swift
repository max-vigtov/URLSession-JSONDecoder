//
//  ContentView.swift
//  URLSessionJSONDecoder
//
//  Created by Max Vigueras Tovar on 19/07/24.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: ViewModel = ViewModel()
    var body: some View {
        VStack {
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            viewModel.getPokemons()
        }
    }
}

#Preview {
    ContentView()
}
