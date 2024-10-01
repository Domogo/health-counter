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
    let startingHealth: Int
    
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
                health = startingHealth
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

struct CounterView: View {
    @State private var health1: Int
    @State private var health2: Int
    let startingHealth: Int
    
    init(startingHealth: Int) {
        self.startingHealth = startingHealth
        _health1 = State(initialValue: startingHealth)
        _health2 = State(initialValue: startingHealth)
    }
    
    var body: some View {
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height
            
            Group {
                if isLandscape {
                    HStack(spacing: 80) {
                        HealthCounter(health: $health1, color: .green, startingHealth: startingHealth)
                        HealthCounter(health: $health2, color: .green, startingHealth: startingHealth)
                    }
                } else {
                    VStack(spacing: 60) {
                        HealthCounter(health: $health1, color: .green, startingHealth: startingHealth)
                        HealthCounter(health: $health2, color: .green, startingHealth: startingHealth)
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

struct ContentView: View {
    @State private var startingHealth = 100
    @State private var navigateToCounter = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Select Starting Health")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                ForEach([50, 100, 200], id: \.self) { health in
                    Button(action: {
                        startingHealth = health
                        navigateToCounter = true
                    }) {
                        Text("\(health)")
                            .font(.title)
                            .fontWeight(.semibold)
                            .frame(width: 200, height: 60)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationBarTitle("Health Counter", displayMode: .inline)
            .background(
                NavigationLink(
                    destination: CounterView(startingHealth: startingHealth),
                    isActive: $navigateToCounter,
                    label: { EmptyView() }
                )
            )
        }
    }
}

#Preview {
    ContentView()
}
