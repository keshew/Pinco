import SwiftUI

struct LoseView: View {
    @State private var isMenuActive = false
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("menuImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Text("LOSE!")
                .font(.custom("MadimiOne-Regular", size: 34))
                .foregroundColor(.white)
                .offset(x: 0, y: -720)
            
            ZStack {
                Image("moneyBackground")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 96, height: 36)
                    .cornerRadius(15)
                    .offset(x: 5, y: 13)
                
                Text("-1")
                    .font(.custom("MadimiOne-Regular", size: 18))
                    .foregroundColor(.pink)
                    .offset(x: 14, y: 13)
                
                Image("heartImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 65, height: 65)
                    .offset(x: -30, y: 13)
            }
            .offset(x: 0 ,y: -665)
            
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
            .offset(x: -70, y: -520)
            
            VStack {
                Text("settings")
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
                        
                        Image("settingsButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55, height: 550)
                    }
                    .frame(width: 104, height: 104)
                }
            }
            .offset(x: 70, y: -520)
            
            Button(action: {
                
            }) {
                ZStack {
                    Image("lightButton")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 93)
                    Text("TRY AGAIN")
                        .font(.custom("MadimiOne-Regular", size: 44))
                        .foregroundColor(.yellow)
                        .bold()
                        .offset(y: 4)
                }
                .frame(width: 273, height: 113)
            }
            .offset(y: -400)

            Text("YOU COULDN'T PUT TOGETHER THE RIGHT ITEMS:(")
                .font(.custom("MadimiOne-Regular", size: 24))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .frame(width: 316, height: 116, alignment: .center)
                .offset(y: -290)
            
            
               Image("firstStageWoman")
                   .resizable()
                   .scaledToFit()
                   .frame(width: 366, height: 453, alignment: .bottom)
                   .offset(y: 50)
          
        }
        .navigationDestination(isPresented: $isMenuActive) {
            MenuView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoseView()
}
