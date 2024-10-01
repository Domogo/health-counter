import SwiftUI

struct StartingHealthView: View {
    @Binding var startingHealth: Int
    let playerMode: PlayerMode
    var onHealthSelected: (Int, PlayerMode) -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Select Starting Health")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            ForEach([50, 100, 200], id: \.self) { health in
                Button(action: {
                    startingHealth = health
                    onHealthSelected(health, playerMode)
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
    }
}