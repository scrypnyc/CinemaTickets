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
    
    let lowDays: [Day] = [
    .init(month: "NOV", day: "19", dayOfWeek: "TUESDAY"),
    .init(month: "NOV", day: "20", dayOfWeek: "WEDNESDAY"),
    ]
    
    
    var body: some View {
        GeometryReader { geo in
            VStack (spacing: 16) {
                HStack {
                    Text("Buy Tickets")
                        .font(.system(size: 20, weight: .semibold))
                }.padding(.top, 12)
                
                HStack (alignment: .top, spacing: 34) {
                    Image("Django")
                        .resizable()
                        .frame(width: 100, height: 140)
                        .cornerRadius(12)
                    VStack (alignment: .leading, spacing: 8) {
                        Text("Django Unchained")
                            .font(.system(size: 18, weight: .heavy))
                        Text("Drama | Western")
                        
                        HStack {
                            Button(action: {
                                
                            }, label: {
                                Text("NOV 11 SUNDAY")
                                    .font(.system(size: 12))
                                    .padding(.horizontal)
                                    .padding(.vertical, 6)
                                    .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.gray, lineWidth: 1)
                                    )
                                    .foregroundColor(.black)
                            })
                            Button(action: {
                                
                            }, label: {
                                Text("22:30")
                                    .font(.system(size: 12))
                                    .padding(.horizontal)
                                    .padding(.vertical, 6)
                                    .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.gray, lineWidth: 1)
                                    )
                                    .foregroundColor(.black)
                            })
                        }
                    }.padding(.top, 14)
                }
                VStack (alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Select Date")
                        .font(.system(size: 16))
                        Spacer()
                    }.padding(.leading, 27)
                    
                    // Buttons
                    HStack (spacing: 16) {
                        ForEach(self.topDays) { day in
                            DayButton(day: day, size: geo.size,
                                      selectedDay: self.selectedDay,
                                      tapHandler: { (d) in
                                self.selectedDay = d
                            })
                        }
                    }.padding(.horizontal, 27)
                    
                    HStack (spacing: 16) {
                        ForEach(self.middleDays) { day in
                            DayButton(day: day, size: geo.size,
                                      selectedDay: self.selectedDay,
                                      tapHandler: { (d) in
                                self.selectedDay = d
                            })
                        }
                    }.padding(.horizontal, 27)
                    
                    HStack (spacing: 16) {
                        ForEach(self.lowDays) { day in
                            DayButton(day: day, size: geo.size,
                                      selectedDay: self.selectedDay,
                                      tapHandler: { (d) in
                                self.selectedDay = d
                            })
                        }
                    }.padding(.horizontal, 27)
                }
                
                Spacer()
            }
        }
    }
    
    @State var selectedDay: Day?
}


struct DayButton: View {
    
    let day: Day
    let size: CGSize
    
    var selectedDay: Day?
    
    var tapHandler: ((Day) -> ())?
    
    var body: some View {
        Button(action: {
            self.tapHandler?(self.day)
                    
        }, label: {
            VStack (spacing: 8) {
                Text("NOV")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor((self.selectedDay?.day != day.day) ? Color.gray : Color.white)
                Text(day.day)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor((self.selectedDay?.day != day.day) ? Color.black : Color.white)
                Text(day.dayOfWeek)
                    .font(.system(size: 7, weight: .bold))
                    .foregroundColor((self.selectedDay?.day != day.day) ? Color.black : Color.white)
            }.padding(.vertical, 5)
            
        }).foregroundColor(.black)
            .padding(.horizontal, 2)
            .frame(width: (size.width - 6 * 16) / 5)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
        )
            .background((self.selectedDay?.day == day.day) ? Color.red : Color.white)
        .cornerRadius(12)
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

