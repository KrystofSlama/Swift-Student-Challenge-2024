import Foundation
import SwiftUI

struct Buttons: View {
    
    var body: some View {
        
        Rectangle()
            .foregroundColor(Colors.button)
            .frame(width: 190, height: 60)
            .cornerRadius(20)
            .shadow(color: Colors.shadowButton, radius: 5, x: 10, y: 8)
            
    }
}

#Preview {
    Buttons()
}


