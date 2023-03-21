//
//  WidgetLayoutView.swift
//  
//
//  Created by MacBook Pro M1 on 2023/03/21.
//

import TokamakDOM
import Foundation


// MARK: - Bar chart
struct DummyData: Identifiable {
    var value: Int
    var id = UUID()
}


// MARK: - BarChartView
struct BarChartView: View {
    let foregroundColor: Color
    var data: [DummyData] = [
        DummyData(value: 10),
        DummyData(value: 12),
        DummyData(value: 9),
        DummyData(value: 11),
        DummyData(value: 13),
        DummyData(value: 8),
        DummyData(value: 6),
        DummyData(value: 14)
    ]
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            ForEach(data) { datum in
                RoundedRectangle(cornerRadius: 2)
                    .foregroundColor(foregroundColor)
                    .frame(width: 8, height: CGFloat(4 * datum.value))
            }
        }
    }
}


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
                                    .font(.callout)
                                    .fontWeight(.regular)
                                    .foregroundColor(appearance.foregroundColor)
                                    .padding(4)
                                
                                Spacer()
                            }
                            
                            BarChartView(foregroundColor: accentColor)
                                .padding(.horizontal, 10)
                        }
                        .frame(width: 140, height: 90)
                        .padding(.horizontal)
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
