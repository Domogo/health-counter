import SwiftUI

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