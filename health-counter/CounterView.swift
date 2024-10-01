import SwiftUI

struct CounterView: View {
    @State private var health1: Int
    @State private var health2: Int
    let startingHealth: Int
    let playerMode: PlayerMode
    
    init(startingHealth: Int, playerMode: PlayerMode) {
        self.startingHealth = startingHealth
        self.playerMode = playerMode
        _health1 = State(initialValue: startingHealth)
        _health2 = State(initialValue: startingHealth)
        print("CounterView initialized with playerMode: \(playerMode)")
    }
    
    var body: some View {
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height
            
            VStack {
                if playerMode == .single {
                    HealthCounter(health: $health1, color: .green, startingHealth: startingHealth)
                } else {
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
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color.black.opacity(0.05))
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            print("CounterView appeared with playerMode: \(playerMode)")
        }
    }
}