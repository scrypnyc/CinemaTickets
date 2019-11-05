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
    
    let topDays: [Day] = [
    .init(month: "NOV", day: "09", dayOfWeek: "FRIDAY"),
    .init(month: "NOV", day: "10", dayOfWeek: "SATURDAY"),
    .init(month: "NOV", day: "11", dayOfWeek: "SUNDAY"),
    .init(month: "NOV", day: "12", dayOfWeek: "MONDAY"),
    .init(month: "NOV", day: "13", dayOfWeek: "TUESDAY"),
    ]
    
    let middleDays: [Day] = [
    .init(month: "NOV", day: "14", dayOfWeek: "WEDNESDAY"),
    .init(month: "NOV", day: "15", dayOfWeek: "FRIDAY"),
    .init(month: "NOV", day: "16", dayOfWeek: "SATURDAY"),
    .init(month: "NOV", day: "17", dayOfWeek: "SUNDAY"),
    .init(month: "NOV", day: "18", dayOfWeek: "MONDAY"),
    ]
    
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
                                Text("NOV 11 SUNDAY")
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
                VStack (alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Select Date")
                        Spacer()
                    }.padding(.leading, 16)
                    
                    // Buttons
                    HStack (spacing: 16) {
                        ForEach(self.topDays) { day in
                            DayButton(day: day, size: geo.size)
                            }
                    }.padding(.horizontal, 16)
                    
                    HStack (spacing: 16) {
                        ForEach(self.middleDays) { day in
                            DayButton(day: day, size: geo.size)
                            }
                    }.padding(.horizontal, 16)
                }
                
                Spacer()
            }
        }
    }
}


struct DayButton: View {
    
    let day: Day
    let size: CGSize
    
    var body: some View {
        Button(action: {
                    
        }, label: {
            VStack (spacing: 8) {
                Text("NOV")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.gray)
                Text(day.day)
                    .font(.system(size: 18, weight: .bold))
                Text(day.dayOfWeek)
                    .font(.system(size: 7, weight: .bold))
            }.padding(.vertical, 8)
            
        }).foregroundColor(.black)
            .padding(.horizontal, 2)
            .frame(width: (size.width - 6 * 15) / 5)
            .border(Color.black)
    }
}


struct Day: Identifiable {
    
    let id = UUID()
    let month, day, dayOfWeek: String
    
}
    

struct BuyTicketsPreview: PreviewProvider {
    static var previews: some View {
        BuyTicketsView()
        
        }
    }

