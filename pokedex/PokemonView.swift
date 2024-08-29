//
//  PokemonView.swift
//  pokedex
//
//  Created by Ryan Bowers on 4/25/24.
//

import SwiftUI

struct PokemonView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var pokemon: PokemonViewModel
    var body: some View {
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
                            Button {pokemon.prevPoke()} label : {
                                Circle().fill(.darkred).stroke(.black).frame(width: 20, height: 20)
                            }
                            Button {pokemon.nextPoke()} label : {
                                Circle().fill(.darkred).stroke(.black).frame(width: 20, height: 20)
                            }
                            
                        }
                        VStack{
                            
                            HStack{
                                Text(pokemon.pokemon.name).bold().font(.custom("Pixeloid Mono", size: 30))
                                Spacer()
                                Text("#\(pokemon.pokemon.num)").bold()
                            }.padding().foregroundColor(.silver).font(.custom("Pixeloid Mono", size: 20))
                            
                            Spacer()
                            
                            HStack{
                                AsyncImage(url: pokemon.pokemon.imageURL) { image in
                                    image.resizable().frame(width: 150, height: 150)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                            
                            HStack{
                                HStack{
                                    VStack{
                                        Text(" Height: \(pokemon.pokemon.height)").bold().font(.custom("Pixeloid Mono", size: 12))
                                        Text(" Weight: \(pokemon.pokemon.weight)").bold().font(.custom("Pixeloid Mono", size: 12))
                                    }
                                    Spacer()
                                    Text(" Types: \(pokemon.typeString)").bold().font(.custom("Pixeloid Mono", size: 12))
                                }.foregroundColor(.silver)
                            }.padding()
                            
                        }.frame(width: 300, height: 300).background(.darkbrown)
                        
                        HStack{
                            Button(action: {presentationMode.wrappedValue.dismiss()}) {
                                Circle().fill(.darkred).stroke(.black).frame(width: 30, height: 30)
                            }
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
        }.navigationBarBackButtonHidden(true)

    }
}

#Preview {
    let poke = PokemonViewModel(pokemon: PokedexService.shared.pokemon[149])
    return PokemonView(pokemon: poke)
}
