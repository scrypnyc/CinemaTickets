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
            ScrollView {
                VStack  (spacing: 45) {
                    Text("CinemaTickets")
                        .font(.system(size: 23, weight: .semibold))
                    ForEach(self.movies, id: \.self) { row in
                        HStack (spacing: 15) {
                            ForEach (row) { movie in
                                MovieView(movie: movie, size: geo.size)
                            }
                        }
                    }
                    Spacer()
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
                .shadow(radius: 10)
            Text(movie.name)
                .font(.system(size: 14, weight: .bold))
            Button(action: {
                                                   
            }) {
                Text("Buy Tickets")
                    .padding(.horizontal, 40)
                    .padding(.vertical, 6)
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
