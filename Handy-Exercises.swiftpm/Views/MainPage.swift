import Foundation
import SwiftUI

struct MainPage: View {
    @StateObject private var motionDetector = MotionDetector(updateInterval: 0.01)
    
    var body: some View {
        
            ZStack {
                // Background and Logo
                Background()
                    .ignoresSafeArea()
                
                Image(systemName: "hands.clap")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75)
                    .foregroundColor(.black)
                    .opacity(0.9)
                    .offset(x: -200, y: -350)
                    .scaleEffect(x: -1, y: 1)
                Image(systemName: "hand.point.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75)
                    .foregroundColor(.black)
                    .opacity(0.9)
                    .offset(x: -220, y: -300)
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 100)
                    .offset(y: -290)
                Text("Your partner for stable hands")
                    .font(.title2)
                    .foregroundStyle(.black)
                    .offset(x: -35, y: -251)
                //Buttons
                VStack {
                    NavigationLink {
                        StableHands()
                            .environmentObject(motionDetector)
                    } label: {
                        ZStack {
                            Buttons()
                            Text("Stability")
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                                .font(.largeTitle)
                                .italic()
                        }
                    }.padding(10)
                    
                    NavigationLink {
                        FastHands()
                            .environmentObject(motionDetector)
                    } label: {
                        ZStack {
                            Buttons()
                            Text("Control")
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                                .font(.largeTitle)
                                .italic()
                        }
                    }.padding(10)
                    
                    NavigationLink {
                        ExercisesList()
                    }label: {
                        ZStack {
                            Buttons()
                            Text("Exercises")
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                                .font(.largeTitle)
                                .italic()
                        }
                    }.padding(10)
                    
                    NavigationLink {
                        About()
                    }label: {
                        ZStack {
                            Buttons()
                            Text("About")
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                                .font(.largeTitle)
                                .italic()
                        }
                    } .padding(10)
                } .offset(y: 100)
            }
            .navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
    }
}
