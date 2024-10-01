import SwiftUI

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