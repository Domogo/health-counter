//
//  ContentView.swift
//  health-counter
//
//  Created by Domagoj Satrapa on 01.10.2024..
//

import SwiftUI

struct ContentView: View {
    @State private var playerMode: PlayerMode = .single
    @State private var startingHealth = 100
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            PlayerModeView(selectedMode: $playerMode) {
                navigationPath.append("healthSelection")
            }
            .navigationDestination(for: String.self) { destination in
                switch destination {
                case "healthSelection":
                    StartingHealthView(startingHealth: $startingHealth, playerMode: playerMode) { health, mode in
                        startingHealth = health
                        playerMode = mode
                        navigationPath.append("counter")
                    }
                case "counter":
                    CounterView(startingHealth: startingHealth, playerMode: playerMode)
                default:
                    EmptyView()
                }
            }
            .navigationTitle("Health Counter")
        }
    }
}

#Preview {
    ContentView()
}
