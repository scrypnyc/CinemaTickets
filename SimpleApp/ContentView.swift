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
        [.init(name: "Django Unchained", imageName: "Django"),
         .init(name: "Dunkirk", imageName: "Dunkirk")],
        [.init(name: "John Wick", imageName: "John"),
         .init(name: "Moonlight", imageName: "Moonlight")],
        [.init(name: "Killing Them Softly", imageName: "KillingThemSoftly"),
         .init(name: "Call Me Your Name", imageName: "CallMe")],
        [.init(name: "Fight Club", imageName: "Club"),
         .init(name: "Blade Runner", imageName: "Blade")]
    ]
    
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Text("CinemaTickets")
                    .font(.system(size: 20, weight: .semibold))
                }
                ScrollView {
                    VStack  (spacing: 45) {
                        ForEach(self.movies, id: \.self) { row in
                            HStack (spacing: 14) {
                                ForEach (row) { movie in
                                    MovieView(movie: movie, size: geo.size)
                                }
                            }
                        }
                        Spacer()
                    }.padding(.horizontal, 13)
                }
            }
        }
    }
}

struct MovieView: View {
    
    let movie: Movie
    let size: CGSize
    
    var body: some View {
        VStack (spacing: 8) {
            Image(movie.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: (size.width - 48) / 2, height: 250)
                .clipped()
                .cornerRadius(10)
//                .shadow(radius: 10)
            Text(movie.name)
                .font(.system(size: 14, weight: .bold))
            Button(action: {
                                                   
            }) {
                Text("Buy Tickets")
                    .padding(.horizontal, 39)
                    .padding(.vertical, 6)
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
//                    .shadow(radius: 10)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
