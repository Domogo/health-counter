import SwiftUI

enum PlayerMode: String, CaseIterable {
    case single = "Single Player"
    case two = "Two Players"
}

struct PlayerModeView: View {
    @Binding var selectedMode: PlayerMode
    var onModeSelected: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Select Player Mode")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            ForEach(PlayerMode.allCases, id: \.self) { mode in
                Button(action: {
                    selectedMode = mode
                    onModeSelected()
                }) {
                    Text(mode.rawValue)
                        .font(.title)
                        .fontWeight(.semibold)
                        .frame(width: 200, height: 60)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}