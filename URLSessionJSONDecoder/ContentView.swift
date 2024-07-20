//
//  ContentView.swift
//  URLSessionJSONDecoder
//
//  Created by Max Vigueras Tovar on 19/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ViewModel = ViewModel()
    var body: some View {
        NavigationView{
            Form{
                ForEach(viewModel.pokemons, id: \.name){ pokemon in
                    Text(pokemon.name)
                }
            }
            .navigationTitle("Pokemons")
        }        
        .onAppear{
            viewModel.getPokemons()
        }
    }
}

#Preview {
    ContentView()
}
