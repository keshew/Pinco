import SwiftUI

struct CoinShopView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentMoney = UserDefaultsManager.defaults.object(forKey: Keys.moneyKey.rawValue) ?? 0
    @State private var currentLife = UserDefaultsManager.defaults.object(forKey: Keys.lifesKey.rawValue) ?? 0
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 150))]
    private let items = Array(1...4)
    private let labelArray = ["BEGGINER", "ADVANCED", "EXPERIENCED", "PRO"]
    private let amountMoney = ["1000", "2500", "10 000", "50 000"]
    private let priceForMoney = ["1.99", "3.99", "9.99", "19.99"]
    private let toolsImageArray = ["moneyCount", "advancedMoney", "experiencedMoney", "proMoney"]
    private let sizeForImages: [CGFloat] = [59,155,155,155]
    
    var body: some View {
        ZStack {
            Image("firstStage")
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
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 0))
            
            VStack {
                Text("SHOP COIN")
                    .frame(width: 208, height: 108)
                    .font(.custom("MadimiOne-Regular", size: 30))
                    .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                HStack(spacing: 50) {
                    ZStack {
                        Image("moneyBackground")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 96, height: 37)
                            .cornerRadius(15)
                        
                        
                        Text("\(currentMoney)")
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
                        
                        Text("\(currentLife)")
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
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 35) {
                        ForEach(Array(items.enumerated()), id: \.1) { index, item in
                                ZStack {
                                    Rectangle()
                                        .fill(Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)))
                                        .frame(width: 155, height: 244)
                                        .cornerRadius(20)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.gray, lineWidth: 2)
                                        )
                                    
                                    Text(labelArray[index])
                                        .frame(minWidth: 150, minHeight: 190)
                                        .cornerRadius(8)
                                        .font(.custom("MadimiOne-Regular", size: 22))
                                        .foregroundColor(.white)
                                        .offset(x: 0, y: -80)
                                        .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                                    
                                    ZStack {
                                        Image(toolsImageArray[index])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: sizeForImages[index], height: sizeForImages[index])
                                            .offset(x: 0, y: 35)
                                        
                                        Text("\(amountMoney[index]) pcs")
                                            .font(.custom("MadimiOne-Regular", size: 16))
                                            .foregroundColor(.yellow)
                                            .offset(x: 2, y: 110)
                                    }
                                    .offset(y: -40)
                                    ZStack {
                                        Button(action: {
                                            print("CLAIMED")
                                        }) {
                                            ZStack {
                                                Image("lightButton")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 140, height: 90)
                                                    .cornerRadius(15)
                                                
                                                Text("\(priceForMoney[index])$")
                                                    .font(.custom("MadimiOne-Regular", size: 20))
                                                    .foregroundColor(.yellow)
                                            }
                                            .frame(width: 100, height: 40)

                                        }
                                        .offset(y: 110)
                                    }
                                }
                        }
                    }
                    .padding(20)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
        }
        .onAppear() {
            currentMoney = UserDefaultsManager.defaults.object(forKey: Keys.moneyKey.rawValue) ?? 0
            currentLife = UserDefaultsManager.defaults.object(forKey: Keys.lifesKey.rawValue) ?? 0
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CoinShopView()
}
