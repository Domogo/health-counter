//
//  ContentView.swift
//  health-counter
//
//  Created by Domagoj Satrapa on 01.10.2024..
//

import SwiftUI

struct ContentView: View {
    @State private var startingHealth = 100
    @State private var navigateToCounter = false
    
    var body: some View {
        NavigationView {
            StartingHealthView(startingHealth: $startingHealth, navigateToCounter: $navigateToCounter)
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
