//
//  ContentView.swift
//  
//
//  Created by MacBook Pro M1 on 2023/03/20.
//

import Foundation
import TokamakDOM


// MARK: - WidgetLayoutView
struct WidgetLayoutView: View {
    let backgroundColor: Color
    let secondaryColor: Color
    let primaryColor: Color
    let accentColor: Color
    let appearance: Appearance
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Background
            Rectangle()
                .frame(width: 270, height: 220)
                .foregroundColor(backgroundColor)
            
            HStack {
                // Navigation
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 80, height: 200)
                        .foregroundColor(secondaryColor)
                        .padding(4)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Sales")
                            .font(.caption)
                            .foregroundColor(appearance.foregroundColor)
                        
                        Text("Card")
                            .font(.caption)
                            .foregroundColor(appearance.foregroundColor)
                        
                        Text("Customer")
                            .font(.caption)
                            .foregroundColor(appearance.foregroundColor)
                    }
                }
                
                VStack {
                    HStack {
                        Text("Dashboard")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(appearance.foregroundColor)
                        Spacer()
                    }
                    
                    // Widget
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 150, height: 100)
                            .foregroundColor(primaryColor)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Bar Chart")
                                    .font(.body)
                                    .fontWeight(.regular)
                                    .foregroundColor(appearance.foregroundColor)
                                    .padding(4)
                                
                                Spacer()
                            }
                            
                            Spacer()
                                .frame(height: 60)
                        }
                        .frame(width: 140, height: 90)
                    }
                    
                    Spacer()
                        .frame(height: 50)
                }
                
                Spacer()
                    .frame(width: 16)
            }
        }
    }
}

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
                .padding(.horizontal, 30)
                
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
                .padding(.horizontal, 30)
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
