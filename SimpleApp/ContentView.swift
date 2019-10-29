//
//  ContentView.swift
//  SimpleApp
//
//  Created by Alexander Skrypnyk on 10/25/19.
//  Copyright © 2019 Alexander Skrypnyk. All rights reserved.
//

import SwiftUI

struct Movie: Identifiable, Hashable {
    let id = UUID.init()
    let name, imageName: String
}




struct ContentView: View {
    
    let movies: [[Movie]] = [
        [.init(name: "Django", imageName: "Django"),
         .init(name: "Fight Club", imageName: "Club")],
        [.init(name: "Call Me Your Name", imageName: "CallMe"),
         .init(name: "Blade Runner", imageName: "Blade")],
        [.init(name: "Django", imageName: "Django"),
         .init(name: "Fight Club", imageName: "Club")],
        [.init(name: "Call Me Your Name", imageName: "CallMe"),
         .init(name: "Blade Runner", imageName: "Blade")]
    ]
    
    
    var body: some View {
        ScrollView {
            VStack  (spacing: 15){
                Text("CinemaTickets")
                    .font(.system(size: 23, weight: .bold))
                ForEach(movies, id: \.self) { row in
                    HStack {
                        ForEach (row) { movie in
                            VStack (spacing: 4) {
                                Image(movie.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 170, height: 250)
                                    .clipped()
                                    .cornerRadius(10)
                                Text(movie.name)
                                Button(action: {
                                    
                                }) {
                                    Text("Buy Tickets")
                                        .padding(.horizontal, 40)
                                        .padding(.vertical, 6)
                                        .background(Color.red)
                                        .foregroundColor(Color.white)
                                    .cornerRadius(10)
                                }
                            }
                        }
                    }

                }
                Spacer()
            }
        }
        .padding(.all, 15)
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
