//
//  ContentView.swift
//  
//
//  Created by MacBook Pro M1 on 2023/03/20.
//

import Foundation
import TokamakDOM


// MARK: - ContentView
struct ContentView: View {
    @State var accentColor: Color = .blue
    @State var colorCode: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Mille")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding()
                
                Spacer()
                    .frame(width: 200)
            }
            
            HStack {
                Circle()
                    .foregroundColor(accentColor)
                    .frame(width: 32, height: 32)
                
                TextField("Hex color code", text: $colorCode, onCommit:  {
                    accentColor = Color(UInt(colorCode, radix: 16) ?? 0x000000)
                })
            }
            .padding(.vertical, 10)
            
            VStack {
                VStack {
                    Text("Light appearance")
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding()
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 270, height: 220)
                            .foregroundColor(.white)
                        
                        WidgetLayoutView(
                            backgroundColor: accentColor.opacity(0.1),
                            secondaryColor: accentColor.opacity(0.2),
                            primaryColor: .white,
                            accentColor: accentColor,
                            appearance: .light
                        )
                    }
                }
                .padding(.vertical, 20)
                
                VStack {
                    Text("Dark appearance")
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding()
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 270, height: 220)
                            .foregroundColor(.black)
                        
                        WidgetLayoutView(
                            backgroundColor: .black,
                            secondaryColor: accentColor.opacity(0.2),
                            primaryColor: accentColor.opacity(0.3),
                            accentColor: accentColor,
                            appearance: .dark
                        )
                    }
                }
                .padding(.vertical, 20)
            }
            .padding()
            
            HStack(spacing: 5) {
                Text("Powered by")
                
                Link(destination: URL(string: "https://github.com/TokamakUI/Tokamak")!) {
                    Text("Tokamak")
                        .foregroundColor(accentColor)
                }
                
                Text("and")
                
                Link(destination: URL(string: "https://github.com/swiftwasm")!) {
                    Text("SwiftWasm")
                        .foregroundColor(accentColor)
                }
            }
            .font(.caption)
            .foregroundColor(.secondary)
            .padding(.vertical, 10)
        }
    }
}
