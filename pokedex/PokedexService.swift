//
//  PokedexService.swift
//  pokedex
//
//  Created by Ryan Bowers on 4/25/24.
//

import Foundation

class PokedexService {
    
    static let shared = PokedexService()
    
    var pokedex: Pokedex
    
    /// Initializer that decodes the Pokedex JSON and stores it in the pokedex variable
    init() {
        
        let url = Bundle.main.url(forResource: "pokedex-data", withExtension: ".json")!
        
        
        let data = try! Data(contentsOf: url)
                
        let decoder = JSONDecoder()
        
        pokedex = try! decoder.decode(Pokedex.self, from: data)
    
    }
    
    /// Computed property that returns a list of the pokemon
    var pokemon: [Pokemon] {
        pokedex.pokemon
    }
    
    /// Function that searches the list of Pokemon for a pokemon with the given id. Returns nil if not found.
    func getPokemonById(id: Int) -> Pokemon {
        return pokemon.first(where: { $0.id == id })!
    }
}

