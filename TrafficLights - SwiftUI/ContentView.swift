//
//  ContentView.swift
//  TrafficLights - SwiftUI
//
//  Created by Kovalyov Dmitry on 01.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    private let maxOpacity = 1.0
    private let minOpacity = 0.5
    
    @State private var redCircle = Circle()
    @State private var yellowCircle = Circle()
    @State private var greenCircle = Circle()
    
    @State private var colorOfLight: Color = .green
    
    @State private var redOpacity = 0.5
    @State private var yellowOpacity = 0.5
    @State private var greenOpacity = 0.5
    
    
    
    var body: some View {
        VStack {
            VStack {
                redCircle
                    .padding()
                    .foregroundColor(.red)
                    .frame(width: 150, height: 150)
                    .opacity(redOpacity)
                yellowCircle
                    .padding()
                    .foregroundColor(.yellow)
                    .frame(width: 150, height: 150)
                    .opacity(yellowOpacity)
                greenCircle
                    .padding()
                    .foregroundColor(.green)
                    .frame(width: 150, height: 150)
                    .opacity(greenOpacity)
            }
            .border(.gray, width: 3.0)
            
            Spacer()
            
            Button(action: {
                
                
                if colorOfLight == .red {
                    colorOfLight = .yellow
                    redOpacity = minOpacity
                    yellowOpacity = maxOpacity
                    greenOpacity = minOpacity
                }
                else if colorOfLight == .yellow {
                    colorOfLight = .green
                    redOpacity = minOpacity
                    yellowOpacity = minOpacity
                    greenOpacity = maxOpacity
                }
                else if colorOfLight == .green {
                    colorOfLight = .red
                    redOpacity = maxOpacity
                    yellowOpacity = minOpacity
                    greenOpacity = minOpacity
                }
            },
                   label: {
                Image(systemName: "light.max")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .foregroundColor(colorOfLight)
                    .padding()
            })
            Spacer()
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 mini")
            .padding()
        
    }
}

