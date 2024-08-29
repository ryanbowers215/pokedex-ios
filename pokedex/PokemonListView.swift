//
//  PokemonListView.swift
//  pokedex
//
//  Created by Ryan Bowers on 4/25/24.
//

import SwiftUI

struct PokemonListView: View {
    let pokemonList = PokedexService.shared.pokemon
    var body: some View {
        NavigationStack{
            
            ZStack{
                LinearGradient(colors: [Color.maroon, Color.maroon], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                VStack{
                    
                    HStack{
                        Circle().fill(.brightblue).stroke(.black).frame(width: 80, height: 80)
                        
                        VStack{
                            HStack{
                                Circle().fill(.darkred).stroke(.black).frame(width: 20, height: 20)
                                Circle().fill(.yellow).stroke(.black).frame(width: 20, height: 20)
                                Circle().fill(.green).stroke(.black).frame(width: 20, height: 20)
                                
                            }
                            Spacer()
                        }
                        Spacer()
    
                        
                    }.frame(height: 80)
                    
                    Spacer()
                    
                    ZStack{
                LinearGradient(colors: [.silver, .silver], startPoint: .top, endPoint: .bottom)
                        VStack{
                            HStack{
                                Circle().fill(.darkred).stroke(.black).frame(width: 20, height: 20)
                                Circle().fill(.darkred).stroke(.black).frame(width: 20, height: 20)
                                
                            }
                            HStack{
                                ScrollView(showsIndicators: false){
                                    ForEach(pokemonList) { pokemon in
                                        NavigationLink{
                                            PokemonView(pokemon: PokemonViewModel(pokemon: pokemon))
                                        } label: {
                                            PokemonInListView(pokemon: pokemon)
                                        }
                                    }
                                }.background(.darkbrown)
                            }.frame(width: 300, height: 300)
                            
                            HStack{
                                Circle().fill(.darkred).stroke(.black).frame(width: 30, height: 30)
                                Spacer()
                            }.padding()
                        }.padding()
                    }.frame(width: 355, height: 355)
                    
                    Spacer()
                    
                    HStack{
                        Circle().fill(.darkgray).stroke(.black).frame(width: 50)
                        Rectangle().fill(.darkred).stroke(.black).frame(width: 80, height: 10)
                        Rectangle().fill(.brightblue).stroke(.black).frame(width: 80, height: 10)
                        
                        Spacer()
                    }.frame(height:50)
                    
                    HStack{
                      
                            HStack{
                                HStack{
                                    Circle().fill(.darkgray).stroke(.black).frame(width: 10)
                                    Spacer()
                                    Circle().fill(.darkgray).stroke(.black).frame(width: 10)
                                }.frame(width: 30)
                                Spacer()
                                VStack{
                                    Spacer()
                                    Rectangle().fill(.darkgreen).stroke(.black).frame(width: 160, height: 60)
                                }
                            }
                        
                    
                        
                        Image(systemName: "plus").resizable().frame(width: 150, height: 150).fontWeight(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/).foregroundColor(.darkgray)
                        
                    }.padding().frame(height: 150)
                }.padding()
            }
        }
    }
}

#Preview {
    PokemonListView()
}


