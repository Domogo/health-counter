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