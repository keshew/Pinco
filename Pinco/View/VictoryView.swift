import SwiftUI

struct VictoryView: View {
    @State private var isMenuActive = false
    @State private var isStageActive = false
    @State private var isGameActive = false
    var body: some View {
        ZStack {
            Image("menuImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            HStack {
                Text("WIN!")
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
                        
                        Text("+150")
                            .font(.custom("MadimiOne-Regular", size: 18))
                            .foregroundColor(.yellow)
                            .offset(x: 14)
                        
                        Image("moneyCount")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55, height: 65)
                            .offset(x: -33)
                    }
                }
                
                HStack(spacing: 40) {
                    VStack {
                        Text("retry")
                            .font(.custom("MadimiOne-Regular", size: 24))
                            .foregroundColor(.yellow)
                            .bold()
                            .offset(y: 20)
                        
                        Button(action: {
                            isGameActive = true
                        }) {
                            ZStack {
                                Image("backgrounDailyShopButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 124, height: 124)
                                
                                Image("retryImage")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                            .frame(width: 104, height: 104)
                        }
                    }
                    
                    VStack {
                        Text("menu")
                            .font(.custom("MadimiOne-Regular", size: 24))
                            .foregroundColor(.yellow)
                            .bold()
                            .offset(y: 20)
                        Button(action: {
                            isMenuActive = true
                        }) {
                            ZStack {
                                Image("backgrounDailyShopButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 124, height: 124)
                                
                                Image("homeButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                            }
                            .frame(width: 104, height: 104)
                        }
                    }
                }
                VStack {
                    HStack(spacing: 5) {
                        Text("+")
                            .font(.custom("MadimiOne-Regular", size: 28))
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        Image("microvawe")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 124, height: 104)
                            .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                         
                    }
                    Text("CONGRATULATIONS, YOU GOT MICROVAWE")
                        .font(.custom("MadimiOne-Regular", size: 18))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .frame(width: 190)
                        
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(EdgeInsets(top: 145, leading: 130, bottom: 0, trailing: 0))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
        
            Button(action: {
                isStageActive = true
            }) {
                ZStack {
                    Image("lightButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 324, height: 143)
                    Text("NEXT")
                        .font(.custom("MadimiOne-Regular", size: 44))
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
                .frame(minWidth: 253, maxWidth: 438, minHeight: 283, maxHeight: 338)
                .offset(x: -75, y: 265)
        }
        .navigationDestination(isPresented: $isMenuActive) {
            MenuView()
        }
        
        .navigationDestination(isPresented: $isStageActive) {
            StageView()
        }
        
        .navigationDestination(isPresented: $isGameActive) {
            GameView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    VictoryView()
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
