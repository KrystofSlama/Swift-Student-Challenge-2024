import Foundation
import SwiftUI

struct About: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Background()
                .ignoresSafeArea()
            VStack{
                //Back Button and header
                HStack {
                    Button {    
                        dismiss()
                    }label: {
                        Image(systemName: "arrowshape.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .foregroundStyle(.black)
                    } .padding([.leading, .top], 30)
                    Spacer()
                    
                    CustomText(text: "About HANDY", textSize: 40)
                        .offset(x: -40)
                        .padding(.top, 20)
                    Spacer()
                }
                Spacer()
                //About
                HStack {
                    Image(systemName: "hand.wave")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundColor(.black)
                        .opacity(0.9)
                        .offset()
                        .padding(20)
                    CustomText(text: "Hi, I am Handy", textSize: 34)
                        .offset(y: 30)
                    Spacer()
                } .padding(.bottom, -30)
                
                CustomText(text: "I am here to help you through your daily life with ease and confidence. Living with hand tremors can be challenging, but together, we can make it easier. Handy is more than just an application; it's a companion dedicated to enhancing your quality of life.", textSize: 32)
                    .padding([.leading, .trailing], 35)
                    .padding(.bottom)
                CustomText(text: "Before incorporating Handy into your daily routine, it's essential to consult with your healthcare professional, particularly your treating physician or neurologist. While Handy is designed to be a helpful tool for managing hand tremors through targeted exercises, it's crucial to ensure that its use aligns with your individual health needs and treatment plan.", textSize: 32)
                    .padding([.leading, .trailing], 35)
                Spacer()
            }     
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    About()
}
