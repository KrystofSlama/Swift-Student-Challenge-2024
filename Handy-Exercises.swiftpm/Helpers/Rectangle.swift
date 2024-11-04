import SwiftUI

struct Rectangles: View {
    
    var body: some View {
        
        Rectangle()
            .foregroundColor(Colors.rectangle)
            .frame(width: 200, height: 200)
            .cornerRadius(20)
            .shadow(color: .black, radius: 10, x: 8, y: 8)
    }
}

#Preview {
    Rectangles()
}

