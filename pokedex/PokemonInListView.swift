//
//  PokemonInListView.swift
//  pokedex
//
//  Created by Ryan Bowers on 8/29/24.
//

import SwiftUI

struct PokemonInListView: View {
    let pokemon: Pokemon
    var body: some View {
        
        ZStack{
            Color(.darkbrown)
            
            
            HStack{
                AsyncImage(url: pokemon.imageURL) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                .clipShape(.rect(cornerRadius: 25))
                
                Text("\(pokemon.name)").font(.custom("Pixeloid Mono", size: 15)).foregroundColor(.silver)
            }
        }.frame(width: 300, height: 100)
    }
}

#Preview {
    PokemonInListView(pokemon: PokedexService.shared.pokedex.pokemon[0])
}
