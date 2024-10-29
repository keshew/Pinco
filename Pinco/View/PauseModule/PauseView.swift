import SwiftUI

struct PauseView: View {
    @Binding var timeRemaining: Int
    @Environment(\.presentationMode) var presentationMode
    @State private var isMenuActive = false
    @State private var isGameActive = false
    @State private var currentMoney = UserDefaultsManager.defaults.object(forKey: Keys.moneyKey.rawValue) ?? 0
    @State private var currentLife = UserDefaultsManager.defaults.object(forKey: Keys.lifesKey.rawValue) ?? 0
//    private var pauseViewModel = PauseViewModel()
    
    var body: some View {
        ZStack {
            Image(PauseModel.Const.menuImage.rawValue)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            HStack {
                Text(PauseModel.Const.pause.rawValue)
                    .font(.custom("MadimiOne-Regular", size: 34))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            VStack(spacing: -20) {
                HStack(spacing: 50) {
                    ZStack {
                        Image(PauseModel.Const.moneyBackground.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 96, height: 37)
                            .cornerRadius(15)
                        
                        
                        Text("\(currentMoney)")
                            .font(.custom("MadimiOne-Regular", size: 18))
                            .foregroundColor(.yellow)
                            .offset(x: 13)
                        
                        Image(PauseModel.Const.moneyCount.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 49, height: 49)
                            .offset(x: -30)
                    }
                    
                    ZStack {
                        Image(PauseModel.Const.moneyBackground.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 96, height: 37)
                            .cornerRadius(15)
                        
                        Text("\(currentLife)")
                            .font(.custom("MadimiOne-Regular", size: 18))
                            .foregroundColor(.pink)
                            .offset(x: 14)
                        
                        Image(PauseModel.Const.heartImage.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 65, height: 65)
                            .offset(x: -30)
                    }
                }
                
                HStack(spacing: 40) {
                    VStack {
                        Text(PauseModel.Const.retry.rawValue)
                            .font(.custom("MadimiOne-Regular", size: 24))
                            .foregroundColor(.yellow)
                            .bold()
                            .offset(y: 20)
                        Button(action: {
                            isGameActive = true
                            UserDefaultsManager().minus(lifes: 1)
                        }) {
                            ZStack {
                                Image(PauseModel.Const.backgrounDailyShopButton.rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 124, height: 124)
                                
                                Image(PauseModel.Const.retryImage.rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                            .frame(width: 104, height: 104)
                        }
                    }
                    
                    VStack {
                        Text(PauseModel.Const.menu.rawValue)
                            .font(.custom("MadimiOne-Regular", size: 24))
                            .foregroundColor(.yellow)
                            .bold()
                            .offset(y: 20)
                        
                        Button(action: {
                            isMenuActive = true
                            UserDefaultsManager().minus(lifes: 1)
                        }) {
                            ZStack {
                                Image(PauseModel.Const.backgrounDailyShopButton.rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 124, height: 124)
                                
                                Image(PauseModel.Const.homeButton.rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                            }
                            .frame(width: 104, height: 104)
                        }
                    }
                }
                
                Text(PauseModel.Const.gamePaused.rawValue)
                    .font(.custom("MadimiOne-Regular", size: 24))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .offset(y: 155)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
        
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                timeRemaining = timeRemaining
            }) {
                ZStack {
                    Image(PauseModel.Const.lightButton.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 324, height: 143)
                    Text(PauseModel.Const.resume.rawValue)
                        .font(.custom("MadimiOne-Regular", size: 46))
                        .foregroundColor(.yellow)
                        .bold()
                        .offset(y: 4)
                }
                .frame(width: 273, height: 113)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 250, leading: 0, bottom: 0, trailing: 0))
            
     
            
            Image(PauseModel.Const.menuWoman.rawValue)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 253, maxWidth: 458, minHeight: 283, maxHeight: 498)
                .offset(y: 265)
        }
        .onAppear() {
            currentMoney = UserDefaultsManager.defaults.object(forKey: Keys.moneyKey.rawValue) ?? 0
            currentLife = UserDefaultsManager.defaults.object(forKey: Keys.lifesKey.rawValue) ?? 0
        }
        
        .navigationDestination(isPresented: $isMenuActive) {
            MenuView()
        }
        
        .navigationDestination(isPresented: $isGameActive) {
            GameView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    PauseView()
//}
