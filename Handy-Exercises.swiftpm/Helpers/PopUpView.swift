import Foundation
import SwiftUI


struct PopUpView: View {
    @State private var isRotating = false
    @State var exercise: String
    @State var intro: String
    @State var bottomText: String
    let Gradient = LinearGradient(colors: [Color.orange, Color.green, Color.green], startPoint: .top, endPoint: .bottom)
    
    let action: () -> Void
    func getScreenBounds() -> CGRect{
        return UIScreen.main.bounds
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                CustomText(text: exercise, textSize: 40)
                    .offset(x: 20)
                
                Spacer()
                Button {
                    isRotating.toggle()
                    action()
                } label: {
                    Image(systemName: "x.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .font(Font.title.weight(.bold))
                        .foregroundColor(.black)
                        .rotationEffect(isRotating ? .degrees(360) : .degrees(0))
                    
                }
            } .scaledToFit()
                .frame(width: 550)
            
            HStack {
                CustomText(text: intro, textSize: 30)
                    .padding([.leading, .trailing], -30)
            }
            HStack() {
                CustomText(text: bottomText, textSize: 35).frame(width: 360).multilineTextAlignment(.center).padding(.horizontal, 20)
            }
        }.padding(20)
            .background(Colors.background)
            .cornerRadius(10)
            .frame(width: 500, height: 500)
    }
}

