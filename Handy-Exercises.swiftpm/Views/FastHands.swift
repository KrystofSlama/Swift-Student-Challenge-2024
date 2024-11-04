import SwiftUI
import Foundation

struct FastHands: View {
    @Environment(\.dismiss) private var dismiss
    //PopUp Views
    @State var popUp = true
    @State var popUpResaultsBest = false
    @State var popUpResaultsGood = false
    @State var popUpResaultsBad = false
    //get Screen Height/Width
    let screenWidth: Int = Int(UIScreen.main.bounds.width)   
    let screenHeight: Int = Int(UIScreen.main.bounds.height)
    
    @EnvironmentObject var detector: MotionDetector
    
    let range = 0.05
    @State var levelSize: CGFloat = 100
    //Position of player
    var bubbleXPosition: CGFloat {      
        let zeroBasedRoll = detector.roll + range / 2
        let rollAsFraction = zeroBasedRoll / range
        return rollAsFraction * levelSize
    }
    var bubbleYPosition: CGFloat {
        let zeroBasedPitch = detector.pitch + range / 2
        let pitchAsFraction = zeroBasedPitch / range
        return pitchAsFraction * levelSize
    }
    //Target parametrs
    @State var targetSize: CGFloat = 70 
    @State var yPosition = 0
    @State var xPosition = 0
    
    @State var points = 0
    @State var counterPaused = true
    @State var counter:Int = 60
    @State var timer: Timer? = nil
    
    var body: some View {
        ZStack {
            ZStack {
                Colors.background
                    .ignoresSafeArea()
                VStack {
                    //Back button and time/points
                    HStack {
                        Button {         
                            dismiss()
                        }label: {
                            Image(systemName: "arrowshape.backward")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .foregroundStyle(.black)
                        } .padding(.leading, 30)
                        Spacer()
                        VStack {        
                            CustomText(text: "Points \(points)", textSize: 40)
                                .foregroundStyle(.black)
                                .padding(.top, 40)
                            CustomText(text: "Time \(counter)", textSize: 35)
                            
                        } .offset(x: -30)
                        Spacer()
                    }
                    Spacer()
                }
                //Target and player
                Target()
                    .frame(width: targetSize)
                    .offset(x: CGFloat(xPosition), y: CGFloat(yPosition))
                    .overlay(
                        Player()
                            .position(x: bubbleXPosition,
                                      y: bubbleYPosition)
                    )
            }
            //Overlays
            .overlay(       //Starting
                PopUpView(exercise: "Test for control of your hands", intro: "In this test try to point green ball in the middle of red circle. U have 60 seconds and try to get as much pointes as you can. Make sure your IPad is locked on landscape orientation. Hold your IPad comfortably. You can try it only with your left or right hand, or with some fingers.", bottomText: "Press X for start", action:{self.start(); self.pointss(); print("START"); print(screenWidth, screenHeight); popUp = false; detector.start()})
                    .opacity((popUp) ? 1 : 0)
                    .animation(.easeInOut(duration: 0.4), value: popUp)
                    .shadow(color: .black, radius: 10)
            )
            //Results best
            .overlay(        
                PopUpView(exercise: "Nice work", intro: "That is some good score. You have nothing to worry about, but to keep this try some of our exercises some time.", bottomText: "See you next time", action: {dismiss()})
                    .opacity((popUpResaultsBest) ? 1 : 0)
                    .animation(.easeInOut(duration: 0.4), value: popUpResaultsBest)
                    .shadow(color: .black, radius: 10)
            )
            //Results good
            .overlay(
                PopUpView(exercise: "Don't worry", intro: "You should try some of our exercises. Try to do them daily in your free time and next time go for bigger score.", bottomText: "See you soon", action: {dismiss()})
                    .opacity((popUpResaultsGood) ? 1 : 0)
                    .animation(.easeInOut(duration: 0.4), value: popUpResaultsGood)
                    .shadow(color: .black, radius: 10)
            )
            //Results bad
            .overlay(
                PopUpView(exercise: "Good work", intro: "That's not a very good score. You should visit a doctor for professional help.", bottomText: "See you next time", action: {dismiss()})
                    .opacity((popUpResaultsBad) ? 1 : 0)
                    .animation(.easeInOut(duration: 0.4), value: popUpResaultsBad)
                    .shadow(color: .black, radius: 10)
                
            )
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    
    func start(){           
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            //Timer
            if self.counter == 0 {
                //Results
                switch points {
                case 0...20:
                    self.popUpResaultsBad = true
                case 21...40:
                    self.popUpResaultsGood = true
                case 41...70:
                    self.popUpResaultsBest = true
                default:
                    print("NoResult")
                }
            } else {
                self.counter = self.counter - 1
                
            }
        }
    }
    func pointss(){           
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){ tempTimer in
            if counter > 0 {
            //Points
                if (((bubbleXPosition-45) < CGFloat(xPosition + 7)) && ((bubbleXPosition-45) > CGFloat(xPosition - 25))) && (((bubbleYPosition-45) < CGFloat(yPosition + 7)) && ((bubbleYPosition-45) > CGFloat(yPosition - 25))) {
                    self.points = self.points + 1
                    self.xPosition = Int.random(in: -350...350)
                    self.yPosition = Int.random(in: -350...350)
                } 
            }
        }
    }
}

struct FastHands_Previews: PreviewProvider {
    @StateObject static var motionDetector = MotionDetector(updateInterval: 0.01).started()
    
    static var previews: some View {
        FastHands()
            .environmentObject(motionDetector)
    }
}

