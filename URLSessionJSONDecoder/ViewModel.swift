//
//  ViewModel.swift
//  URLSessionJSONDecoder
//
//  Created by Max Vigueras Tovar on 19/07/24.
//

import Foundation

struct PokemoDataModel: Decodable {
    let name: String
    let url: String
}

struct PokemonResponseDataModel: Decodable{
    let pokemons: [PokemoDataModel]
    enum CodingKeys: String, CodingKey{
        case results
    }
    
    init(from decoder:  Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemons = try container.decode([PokemoDataModel].self, forKey: .results)
    }
}

final class ViewModel: ObservableObject {
    
    @Published var pokemons: [PokemoDataModel] = []
    
    func getPokemons(){
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let _ = error {
                print("Error")
            }
            
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let pokemonDataModel = try! JSONDecoder().decode(PokemonResponseDataModel.self, from: data)
                print("Pokemon \(pokemonDataModel)")
                DispatchQueue.main.async{
                    self.pokemons = pokemonDataModel.pokemons
                }
            }
            
        }.resume()
    }
}
