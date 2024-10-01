//
//  ContentView.swift
//  health-counter
//
//  Created by Domagoj Satrapa on 01.10.2024..
//

import SwiftUI

struct HealthCounter: View {
    @Binding var health: Int
    let color: Color
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(color.opacity(0.2))
                    .frame(width: 120, height: 120)
                
                Circle()
                    .stroke(color, lineWidth: 4)
                    .frame(width: 120, height: 120)
                
                Text("\(health)")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(color)
            }
            .onTapGesture(count: 2) {
                health = 100
            }
            
            HStack(spacing: 15) {
                Button("-10") {
                    health = max(0, health - 10)
                }
                .buttonStyle(CircularButton(color: .red))
                
                Button("-") {
                    if health > 0 {
                        health -= 1
                    }
                }
                .buttonStyle(CircularButton(color: .red))
                
                Button("+") {
                    health += 1
                }
                .buttonStyle(CircularButton(color: .blue))
                
                Button("+10") {
                    health += 10
                }
                .buttonStyle(CircularButton(color: .blue))
            }
        }
    }
}

struct CircularButton: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.footnote)
            .fontWeight(.bold)
            .frame(width: 50, height: 50)
            .background(color)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}

struct ContentView: View {
    @State private var health1 = 100
    @State private var health2 = 100
    
    var body: some View {
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height
            
            Group {
                if isLandscape {
                    HStack(spacing: 80) {
                        HealthCounter(health: $health1, color: .green)
                        HealthCounter(health: $health2, color: .green)
                    }
                } else {
                    VStack(spacing: 60) {
                        HealthCounter(health: $health1, color: .green)
                        HealthCounter(health: $health2, color: .green)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color.black.opacity(0.05))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
