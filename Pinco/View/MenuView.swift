import SwiftUI

struct MenuView: View {
    @State private var isStageViewActive = false
    @State private var isDailyRewardViewActive = false
    @State private var isShopActive = false
    @State private var isSoundEnable = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("menuImage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                HStack(spacing: 220) {
                    Button(action: {
                        print("Кнопка настроек нажата")
                    }) {
                        ZStack {
                            Image("backgroundSettingsButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 63, height: 63)
                                .cornerRadius(15)
                            
                            Image("settingsButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 38, height: 38)
                        }
                    }
                    Button(action: {
                      isSoundEnable = !isSoundEnable
                    }) {
                        ZStack {
                            Image("backgroundSettingsButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 63, height: 63)
                                .cornerRadius(15)
                            
                            if isSoundEnable {
                                Image("soundButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 56, height: 56)
                            } else {
                                Image("disableSound")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 56, height: 56)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                
                VStack(spacing: -20) {
                    HStack(spacing: 50) {
                        ZStack {
                            Image("moneyBackground")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 96, height: 37)
                                .cornerRadius(15)
                            
                            
                            Text("2500")
                                .font(.custom("MadimiOne-Regular", size: 18))
                                .foregroundColor(.yellow)
                                .offset(x: 13)
                            
                            Image("moneyCount")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 49, height: 49)
                                .offset(x: -30)
                        }
                        
                        ZStack {
                            Image("moneyBackground")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 96, height: 37)
                                .cornerRadius(15)
                            
                            Text("4")
                                .font(.custom("MadimiOne-Regular", size: 18))
                                .foregroundColor(.pink)
                                .offset(x: 14)
                            
                            Image("heartImage")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 65, height: 65)
                                .offset(x: -30)
                        }
                    }
                    HStack(spacing: 40) {
                        VStack {
                            Text("daily")
                                .font(.custom("MadimiOne-Regular", size: 24))
                                .foregroundColor(.yellow)
                                .bold()
                                .offset(y: 20)
                            Button(action: {
                                isDailyRewardViewActive = true
                            }) {
                                ZStack {
                                    Image("backgrounDailyShopButton")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 124, height: 124)
                                    
                                    Image("dailyButton")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                }
                                .frame(width: 104, height: 104)
                            }
                        }
                        
                        VStack {
                            Text("shop")
                                .font(.custom("MadimiOne-Regular", size: 24))
                                .foregroundColor(.yellow)
                                .bold()
                                .offset(y: 20)
                            
                            Button(action: {
                                isShopActive = true
                            }) {
                                ZStack {
                                    Image("backgrounDailyShopButton")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 124, height: 124)
                                    
                                    Image("shopButton")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                }
                                .frame(width: 104, height: 104)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
            
                Button(action: {
                    isStageViewActive = true
                }) {
                    ZStack {
                        Image("lightButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 324, height: 143)
                        Text("PLAY")
                            .font(.custom("MadimiOne-Regular", size: 56))
                            .foregroundColor(.yellow)
                            .bold()
                            .offset(y: 4)
                    }
                    .frame(width: 273, height: 113)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(EdgeInsets(top: 300, leading: 0, bottom: 0, trailing: 0))
                
                
                Image("menuWoman")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 253, maxWidth: 458, minHeight: 283, maxHeight: 498)
                    .offset(y: 265)
            }
            .navigationDestination(isPresented: $isStageViewActive) {
                StageView()
            }
            
            .navigationDestination(isPresented: $isDailyRewardViewActive) {
                DailyRewardsView()
            }
            
            .navigationDestination(isPresented: $isShopActive) {
                ShopView()
            }
           
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    MenuView()
}


