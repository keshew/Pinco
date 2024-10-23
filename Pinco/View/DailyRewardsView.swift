import SwiftUI

struct DailyRewardsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentIndex = 0
    
    let items = Array(1...7)
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 150))]
    var isClaimedArray = ["CLAIMED",
                          "CLAIM",
                          "EARLY",
                          "EARLY",
                          "EARLY",
                          "EARLY",
                          "EARLY"]
    
    var dailyCountOfGiftArray = ["+100",
                                 "+1",
                                 "+250",
                                 "+3",
                                 "+500",
                                 "+5",
                                 "1000"]
    
    var giftImageArray = ["moneyCount",
                          "heartImage",
                          "moneyCount",
                          "heartImage",
                          "moneyCount",
                          "heartImage",
                          "moneyCount"]
    
    var sizeOfImagesArray: [CGFloat] = [49,
                                        59,
                                        49,
                                        59,
                                        49,
                                        59,
                                        49]
    
    var colorOfTextArray: [Color] = [.yellow,
                                     .pink,
                                     .yellow,
                                     .pink,
                                     .yellow,
                                     .pink,
                                     .yellow]
    
    
    
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
                Text("DAILY REWARDS")
                    .frame(width: 200, height: 108)
                    .font(.custom("MadimiOne-Regular", size: 30))
                    .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
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
                            ZStack {
                                Rectangle()
                                    .fill(Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)))
                                    .frame(width: 150, height: 244)
                                    .cornerRadius(20)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.gray, lineWidth: 2)
                                    )
                                
                                Text("Day \(item)")
                                    .cornerRadius(8)
                                    .font(.custom("MadimiOne-Regular", size: 34))
                                    .foregroundColor(.white)
                                    .offset(x: 0, y: -70)
                                    .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                                
                                ZStack {
                                    Image("moneyBackground")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 88, height: 33)
                                        .cornerRadius(15)
                                    
                                    Text(dailyCountOfGiftArray[index])
                                        .font(.custom("MadimiOne-Regular", size: 18))
                                        .foregroundColor(colorOfTextArray[index])
                                        .offset(x: 12)
                                    
                                    Image(giftImageArray[index])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: sizeOfImagesArray[index], height: sizeOfImagesArray[index])
                                        .offset(x: -30)
                                }
                                .offset(y: 10)
                                
                                Button(action: {
                                    print("CLAIMED")
                                }) {
                                    ZStack {
                                        Image("lightButton")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 140, height: 90)
                                            .cornerRadius(15)
                                        
                                        Text(isClaimedArray[index])
                                            .font(.custom("MadimiOne-Regular", size: 20))
                                            .foregroundColor(.yellow)
                                    }
                                }
                                .frame(width: 110, height: 35)
                                .offset(y: 105)
                            }
                        }
                    }
                    .padding(20)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 50, leading: 10, bottom: 0, trailing: 0))
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DailyRewardsView()
}
