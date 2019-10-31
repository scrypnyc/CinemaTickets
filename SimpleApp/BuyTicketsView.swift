//
//  BuyTicketsView.swift
//  SimpleApp
//
//  Created by Alexander Skrypnyk on 31.10.2019.
//  Copyright © 2019 Alexander Skrypnyk. All rights reserved.
//

import SwiftUI

struct BuyTicketsView: View {
    
    let movie = Movie(name: "Django Unchained", imageName: "Django")
    
    var body: some View {
        GeometryReader { geo in
            VStack (spacing: 16) {
                HStack {
                    Text("Buy Tickets")
                        .font(.system(size: 20, weight: .semibold))
                }
                HStack (alignment: .top, spacing: 11) {
                    Image("Django")
                        .frame(width: 140, height: 200)
                        .cornerRadius(10)
//                    .shadow(radius: 10)
                    VStack (alignment: .leading, spacing: 8) {
                        Text("Django Unchained")
                            .font(.system(size: 18, weight: .heavy))
                        Text("Drama | Western")
                        HStack {
                            Button(action: {
                                
                            }, label: {
                                Text("NOV 11 Friday")
                                    .font(.system(size: 14))
                                    .padding(.horizontal)
                                    .padding(.vertical, 6)
                                    .border(Color.black)
                                    .foregroundColor(.black)
                            })
                            Button(action: {
                                
                            }, label: {
                                Text("22:30")
                                    .font(.system(size: 14))
                                    .padding(.horizontal)
                                    .padding(.vertical, 6)
                                    .border(Color.black)
                                    .foregroundColor(.black)
                            })
                        }
                    }.padding(.top, 15)
                }
                VStack (alignment: .leading) {
                    HStack {
                        Text("Select Date")
                        Spacer()
                    }.padding(.leading, 16)
                    
                    // Buttons
                    HStack (spacing: 15) {
                        ForEach(["09", "10", "11", "12", "13"], id: \.self) { day in
                            Button(action: {
                                            
                                }, label: {
                                    VStack (spacing: 8) {
                                        Text("NOV")
                                        Text(day)
                                    }
                                    
                                }).frame(width: (geo.size.width - 6 * 16) / 5)
                            }
                        }
                    }
                
            Spacer()
        }
    }
}

struct BuyTicketsPreview: PreviewProvider {
    static var previews: some View {
        BuyTicketsView()
        
        }
    }
}
