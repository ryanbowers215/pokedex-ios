//
//  PokemonViewModel.swift
//  pokedex
//
//  Created by Ryan Bowers on 4/25/24.
//

import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemon: Pokemon
    var pokedexService = PokedexService.shared
    
    
    init(pokemon: Pokemon){
        self.pokemon = pokemon
    }
    
    var typeString: String {
        pokemon.type.map { $0.rawValue }.joined(separator: ", ")
    }
    
    func nextPoke(){
        if pokemon.id < 151 {
            objectWillChange.send()
            pokemon = pokedexService.getPokemonById(id: pokemon.id + 1)
        }
    }
    func prevPoke(){
        if pokemon.id > 1 {
            objectWillChange.send()
            pokemon = pokedexService.getPokemonById(id: pokemon.id - 1)
        }
    }
}
