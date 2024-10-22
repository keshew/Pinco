import SwiftUI

struct StageView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var statusGame = gameStatus.locked
    @State private var helpLabel: String = "?"
    @State private var gameProgressLabel: String = "0%"
    @State private var lockedNameImage = "lockedImage"
    @State private var isForwardButtonDisable = false
    @State private var isBackButtonDisable = true
    @State private var isGameViewActive = false
    @State private var isButtonDisabled = false
    @State private var isProgressViewActive = false
    @State private var currentIndex = 0
    @State private var opacityForwardButton = 1.0
    @State private var opacityBackdButton = 0.5
    
    var stageTitlesArray = ["STAGE 1 KITCHEN",
                            "STAGE 2 BEDROOM",
                            "STAGE 3 BATHROOM",
                            "STAGE 4 LIVING ROOM",
                            "STAGE 5 STORAGE"]
    
    var womanStageImageArray = ["firstStageWoman",
                                "secondStageWoman",
                                "thirdStageWoman",
                                "fourthStageWoman",
                                "fifthStageWoman"]
    
    var backgroundImageArray = ["firstStage",
                                "secondStage",
                                "thirdStage",
                                "fourthStage",
                                "fifthStage"]
    
    var statusOfGame = [gameStatus.start,
                        gameStatus.locked,
                        gameStatus.locked,
                        gameStatus.locked,
                        gameStatus.locked]
    
    enum gameStatus: String {
        case locked = "LOCKED"
        case start = "START"
    }
    
    func disableButton() {
        if currentIndex == 4 {
            isForwardButtonDisable = true
            opacityForwardButton = 0.5
        } else if currentIndex == 0 {
            isButtonDisabled = false
            isBackButtonDisable = true
            opacityBackdButton = 0.5
        } else {
            isButtonDisabled = true
            isBackButtonDisable = false
            isForwardButtonDisable = false
            opacityForwardButton = 1.0
            opacityBackdButton = 1.0
        }
    }
    
    func lockedGame() {
        switch statusOfGame[currentIndex] {
        case .locked:
            gameProgressLabel = ""
            helpLabel = ""
        case .start:
            helpLabel = "?"
            gameProgressLabel = "0%"
        }
    }
    
    var body: some View {
        
            ZStack {
                Image(backgroundImageArray[currentIndex])
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        ZStack {
                            Image("backgroundSettingsButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 55, height: 55)
                                .cornerRadius(15)
                            
                            Image("backButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24.4, height: 24.4)
                        }
                        .frame(width: 63, height: 63)
                    }
                    .offset(x: -110, y: -345)
                    
                    Button(action: {
                        isProgressViewActive = true
                    }) {
                        ZStack {
                            Image("backgroundSettingsButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 55, height: 55)
                                .cornerRadius(15)
                            
                            Text(helpLabel)
                                .font(.custom("MadimiOne-Regular", size: 34))
                                .foregroundColor(.white)
                            
                            if statusOfGame[currentIndex] == gameStatus.start  {
                                Image("whiteLockedImage")
                                    .hidden()
                            } else {
                                Image("whiteLockedImage")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .scaledToFit()
                                    .offset(CGSize(width: 0, height: -3))
                            }
                            
                        }
                        .frame(width: 63, height: 63)
                    }
                    .disabled(isButtonDisabled)
                    .offset(x: 110, y: -345)
                }
                
                HStack(spacing: 20) {
                    Button(action: {
                        withAnimation {
                            currentIndex = (currentIndex - 1)
                            disableButton()
                            lockedGame()
                        }
                    }) {
                        Image("backArrowButton")
                            .frame(width: 40, height: 35)
                            .padding(2)
                            .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                            .cornerRadius(30)
                            .opacity(self.opacityBackdButton)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray)
                            )
                        
                    }
                    .disabled(isBackButtonDisable)
                    .offset(CGSize(width: 0, height: -265))
                    
                    Text(stageTitlesArray[currentIndex])
                        .frame(width: 200, height: 108)
                        .font(.custom("MadimiOne-Regular", size: 30))
                        .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                        .offset(CGSize(width: 0, height: -265))
                    
                    Button(action: {
                        withAnimation {
                            currentIndex = (currentIndex + 1)
                            disableButton()
                            lockedGame()
                        }
                        
                    }) {
                        Image("forwardArrowButton")
                            .frame(width: 40, height: 35)
                            .padding(2)
                            .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                            .cornerRadius(30)
                            .opacity(self.opacityForwardButton)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray)
                            )
                    }
                    .disabled(isForwardButtonDisable)
                    .offset(CGSize(width: 0, height: -265))
                }
                
                Image(womanStageImageArray[currentIndex])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 319, height: 351)
                    .offset(x: 0, y: 130)
                
                ZStack {
                    Text(gameProgressLabel)
                        .frame(width: 100, height: 58)
                        .font(.custom("MadimiOne-Regular", size: 34))
                        .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray)
                        )
                        .offset(CGSize(width: 0, height: 205))
                    
                    
                    if statusOfGame[currentIndex] == gameStatus.start  {
                        Image(lockedNameImage)
                            .hidden()
                    } else {
                        Image(lockedNameImage)
                            .resizable()
                            .frame(width: 34, height: 34)
                            .scaledToFit()
                            .offset(CGSize(width: -3, height: 203))
                    }
                    
                }
                Button(action: {
                    isGameViewActive = true
                }) {
                    ZStack {
                        Image("lightButton")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 350, height: 93)
                        Text(statusOfGame[currentIndex].rawValue)
                            .font(.custom("MadimiOne-Regular", size: 56))
                            .foregroundColor(.yellow)
                            .bold()
                            .offset(y: 4)
                    }
                    .frame(width: 238, height: 99)
                }
                .disabled(isButtonDisabled)
                .offset(y: 300)
                
            }
            .navigationDestination(isPresented: $isProgressViewActive) {
                ProgressView()
            }
        
            .navigationDestination(isPresented: $isGameViewActive) {
                GameView()
            }
            .navigationBarBackButtonHidden(true)
        }
    }


#Preview {
    StageView()
}
