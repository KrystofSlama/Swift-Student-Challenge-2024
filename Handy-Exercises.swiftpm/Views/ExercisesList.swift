import Foundation
import SwiftUI

struct ExercisesList: View {
    @Environment(\.dismiss) private var dismiss
    //PopUp views
    @State var PopUpIntro = true
    @State var PopUpFirst = false
    @State var PopUpSecond = false
    @State var PopUpThird = false
    @State var PopUpFour = false
    @State var PopUpFive = false
    @State var PopUpSix = false

    var body: some View {
        ZStack {
            ZStack {
                Background()
                    .ignoresSafeArea()
                VStack {
                     //Back button and Header
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
                        CustomText(text: "Your Exercises", textSize: 40)
                            .padding(.top, 20)
                            .offset(x: -50)
                        Spacer()
                    }
                    //Shows exercises
                    ScrollView {
                        VStack {
                            //First line
                            HStack {
                                Button {
                                    PopUpFirst.toggle()
                                } label: {
                                    ZStack {
                                        Rectangles()
                                            .padding([.trailing, .top, .leading], 40)
                                        VStack {
                                            Text("Rotating")
                                                .foregroundStyle(.black)
                                                .font(.title)
                                                .offset(y: 40)
                                            Text("a wrist")
                                                .foregroundStyle(.black)
                                                .font(.title)
                                                .offset(y: 35)
                                            Image("Rotating")
                                                .resizable()
                                                .opacity(0.8)
                                                .scaledToFit() 
                                                .rotationEffect(.degrees(-30))
                                                .frame(width: 130)
                                                .offset(y: 20)
                                        }
                                    }
                                }
                                
                                Button {
                                    PopUpSecond.toggle()
                                } label: {
                                    ZStack {
                                        Rectangles()
                                            .padding([.trailing, .top, .leading], 40)
                                        VStack {
                                            Text("Finger")
                                                .foregroundStyle(.black)
                                                .font(.title)
                                                .padding(.bottom, -30)
                                            Text("tap")
                                                .foregroundStyle(.black)
                                                .font(.title)
                                                .padding(.bottom, -30)
                                                .offset(y: 15)
                                            Image("Tap")
                                                .resizable()
                                                .scaledToFit() 
                                                .frame(width: 120)
                                                .offset(y: 35)
                                        }
                                    }
                                }
                                Button { 
                                    PopUpThird.toggle()
                                } label: {
                                    ZStack {
                                        Rectangles()
                                            .padding([.trailing, .top, .leading], 40)
                                        VStack {
                                            Text("Squeezing")
                                                .foregroundStyle(.black)
                                                .font(.title)
                                                .padding(.bottom, -15)
                                            Text("a ball")
                                                .foregroundStyle(.black)
                                                .font(.title)
                                                .padding(.bottom, -25)
                                            Image("Squeezing")
                                                .resizable()
                                                .scaledToFit() 
                                                .frame(width: 100)
                                                .offset(y: 25)
                                        }
                                    }
                                }
                            } .padding(.bottom, 20)
                            //Second line
                            HStack {
                                Button { 
                                    PopUpFour.toggle()
                                } label: {
                                    ZStack {
                                        Rectangles()
                                            .padding([.trailing, .top, .leading], 40)
                                        VStack {
                                            Text("Bending")
                                                .foregroundStyle(.black)
                                                .font(.title)
                                                .padding(.bottom, -15)
                                            Text("fingers")
                                                .foregroundStyle(.black)
                                                .font(.title)
                                                .padding(.bottom, -25)
                                           
                                        }
                                    }
                                }
                                Button { 
                                    PopUpFive.toggle()
                                } label: {
                                    ZStack {
                                        Rectangles()
                                            .padding([.trailing, .top, .leading], 40)
                                        VStack {
                                            Text("Wrist")
                                                .foregroundStyle(.black)
                                                .font(.title)
                                                .padding(.bottom, -15)
                                            Text("flexion")
                                                .foregroundStyle(.black)
                                                .font(.title)
                                                .padding(.bottom, -25)
                                            
                                        }
                                    }
                                }
                                Button { 
                                    PopUpSix.toggle()
                                } label: {
                                    ZStack {
                                        Rectangles()
                                            .padding([.trailing, .top, .leading], 40)
                                        VStack {
                                            Text("Thumb")
                                                .foregroundStyle(.black)
                                                .font(.title)
                                                .padding(.bottom, -15)
                                            Text("bend")
                                                .foregroundStyle(.black)
                                                .font(.title)
                                                .padding(.bottom, -25)
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            // Overlays
            .overlay(
                PopUpView(exercise: "Before exercises", intro: "Before u begin your exercises try to relax. Relaxation techniques such as meditation, gentle yoga, and engaging in mindful activities can help reduce stress and positively impact lowering tremors.", bottomText: "Let's do this", action: {PopUpIntro = false})
                    .opacity((PopUpIntro) ? 1 : 0)
                    .animation(.easeInOut(duration: 0.4), value: PopUpIntro)
                    .shadow(color: .black, radius: 10)
                )
            .overlay(
                PopUpView(exercise: "First exercise", intro: "In this exercise we will warm up a bit. Start by interlacing your fingers and swirling. Do this for at least 10 seconds. Then relax and repeat 3 times.", bottomText: "Let's do this", action: {PopUpFirst = false})
                .opacity((PopUpFirst) ? 1 : 0)
                .animation(.easeInOut(duration: 0.4), value: PopUpFirst)
                .shadow(color: .black, radius: 10)
            )
            
            .overlay(
                PopUpView(exercise: "Second exercise", intro: "In this exercise we are going to tap our fingers. Start by tapping your index finger to the top of your thumb on both hands. Next, tap your middle finger to the top of your thumb on both hands. Then do your ring finger and your pinky in the same formation and finish by reversing the motion on both hands. Reapet 3 times and each tmie faster", bottomText: "Let's do this", action: {PopUpSecond = false})
                .opacity((PopUpSecond) ? 1 : 0)
                .animation(.easeInOut(duration: 0.4), value: PopUpSecond)
                .shadow(color: .black, radius: 10)
            )
            
            .overlay(
                PopUpView(exercise: "Third exercise", intro: "For this exercise take a tiny rubber ball and place the ball in the palm of your hand and squash your fingers around it as tightly as possible. Hold this position for five seconds. Take relax and repeat 10 times. If u dont have a ball, u can squeeze your fist.", bottomText: "Let's do this", action: {PopUpThird = false})
                .opacity((PopUpThird) ? 1 : 0)
                .animation(.easeInOut(duration: 0.4), value: PopUpThird)
                .shadow(color: .black, radius: 10)
            )
            .overlay(
                PopUpView(exercise: "Fourth exercise", intro: "In this exercise put your palm on the table or on any flat surface and simply bend your fingers until you can feel the stretch. You can do one after one, or all at once", bottomText: "Let's do this", action: {PopUpFour = false})
                    .opacity((PopUpFour) ? 1 : 0)
                    .animation(.easeInOut(duration: 0.4), value: PopUpFour)
                    .shadow(color: .black, radius: 10)
            )
            .overlay(
                PopUpView(exercise: "Fifth exercise", intro: "In this exercise put your wrist on the edge of a table, with only the wrist hanging outside. And bend your wrist up and down repeatedly.", bottomText: "Let's do this", action: {PopUpFive = false})
                    .opacity((PopUpFive) ? 1 : 0)
                    .animation(.easeInOut(duration: 0.4), value: PopUpFive)
                    .shadow(color: .black, radius: 10)
            )
            .overlay(
                PopUpView(exercise: "Sixth exercise", intro: "n the thumb bend exercise, you simply bend your thumb across your palm to reach the bottom of your little finger. Hold the position for 30 to 60 secs and repeat four times on both hands.", bottomText: "Let's do this", action: {PopUpSix = false})
                    .opacity((PopUpSix) ? 1 : 0)
                    .animation(.easeInOut(duration: 0.4), value: PopUpSix)
                    .shadow(color: .black, radius: 10)
            )
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    ExercisesList()
}
