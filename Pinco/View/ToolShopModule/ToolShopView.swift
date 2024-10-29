import SwiftUI

struct ToolShopView: View {
    @Environment(\.presentationMode) var presentationMode
    private var toolShopViewModel = ToolShopViewModel()
    @State private var currentMoney = UserDefaultsManager.defaults.object(forKey: Keys.moneyKey.rawValue) ?? 0
    @State private var currentLife = UserDefaultsManager.defaults.object(forKey: Keys.lifesKey.rawValue) ?? 0
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 250))]
    private let items = Array(1...3)
    private let labelArray = ["BEGGINER", "ADVANCED", "EXPERIENCED"]
    private let amountLifes = [1, 3, 5]
    private let priceForLifes = [150, 250, 450]
    private let toolsImageArray = ["rocketTool", "greandeTool", "bombTool"]
    private let sizeForImages: [CGFloat] = [120,120,120]
    
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
                Text("SHOP      TOOL")
                    .frame(width: 208, height: 108)
                    .font(.custom("MadimiOne-Regular", size: 35))
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
                        ForEach(Array(toolShopViewModel.contact.items.enumerated()), id: \.1) { index, item in
                                ZStack {
                                    Rectangle()
                                        .fill(Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)))
                                        .frame(width: 259, height: 249)
                                        .cornerRadius(20)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.gray, lineWidth: 2)
                                        )
                                    
                                    VStack {
                                        HStack(spacing: 40) {
                                            ZStack {
                                                Image(ToolShopModel.Const.moneyBackground.rawValue)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 58, height: 27)
                                                    .cornerRadius(15)
                                                
                                                
                                                Text("150")
                                                    .font(.custom("MadimiOne-Regular", size: 18))
                                                    .foregroundColor(.yellow)
                                                    .offset(x: 3)
                                                
                                                Image(ToolShopModel.Const.moneyCount.rawValue)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 31, height: 31)
                                                    .offset(x: -30)
                                            }
                                            
                                            Text("ROCKET")
                                                .font(.custom("MadimiOne-Regular", size: 28))
                                                .foregroundColor(.white)
                                        }
                                        .offset(x: 5, y: -90)
                                    }
                                    
                                    
                                    VStack(spacing: 20) {
                                        Text("LEVEL 1 > LEVEL 2")
                                            .font(.custom("MadimiOne-Regular", size: 15))
                                            .foregroundColor(.white)
                                        
                                        Text("BREAKS A ROW, EITHER HORIZONTALLY OR VERTICALLY")
                                            .font(.custom("MadimiOne-Regular", size: 12))
                                            .lineLimit(4)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                    }
                                    .offset(x: 53, y: -10)
                                    .frame(width: 120)
                                    
                                    HStack(spacing: -80) {
                                        Image(toolsImageArray[index])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: sizeForImages[index], height: sizeForImages[index])
                                        
                                        Path { path in
                                                    path.move(to: CGPoint(x: 75, y: 65))
                                                    path.addLine(to: CGPoint(x: 75, y: 175))
                                                }
                                                .stroke(Color.gray, lineWidth: 3)
                                    }
                                    .frame(width: 130)
                                    .offset(x: -70)
                                    
                                    Text("2 BLOKS > 3 BLOKS")
                                        .font(.custom("MadimiOne-Regular", size: 18))
                                        .foregroundColor(.yellow)
                                        .offset(x: 2, y: 73)
                                    
                                    ZStack {
                                        Button(action: {
                                        }) {
                                            ZStack {
                                                Image("lightButton")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 140, height: 90)
                                                    .cornerRadius(15)
                                                    .offset(x: 0, y: 50)
                                                
                                                Text("BOOST")
                                                    .font(.custom("MadimiOne-Regular", size: 20))
                                                    .foregroundColor(.yellow)
                                                    .offset( y: 50)
                                            }
                                        }
                                        .frame(width: 110, height: 45)
                                        .offset(y: 60)
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
    ToolShopView()
}
