import SwiftUI

struct PauseView: View {
    @State private var isMenuActive = false
    var body: some View {
        ZStack {
            Image("menuImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            HStack {
                Text("PAUSE")
                    .font(.custom("MadimiOne-Regular", size: 34))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
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
//                            isDailyRewardViewActive = true
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
//                            isShopActive = true
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
                
                Text("GAME PAUSED")
                    .font(.custom("MadimiOne-Regular", size: 24))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .offset(y: 155)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
        
            Button(action: {
//                isStageViewActive = true
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
            .padding(EdgeInsets(top: 250, leading: 0, bottom: 0, trailing: 0))
            
     
            
            Image("menuWoman")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 253, maxWidth: 458, minHeight: 283, maxHeight: 498)
                .offset(y: 265)
        }
        .navigationDestination(isPresented: $isMenuActive) {
            MenuView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PauseView()
}


//import SwiftUI
//
//struct PauseView: View {
//    @State private var isMenuActive = false
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            Image("menuImage")
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea()
//            
//            VStack(spacing: 10) {
//                Text("PAUSE")
//                    .font(.custom("MadimiOne-Regular", size: 34))
//                    .foregroundColor(.white)
//      
//                HStack(spacing: 50) {
//                ZStack {
//                    Image("moneyBackground")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 96, height: 36)
//                        .cornerRadius(15)
//                        .offset(x: 5, y: 13)
//                    
//                    Text("2500")
//                        .font(.custom("MadimiOne-Regular", size: 18))
//                        .foregroundColor(.yellow)
//                        .offset(x: 20, y: 13)
//                    
//                    Image("moneyCount")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 65, height: 65)
//                        .offset(x: -30, y: 13)
//                }
//                
//                ZStack {
//                    Image("moneyBackground")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 96, height: 36)
//                        .cornerRadius(15)
//                        .offset(x: 5, y: 13)
//                    
//                    Text("4")
//                        .font(.custom("MadimiOne-Regular", size: 18))
//                        .foregroundColor(.pink)
//                        .offset(x: 14, y: 13)
//                    
//                    Image("heartImage")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 65, height: 65)
//                        .offset(x: -30, y: 13)
//                }
//            }
//                HStack(spacing: 91) {
//                    Text("retry")
//                        .font(.custom("MadimiOne-Regular", size: 24))
//                        .foregroundColor(.yellow)
//                        .bold()
//                    
//                    Text("menu")
//                        .font(.custom("MadimiOne-Regular", size: 24))
//                        .foregroundColor(.yellow)
//                        .bold()
//                }
//                HStack(spacing: 40) {
//                    Button(action: {
//    //                    isMenuActive = true
//                    }) {
//                        ZStack {
//                            Image("backgrounDailyShopButton")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 124, height: 124)
//                            
//                            Image("retryImage")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 50, height: 50)
//                        }
//                        .frame(width: 104, height: 104)
//                    }
//                    
//                    Button(action: {
//                        isMenuActive = true
//                    }) {
//                        ZStack {
//                            Image("backgrounDailyShopButton")
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 124, height: 124)
//                            
//                            Image("homeButton")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 70, height: 70)
//                        }
//                        .frame(width: 104, height: 104)
//                    }
//                }
//                Button(action: {
//
//                }) {
//                    ZStack {
//                        Image("lightButton")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 350, height: 93)
//                        Text("RESUME")
//                            .font(.custom("MadimiOne-Regular", size: 44))
//                            .foregroundColor(.yellow)
//                            .bold()
//                            .offset(y: 4)
//                    }
//                    .frame(width: 273, height: 113)
//                }
//                
//                Text("GAME PAUSED")
//                    .font(.custom("MadimiOne-Regular", size: 24))
//                    .foregroundColor(.white)
//                    .multilineTextAlignment(.center)
//                    
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
//            
//                Image("menuWoman")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 316, height: 296, alignment: .center)
//                    .offset(y: 55)
//        }
//        .navigationDestination(isPresented: $isMenuActive) {
//            MenuView()
//        }
//        .navigationBarBackButtonHidden(true)
//    }
//}
//
//#Preview {
//    PauseView()
//}
