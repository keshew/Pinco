import SwiftUI

struct ShopView: View {
    @Environment(\.presentationMode) var presentationMode
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 150))]
    private let items = Array(1...3)
    private let labelArray = ["COIN", "HEALTH", "TOOL"]
    private let  giftImageArray = ["moneyCount",
                                   "heartImage",
                                   "moneyCount"]
    private let toolsImageArray = ["rocketTool", "bombTool", "greandeTool"]
    private let sizeForImages: [CGFloat] = [59,79,95]
    
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
                Text("SHOP")
                    .frame(width: 158, height: 66)
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
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 35) {
                        ForEach(Array(items.enumerated()), id: \.1) { index, item in
                            if index == 2 {
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
                                        .font(.custom("MadimiOne-Regular", size: 34))
                                        .foregroundColor(.white)
                                        .offset(x: 0, y: -70)
                                        .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                                    
                                    ZStack {
                                        Image("bombTool")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: sizeForImages[index], height: sizeForImages[index])
                                            .offset(x: -30, y: 45)

                                        Image("greandeTool")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: sizeForImages[index], height: sizeForImages[index])
                                            .offset(x: 35, y: 45)
                                        
                                        Image("rocketTool")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: sizeForImages[index], height: sizeForImages[index])
                                            .offset(x: 0, y: 50)
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
                                                    .offset(x: 0, y: 50)
                                                
                                                Text("CHECK")
                                                    .font(.custom("MadimiOne-Regular", size: 20))
                                                    .foregroundColor(.yellow)
                                                    .offset(x: 2, y: 50)
                                            }
                                        }
                                        .frame(width: 110, height: 45)
                                        .offset(y: 60)
                                    }
                                }
                                .offset(x: UIScreen.main.bounds.width / 4.5)
                            } else {
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
                                        .font(.custom("MadimiOne-Regular", size: 34))
                                        .foregroundColor(.white)
                                        .offset(x: 0, y: -70)
                                        .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                                    
                                    ZStack {
                                        Image(giftImageArray[index])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: sizeForImages[index], height: sizeForImages[index])
                                            .offset(x: -20, y: 40)
                                        
                                        Image(giftImageArray[index])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: sizeForImages[index], height: sizeForImages[index])
                                            .offset(x: 20, y: 40)
                                            
                                        Image(giftImageArray[index])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: sizeForImages[index], height: sizeForImages[index])
                                            .offset( y: 70)
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
                                                    .offset(x: 0, y: 50)
                                                
                                                Text("CHECK")
                                                    .font(.custom("MadimiOne-Regular", size: 20))
                                                    .foregroundColor(.yellow)
                                                    .offset(x: 2, y: 50)
                                            }
                                        }
                                        .frame(width: 110, height: 45)
                                        .offset(y: 70)
                                    }
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ShopView()
}
