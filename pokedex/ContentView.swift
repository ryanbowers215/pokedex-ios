//
//  ContentView.swift
//  pokedex
//
//  Created by Ryan Bowers on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    private var pokedexService = PokedexService.shared
    var body: some View {
        PokemonListView()
    }
}

#Preview {
    ContentView()
}
