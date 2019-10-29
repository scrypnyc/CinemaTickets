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

let movies: [[Movie]] = [
    [.init(name: "Django", imageName: "Django"),
     .init(name: "Club", imageName: "Club")],
    [.init(name: "Godfather", imageName: "Godfather"),
     .init(name: "CallMe", imageName: "Godfather")]
]


struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(movies, id: \.self) { row in
                HStack {
                    ForEach (row) { movie in
                        VStack {
                            Image(movie.imageName)
                        }
                        Text(movie.name)
                    }
                }

            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
