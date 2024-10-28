import SwiftUI

struct FirstLaunchView: View {
    @State private var currentImageIndex = 0
    @State private var currentTextIndex = 0
    @State private var currentTopTextIndex = 0
    @State private var tapCount = 0
    @State private var isTextVisible = false
    @State private var isLinkVisible = false
    
    var imageFirstLauchArray = ["firstLaunch",
                                "firstLaunch2",
                                "firstLaunch3",
                                "firstLaunch4",
                                "firstLaunch4",
                                "firstLaunch5",
                                "firstLaunch5",
                                "firstLaunch6"]
    
    var textFirstLauchArray = ["GLORIA is settling into her new home",
                               "She's excited to see what her new home will look like",
                               "GLORIA walks into a new house and..",
                               "The new house isn't set up at all, she's upset",
                               "The new house isn't set up at all, she's upset",
                               "Really, really help me?",
                               "Really, really help me?",
                               "Start playing, have a good game."]
    
    var topTextFirstLauchArray = ["I'll help you set up the house GLORIA!",
                                  "Sure, let's get started already)"]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Image(imageFirstLauchArray[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            currentImageIndex = (currentImageIndex + 1) % imageFirstLauchArray.count
                            currentTextIndex = (currentTextIndex + 1) % textFirstLauchArray.count
                            tapCount = tapCount + 1
                            
                            if currentTextIndex == 4 {
                                isTextVisible = true
                                currentTopTextIndex = 0
                            } else if  currentTextIndex == 6 {
                                isTextVisible = true
                                currentTopTextIndex = 1
                            } else if tapCount == 7 {
                                isLinkVisible = true
                                isTextVisible = false
                            } else {
                                isTextVisible = false
                            }
                        }
                    }
                
                
                if isTextVisible {
                    Text(topTextFirstLauchArray[currentTopTextIndex])
                        .font(.custom("MadimiOne-Regular", size: 28))
                        .padding(20)
                        .background((Color(#colorLiteral(red: 103/255, green: 103/255, blue: 103/255, alpha: 1))))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                        .offset(CGSize(width: 0, height: -UIScreen.main.bounds.height + UIScreen.main.bounds.height / 4))
                        .multilineTextAlignment(.center)
                        .frame(width: 316, height: 116, alignment: .center)
                    
                }
                
                if isLinkVisible {
                    NavigationLink(destination: MenuView()) {
                        Text("perehod")
                            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                            .foregroundColor(.clear)
                    }
                }
                
                Text(textFirstLauchArray[currentTextIndex])
                    .font(.custom("MadimiOne-Regular", size: 23))
                    .padding(20)
                    .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                    .offset(CGSize(width: 0, height: -80))
                    .multilineTextAlignment(.center)
                    .frame(width: 316, height: 116, alignment: .center)
                HStack() {
                    Text("tap to continue")
                        .font(.custom("MadimiOne-Regular", size: 24))
                        .foregroundColor(.white)
                    
                    Image(systemName: "forward.fill")
                        .resizable()
                        .bold()
                        .frame(width: 25, height: 15)
                        .foregroundColor(.white)
                    
                }
                
                .padding(EdgeInsets(top: 0, leading: 150, bottom: 15, trailing: 0))
            }
        }
    }
}
#Preview {
    FirstLaunchView()
}
