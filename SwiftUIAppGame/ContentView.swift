//
//  ContentView.swift
//  SwiftUIAppGame
//
//  Created by Nadia Mettioui on 16/06/2020.
//  Copyright © 2020 Nadia Mettioui. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var credits = 1000
    private var symbols = ["framboise","fraise","cerise"]
    @State private var numbers = [0,1,2]
    private var betAmount = 5
    
    var body: some View {
        ZStack {
            // BGround
            Rectangle()
                .foregroundColor(Color(red: 243/255, green: 156/255, blue: 18/255))
                .edgesIgnoringSafeArea(.all)//tout l ecran
            Rectangle()
                .foregroundColor(Color(red: 248/255, green: 196/255, blue: 111/255))
                .rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all)
            
            // 245, 203, 167 229, 229, 102 243, 156, 18 / 248, 196, 113
            
            VStack {
                
                Spacer()
                
                HStack{
                    Image(systemName: "star.fill")
                        .shadow(color: .black, radius: 1, x: 2, y: 2)
                        .foregroundColor(.yellow)
                    //   .frame( alignment: .top)
                    
                    Text("Mon SlotGame")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .shadow(color: .black, radius: 1, x: 2, y: 2)
                }.scaleEffect(1)
                    .padding()
                
                Spacer()
                
                Text("Credits:  " + String(self.credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    
                    .cornerRadius(20)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Image(symbols[numbers[0]]).resizable().aspectRatio(1,contentMode: .fit).background(Color.white.opacity(0.5)).cornerRadius(20)
                    Image(symbols[numbers[1]]).resizable().aspectRatio(1,contentMode: .fit).background(Color.white.opacity(0.5)).cornerRadius(20)
                    
                    Image(symbols[numbers[2]]).resizable().aspectRatio(1,contentMode: .fit).background(Color.white.opacity(0.5)).cornerRadius(20)
                    Spacer()
                    
                }
                
                Spacer()
                // Button
                Button(action:  {
                    //Changer l image aleatoirement
                    self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                    self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                    self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                    // checking winning
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        //OK
                        self.credits += self.betAmount * 10
                        print("gagne \(self.credits)")
                    }
                    else {
                        self.credits -= self.betAmount
                        print("perdu \(self.credits)")
                    }
                }) {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all,10)
                        .padding([.leading, .trailing])
                        .background(Color.red)
                        .cornerRadius(20)
                    
                }
                Spacer()
                
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
