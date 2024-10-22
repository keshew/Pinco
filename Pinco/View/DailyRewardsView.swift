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
                    .offset(CGSize(width: 5, height: -290))
                
                ZStack {
                    Image("moneyBackground")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 96, height: 36)
                        .cornerRadius(15)
                        .offset(x: 5, y: 52)
                    
                    Text("2500")
                        .font(.custom("MadimiOne-Regular", size: 18))
                        .foregroundColor(.yellow)
                        .offset(x: 16, y: 52)
                    
                    Image("moneyCount")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 55, height: 55)
                        .offset(x: -30, y: 52)
                }
                .offset(x: -70, y: -330)
                
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
                .offset(x: 70, y: -365)
            }
            .offset(x: 0, y: 65)
            
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
                .frame(width: 63, height: 63)
            }
            .offset(x: -140, y: -345)
            
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
                            
                            Text("Day \(item)")
                                .frame(minWidth: 150, minHeight: 190)
                                .cornerRadius(8)
                                .font(.custom("MadimiOne-Regular", size: 34))
                                .foregroundColor(.white)
                                .offset(x: 0, y: -70)
                                .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                            
                            ZStack {
                                Image("moneyBackground")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 96, height: 36)
                                    .cornerRadius(15)
                                    .offset(x: 5, y: 50)
                                
                                Text(dailyCountOfGiftArray[index])
                                    .font(.custom("MadimiOne-Regular", size: 18))
                                    .foregroundColor(colorOfTextArray[index])
                                    .offset(x: 17, y: 50)
                                
                                Image(giftImageArray[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: sizeOfImagesArray[index], height: sizeOfImagesArray[index])
                                    .offset(x: -30, y: 50)
                            }
                            .offset(y: -40)
                            
                            
                            ZStack {
                                Image("lightButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 140, height: 90)
                                    .cornerRadius(15)
                                    .offset(x: 0, y: 50)
                                
                                Text(isClaimedArray[index])
                                    .font(.custom("MadimiOne-Regular", size: 20))
                                    .foregroundColor(.yellow)
                                    .offset(x: 2, y: 50)
                            }
                            .frame(width: 110, height: 45)
                            .offset(y: 70)
                        }
                    }
                }
                .padding(20)
                
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.5)
            .offset(x: 0, y: 120)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DailyRewardsView()
}
