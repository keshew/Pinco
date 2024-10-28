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
    @State private var isMenuActive = false
    @State private var isButtonDisabled = false
    @State private var isProgressViewActive = false
    @State private var currentIndex = 0
    @State private var opacityForwardButton = 1.0
    @State private var opacityBackdButton = 0.5
    @State private var cuurentStage = UserDefaultsManager.defaults.integer(forKey: Keys.indexForStage.rawValue)
    var stageTitlesArray = ["STAGE 1 KITCHEN",
                            "STAGE 2 BEDROOM",
                            "STAGE 3 BATHROOM",
                            "STAGE 4 LIVING ROOM",
                            "STAGE 5 STORAGE"]
    
    var procentOfGame = ["0%",
                         "15%",
                         "30%",
                         "45%",
                         "60%",
                         "75%",
                         "90%",
                         "100%"]
    
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
    
    var body: some View {
        ZStack {
            Image(backgroundImageArray[currentIndex])
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            HStack(spacing: 220) {
                    Button(action: {
                        isMenuActive = true
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
                    }
                
                    Button(action: {
                        isProgressViewActive = true
                    }) {
                        ZStack {
                            Image("backgroundSettingsButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 55, height: 55)
                                .cornerRadius(15)
                            
                         
                            
                            if statusOfGame[currentIndex] == gameStatus.start  {
                                Text(helpLabel)
                                    .font(.custom("MadimiOne-Regular", size: 34))
                                    .foregroundColor(.white)
                                
                                Image("whiteLockedImage")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .scaledToFit()
                                    .offset(CGSize(width: 0, height: -3))
                                    .hidden()
                            } else {
                                Text(helpLabel)
                                    .hidden()
                                    .font(.custom("MadimiOne-Regular", size: 34))
                                    .foregroundColor(.white)
                             
                                Image("whiteLockedImage")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .scaledToFit()
                                    .offset(CGSize(width: 0, height: -3))
                            }
                        }
                    }
                    .disabled(isButtonDisabled)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            
            VStack {
                HStack(spacing: 20) {
                    Button(action: {
                        withAnimation {
                            currentIndex = (currentIndex - 1)
                            disableButton()
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
                    
                    Button(action: {
                        withAnimation {
                            currentIndex = (currentIndex + 1)
                            disableButton()
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
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(EdgeInsets(top: 80, leading: 0, bottom: 0, trailing: 0))
                
                
                VStack {
                    ZStack {
                        Image(womanStageImageArray[currentIndex])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 319, height: 351)
                            .offset(y: -70)
                        
                        if statusOfGame[currentIndex] == gameStatus.start {
                            Text("\(procentOfGame[cuurentStage])")
                                .frame(width: 100, height: 58)
                                .font(.custom("MadimiOne-Regular", size: 34))
                                .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray)
                                )
                                .offset(x: -5, y: 5)
                            
                            Image(lockedNameImage)
                                .resizable()
                                .frame(width: 34, height: 34)
                                .scaledToFit()
                                .offset(CGSize(width: -3, height: 203))
                                .hidden()
                        } else {
                            Text("\(procentOfGame[cuurentStage])")
                                .hidden()
                                .frame(width: 100, height: 58)
                                .font(.custom("MadimiOne-Regular", size: 34))
                                .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray)
                                )
                                .offset(x: -5, y: 5)
                            
                            Image(lockedNameImage)
                                .resizable()
                                .frame(width: 34, height: 34)
                                .scaledToFit()
                                .offset(x: -7, y: 3)
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
                    }
                    .frame(width: 238, height: 99)
                    .offset(x: 0, y: -120)
                    .disabled(isButtonDisabled)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: -80, trailing: 0))
            }
        }
        .onAppear() {
            cuurentStage = UserDefaultsManager.defaults.integer(forKey: Keys.indexForStage.rawValue)
        }
        .navigationDestination(isPresented: $isProgressViewActive) {
            ProgressView()
        }

        .navigationDestination(isPresented: $isMenuActive) {
            MenuView()
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
