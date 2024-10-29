import SwiftUI

struct LoseView: View {
    @State private var isMenuActive = false
    @State private var isGameActive = false
    private var loseViewModel = LoseViewModel()
    var body: some View {
        ZStack {
            Image(LoseModel.Const.menuImage.rawValue)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            HStack {
                Text(LoseModel.Const.lose.rawValue)
                    .font(.custom("MadimiOne-Regular", size: 34))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            VStack(spacing: -20) {
                HStack(spacing: 50) {
                    ZStack {
                        Image(LoseModel.Const.moneyBackground.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 96, height: 37)
                            .cornerRadius(15)
                        
                        Text(LoseModel.Const.lifesCount.rawValue)
                            .font(.custom("MadimiOne-Regular", size: 18))
                            .foregroundColor(.pink)
                            .offset(x: 14)
                        
                        Image(LoseModel.Const.heartImage.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 65, height: 65)
                            .offset(x: -33)
                    }
                }
                
                HStack(spacing: 40) {
                    VStack {
                        Text(LoseModel.Const.menu.rawValue)
                            .font(.custom("MadimiOne-Regular", size: 24))
                            .foregroundColor(.yellow)
                            .bold()
                            .offset(y: 20)
                        Button(action: {
                            isMenuActive = true
                        }) {
                            ZStack {
                                Image(LoseModel.Const.backgrounDailyShopButton.rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 124, height: 124)
                                
                                Image(LoseModel.Const.homeButton.rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                            }
                            .frame(width: 104, height: 104)
                        }
                    }
                    
                    VStack {
                        Text(LoseModel.Const.settings.rawValue)
                            .font(.custom("MadimiOne-Regular", size: 24))
                            .foregroundColor(.yellow)
                            .bold()
                            .offset(y: 20)
                        
                        Button(action: {
                            
                        }) {
                            ZStack {
                                Image(LoseModel.Const.backgrounDailyShopButton.rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 124, height: 124)
                                
                                Image(LoseModel.Const.settingsButton.rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                            }
                            .frame(width: 104, height: 104)
                        }
                    }
                }
                
                Text(LoseModel.Const.loseText.rawValue)
                    .font(.custom("MadimiOne-Regular", size: 23))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .offset(y: 140)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
        
            Button(action: {

            }) {
                ZStack {
                    Button(action: {
                        isGameActive = true
                    }) {
                        ZStack {
                            Image(LoseModel.Const.lightButton.rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 324, height: 143)
                            Text(LoseModel.Const.tryAgain.rawValue)
                                .font(.custom("MadimiOne-Regular", size: 44))
                                .foregroundColor(.yellow)
                                .bold()
                                .offset(y: 4)
                        }
                    }
                }
                .frame(width: 273, height: 113)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 250, leading: 0, bottom: 0, trailing: 0))
            
     
            
            Image(LoseModel.Const.firstStageWoman.rawValue)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 253, maxWidth: 458, minHeight: 283, maxHeight: 498)
                .offset(y: 265)
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

#Preview {
    LoseView()
}
