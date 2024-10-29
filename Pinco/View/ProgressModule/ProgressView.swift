import SwiftUI

struct ProgressView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentIndex = 0
    @State private var itemIndex = -1
    @State private var opacityForwardButton = 1.0
    @State private var opacityBackdButton = 0.5
    @State private var isForwardButtonDisable = false
    @State private var isBackButtonDisable = true
    private var progressViewModel = ProgressViewModel()
    
    func disableButton() {
        if currentIndex == 7 {
            isForwardButtonDisable = true
            opacityForwardButton = 0.5
        } else if currentIndex == 0 {
            isBackButtonDisable = true
            opacityBackdButton = 0.5
        } else {
            isBackButtonDisable = false
            isForwardButtonDisable = false
            opacityForwardButton = 1.0
            opacityBackdButton = 1.0
        }
    }
    
    var body: some View {
        ZStack {
            Image(ProgressModel.ImageName.progressViewBackground.rawValue)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            HStack(spacing: 240) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    ZStack {
                        Image(ProgressModel.ImageName.backgroundSettingsButton.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55, height: 55)
                            .cornerRadius(15)
                        
                        Image(ProgressModel.ImageName.backButton.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24.4, height: 24.4)
                    }
                }
                
                Button(action: {
                    
                }) {
                    ZStack {
                        Image(ProgressModel.ImageName.backgroundSettingsButton.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55, height: 55)
                            .cornerRadius(15)
                        
                        Text("?")
                            .font(.custom("MadimiOne-Regular", size: 34))
                            .foregroundColor(.black)
                    }
                }
                .disabled(true)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            
            VStack {
                Text("STAGE 1 KITCHEN")
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
                
                Text(progressViewModel.contact.procentProgressArray[currentIndex])
                    .frame(width: 100, height: 58)
                    .font(.custom("MadimiOne-Regular", size: 30))
                    .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                
                if currentIndex > 0 {
                    VStack {
                        Text(progressViewModel.contact.levelProgressArray[itemIndex])
                            .font(.custom("MadimiOne-Regular", size: 30))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Image(progressViewModel.contact.imageProgressArray[itemIndex])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 170)
                            .offset(CGSize(width: 0, height: -10))
                        
                        Text(progressViewModel.contact.itemProgressArray[itemIndex])
                            .frame(width: 250, height: 50)
                            .font(.custom("MadimiOne-Regular", size: 28))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .offset(CGSize(width: 0, height: -10))
                    }
                    .frame(width: 308, height: 356)
                    .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                } else {
                    Text(progressViewModel.contact.descriptionText)
                        .padding(20)
                        .frame(width: 308, height: 356)
                        .font(.custom("MadimiOne-Regular", size: 30))
                        .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                }
                
                HStack(spacing: 50) {
                    Button(action: {
                        withAnimation {
                            currentIndex = currentIndex - 1
                            itemIndex = itemIndex - 1
                            disableButton()
                        }
                    }) {
                        Image(ProgressModel.ImageName.backArrowProgressButton.rawValue)
                            .frame(width: 72, height: 72)
                            .padding(2)
                            .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                            .cornerRadius(20)
                            .opacity(self.opacityBackdButton)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray)
                            )
                    }
                    .disabled(isBackButtonDisable)
                    
                    Button(action: {
                        withAnimation {
                            currentIndex = currentIndex + 1
                            itemIndex = itemIndex + 1
                            disableButton()
                        }
                    }) {
                        Image(ProgressModel.ImageName.forwardArrowProgressButton.rawValue)
                            .frame(width: 72, height: 72)
                            .padding(2)
                            .background((Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))))
                            .cornerRadius(20)
                            .opacity(self.opacityForwardButton)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray)
                            )
                    }
                    .disabled(isForwardButtonDisable)
                }
                .offset(y: -50)
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(EdgeInsets(top: 45, leading: 0, bottom: 0, trailing: 0))
            }
            .navigationBarBackButtonHidden(true)
        }
    }


#Preview {
    ProgressView()
}
