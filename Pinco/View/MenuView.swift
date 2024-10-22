import SwiftUI

struct MenuView: View {
    @State private var isStageViewActive = false
    @State private var isDailyRewardViewActive = false
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Image("menuImage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                HStack {
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
                        .frame(width: 63, height: 63)
                    }
                    .offset(x: -15, y: 95)
                    
                    Button(action: {
                        print("Кнопка звука нажата")
                    }) {
                        ZStack {
                            
                            Image("backgroundSettingsButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 63, height: 63)
                                .cornerRadius(15)
                            
                            Image("soundButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 56, height: 56)
                        }
                        .frame(width: 63, height: 63)
                    }
                    .offset(x: 180, y: 95)
                }
                .offset(x: -80, y: -790)
                
                
                VStack {
                    ZStack {
                        Image("moneyBackground")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 96, height: 36)
                            .cornerRadius(15)
                            .offset(x: 5, y: 50)
                        
                        Text("2500")
                            .font(.custom("MadimiOne-Regular", size: 18))
                            .foregroundColor(.yellow)
                            .offset(x: 14, y: 50)
                        
                        Image("moneyCount")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 49, height: 49)
                            .offset(x: -30, y: 50)
                    }
                    .offset(y: -30)
                    
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
                .offset(x: -70, y: -485)
                
                
                VStack {
                    ZStack {
                        Image("moneyBackground")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 96, height: 36)
                            .cornerRadius(15)
                            .offset(x: 5, y: 13)
                        
                        Text("4")
                            .font(.custom("MadimiOne-Regular", size: 18))
                            .foregroundColor(.pink)
                            .offset(x: 14, y: 13)
                        
                        Image("heartImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 65, height: 65)
                            .offset(x: -30, y: 13)
                    }
                    .offset(y: 15)
                    
                    Text("shop")
                        .font(.custom("MadimiOne-Regular", size: 24))
                        .foregroundColor(.yellow)
                        .bold()
                        .offset(y: 20)
                    
                    Button(action: {
                        print("Кнопка магазина нажата")
                    }) {
                        ZStack {
                            Image("backgrounDailyShopButton")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 124, height: 124)
                            
                            Image("shopButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                        }
                        .frame(width: 104, height: 104)
                    }
                }
                .offset(x: 70, y: -485)
                
                Button(action: {
                    isStageViewActive = true
                }) {
                    ZStack {
                        Image("lightButton")
                            .resizable() 
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 350, height: 93)
                        Text("PLAY")
                            .font(.custom("MadimiOne-Regular", size: 56))
                            .foregroundColor(.yellow)
                            .bold()
                            .offset(y: 4)
                    }
                    .frame(width: 273, height: 113)
                }
                .offset(y: -370)
                
             
                Image("menuWoman")
                    .resizable()
                    .scaledToFit()
                    .frame(alignment: .bottom)
                    .offset(y: 55)
            }
            .navigationDestination(isPresented: $isStageViewActive) {
                StageView()
            }
            
            .navigationDestination(isPresented: $isDailyRewardViewActive) {
                DailyRewardsView()
            }
           
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    MenuView()
}
