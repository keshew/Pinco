import SwiftUI

struct Cell {
    var string: String?
    var image: String?
    var positon: CGPoint?
}

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentIndex = UserDefaultsManager.defaults.integer(forKey: Keys.indexForStage.rawValue)
    @State private var timer: Timer?
    @State private var expainToolLabel = "THE SHOVEL TOOL, ALLOWS TO CLEAR 1 BLOCK, DOES NOT FUNCTION ON SEALED BLOCKS"
    @State private var isLostGame = false
    @State private var isPuasedGame = false
    @State private var isVictoryGame = false
    @State private var isShowelPicked = false
    @State private var isHummerPicked = false
    @State var timeRemaining = 120
    @State var opacityForScreen: CGFloat = 1
    @State var opacityForHummer: CGFloat = 1
    @State var opacityForShowel: CGFloat = 1
    @State private var offset = CGSize.zero
    @State private var board: [[Cell]] = Array(repeating: Array(repeating: Cell(string: nil, image: nil), count: 7), count: 9)
    private let itemsArray: [String: String] = ["bowlImage": "bowlImage",
                                                "plateWithSpoonImage": "plateWithSpoonImage",
                                                "cheeseImage": "cheeseImage",
                                                "bowlWoodImage": "bowlWoodImage",
                                                "potWaterImage": "potWaterImage",
//                                                "bowlPureeImage": "bowlPureeImage",
//                                                "breadboxImage": "breadboxImage",
//                                                "carafeeWaterImage": "carafeeWaterImage",
//                                                "cookingСupImage": "cookingСupImage",
//                                                "cupRedHandledImage": "cupRedHandledImage",
//                                                "cupWaterImage": "cupWaterImage",
//                                                "forkImage": "forkImage",
//                                                "greenCupImage": "greenCupImage",
//                                                "jucieCupImage": "jucieCupImage",
//                                                "ovenImage": "ovenImage",
//                                                "potImage": "potImage",
//                                                "redGrafeeImage": "redGrafeeImage",
//                                                "spatulaImage": "spatulaImage",
//                                                "whiteCupWithSpoonImage": "whiteCupWithSpoonImage",
//                                                "yellowCooklngCupImage": "yellowCooklngCupImage",
                                                
                                                "bombTool": "bombTool",
                                                "greandeTool": "greandeTool",
                                                "rocketTool": "rocketTool",
                                                
    ]
    
//    private let goalImageArray: [String] = ["bowlWoodImage",
//                                    "plateWithSpoonImage",
//                                    "potWaterImage",
//                                    "cheeseImage"]
    
   @State private var goalImageDictionary: [String: Int] = ["bowlWoodImage": 3,
                                                      "plateWithSpoonImage": 3,
                                                      "potWaterImage": 3,
                                                      "cheeseImage": 3]
    private let goalCountArray = [3,3,3,3]
    private func swapCellsToBottom(row1: Int, col1: Int) {
        let row2 = (row1 + 1) % board.count
        let temp = board[row1][col1]
        if row2 > 0 {
            board[row1][col1] = board[row2][col1]
            board[row2][col1] = temp
        }
    }
    private func swapCellsToTop(row1: Int, col1: Int) {
        let row2 = (row1 - 1) % board.count
        let temp = board[row1][col1]
        if row2 > 0 {
            board[row1][col1] = board[row2][col1]
            board[row2][col1] = temp
        }
    }
    private func swapCellsToLeft(row1: Int, col1: Int) {
        let col2 = (col1 - 1) % board.count
        let temp = board[row1][col1]
        if col2 >= 0 {
            board[row1][col1] = board[row1][col2]
            board[row1][col2] = temp
        }
    }
    private func swapCellsToRight(row1: Int, col1: Int) {
        let col2 = (col1 + 1) % board.count
        let temp = board[row1][col1]
        if col2 < 7 {
            board[row1][col1] = board[row1][col2]
            board[row1][col2] = temp
        }
    }
    
    func loseGame() { 
        UserDefaultsManager().minus(lifes: 1)
    }
    
    func useAchieve(row: Int, col: Int) {
        
        if board[row][col].string == "rocketTool" {
            let nameOfImageGoal = Array(goalImageDictionary.keys)
            var matches: [(Int, Int)] = []
            matches.append((row + 1, col))
            matches.append((row, col))
            matches.append((row - 1, col))
            
            let value = board[row][col].string
            
            for index in matches {
                for item in nameOfImageGoal {
                    if value == item || board[row + 1][col].string == item || board[row - 1][col].string == item {
                        if goalImageDictionary[value ?? ""] ?? 0 > 0 {
                            goalImageDictionary[value ?? ""] = (goalImageDictionary[value ?? ""] ?? 0) - 1
                        }
                    }
                }
                
                if index > (0,0), index <= (8,9) {
                    self.board[index.0][index.1] = Cell(string: "toolEffect", image: "toolEffect")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            let randomKey = itemsArray.keys.randomElement()
                            self.board[index.0][index.1] = Cell(string: itemsArray[randomKey!], image: itemsArray[randomKey!])
                        }
                    }
                }
            }
        } else if board[row][col].string == "greandeTool" {
            let nameOfImageGoal = Array(goalImageDictionary.keys)
            var matches: [(Int, Int)] = []
            matches.append((row - 1, col - 1))
            matches.append((row - 1, col  + 1))
            matches.append((row - 1, col))
            matches.append((row, col - 1))
            matches.append((row, col))
            matches.append((row, col + 1))
            matches.append((row + 1, col))
            matches.append((row + 1, col + 1))
            matches.append((row + 1, col - 1))

            let value = board[row][col].string
            
            for index in matches {
                for item in nameOfImageGoal {
                    if value == item {
                        if goalImageDictionary[value ?? ""] ?? 0 > 0 {
                            goalImageDictionary[value ?? ""] = (goalImageDictionary[value ?? ""] ?? 0) - 1
                        }
                    }
                }
                if index > (0,0), index <= (8,8), index.1 >= 0, index.1 <= 6 {
                    self.board[index.0][index.1] = Cell(string: "toolEffect", image: "toolEffect")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            let randomKey = itemsArray.keys.randomElement()
                            self.board[index.0][index.1] = Cell(string: itemsArray[randomKey!], image: itemsArray[randomKey!])
                        }
                    }
                }
            }
        } else if board[row][col].string == "bombTool" {
            let nameOfImageGoal = Array(goalImageDictionary.keys)
            var matches: [(Int, Int)] = []
            matches.append((row - 1, col))
            matches.append((row, col - 1))
            matches.append((row, col))
            matches.append((row, col + 1))
            matches.append((row + 1, col))
            
            let value = board[row][col].string
            for index in matches {
                for item in nameOfImageGoal {
                    if value == item {
                        if goalImageDictionary[value ?? ""] ?? 0 > 0 {
                            goalImageDictionary[value ?? ""] = (goalImageDictionary[value ?? ""] ?? 0) - 1
                        }
                    }
                }
                
                if index > (0,0), index <= (8,8), index.1 >= 0, index.1 <= 6 {
                    self.board[index.0][index.1] = Cell(string: "toolEffect", image: "toolEffect")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            let randomKey = itemsArray.keys.randomElement()
                            self.board[index.0][index.1] = Cell(string: itemsArray[randomKey!], image: itemsArray[randomKey!])
                        }
                    }
                }
            }
        }
    }
    
    func useShowelTool(row: Int, col: Int) {
        let nameOfImageGoal = Array(goalImageDictionary.keys)
        if isShowelPicked {
            var matches: [(Int, Int)] = []
            matches.append((row, col))
            let value = board[row][col].string
            for index in matches {
                for item in nameOfImageGoal {
                    if value == item {
                        if goalImageDictionary[value ?? ""] ?? 0 > 0 {
                            goalImageDictionary[value ?? ""] = (goalImageDictionary[value ?? ""] ?? 0) - 1
                        }
                    }
                }
                withAnimation(.easeInOut(duration: 1)) {
                    self.board[index.0][index.1] = Cell(string: "toolEffect", image: "toolEffect")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        let randomKey = itemsArray.keys.randomElement()
                        self.board[index.0][index.1] = Cell(string: itemsArray[randomKey!], image: itemsArray[randomKey!])
                      }
                }
            }
        }
        isShowelPicked = false
        UserDefaultsManager().minus(money: 50)
    }
    
    func openToolsLevels() {
        currentIndex = UserDefaultsManager.defaults.integer(forKey: Keys.indexForStage.rawValue)
        if currentIndex == 2  {
            opacityForScreen = 0.2
            opacityForHummer = 0.2
        } else if currentIndex == 4  {
            opacityForScreen = 0.2
            opacityForShowel = 0.2
            expainToolLabel = "THE HAMMER TOOL, BREAKS ANY BLOCK, INCLUDING A SEALED ONE"
        }
    }
    
    func previousPosition(row: Int, col: Int) {
        board[row][col] = board[row][col]
    }
    
    func setupBoard() {
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                let randomKey = itemsArray.keys.randomElement()
                board[row][col] = Cell(string: itemsArray[randomKey!], image: itemsArray[randomKey!], positon: CGPoint(x: row, y: col))
            }
        }
    }
    
    func checkForMatches(board: [[Cell]]) -> Bool {
        let nameOfImageGoal = Array(goalImageDictionary.keys)
        let countOfMatchesGoal = Array(goalImageDictionary.values)
        let allZeros = countOfMatchesGoal.allSatisfy { $0 == 0 }
        var matches: [(Int, Int)] = []
        for row in 0..<board.count {
            for col in 0..<board[row].count - 2 {
                if let value = board[row][col].string,
                   value == board[row][col + 1].string,
                   value == board[row][col + 2].string {
                    matches.append((row, col))
                    matches.append((row, col + 1))
                    matches.append((row, col + 2))
                   
                    for item in nameOfImageGoal {
                        if value == item {
                            goalImageDictionary[value] = 0
                        }
                    }
                }
            }
        }
    
        for col in 0..<board[0].count {
            for row in 0..<board.count - 2 {
                if let value = board[row][col].string,
                   value == board[row + 1][col].string,
                   value == board[row + 2][col].string {
                    matches.append((row, col))
                    matches.append((row + 1, col))
                    matches.append((row + 2, col))
                    for item in nameOfImageGoal {
                        if value == item {
                            goalImageDictionary[value] = 0
                        }
                    }
                }
            }
        }
        
        for index in matches {
            withAnimation(.easeInOut(duration: 1)) {
                self.board[index.0][index.1] = Cell(string: nil, image: nil)
                let randomKey = itemsArray.keys.randomElement()
                self.board[index.0][index.1] = Cell(string: itemsArray[randomKey!], image: itemsArray[randomKey!])
            }
        }
        
        if allZeros {
            isVictoryGame = true
            self.timer?.invalidate()
        }
        
        if !matches.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                _ = checkForMatches(board: board)
            } else {
                self.timer?.invalidate()
                isLostGame = true
                loseGame()
            }
        }
    }
    

    var body: some View {
        ZStack {
            Image("progressViewBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(opacityForScreen)
                .background(.black)
            
            VStack {
                HStack(spacing: 15) {
                    Button(action: {
                        isPuasedGame = true
                        self.timer?.invalidate()
                        print(timeRemaining)
                    }) {
                        ZStack {
                            Image("backgroundSettingsButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 55, height: 55)
                                .cornerRadius(15)
                            
                            Image("pauseButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24.4, height: 24.4)
                        }
                        .frame(width: 63, height: 63)
                    }
                    
                    Text("LEVEL \(currentIndex + 1)")
                        .frame(width: 180, height: 68)
                        .font(.custom("MadimiOne-Regular", size: 30))
                        .background((Color(#colorLiteral(red: 154/255, green: 34/255, blue: 32/255, alpha: 0.95))))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(#colorLiteral(red: 217/255, green: 175/255, blue: 68/255, alpha: 1)), lineWidth: 3)
                        )
                    
                    Text("\(timeRemaining / 60):\(timeRemaining % 60)")
                        .frame(width: 70, height: 70)
                        .font(.custom("MadimiOne-Regular", size: 30))
                        .background((Color(#colorLiteral(red: 154/255, green: 34/255, blue: 32/255, alpha: 0.95))))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(#colorLiteral(red: 217/255, green: 175/255, blue: 68/255, alpha: 1)), lineWidth: 3)
                        )
                }
               
                ZStack {
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 154/255, green: 34/255, blue: 32/255, alpha: 0.95)))
                        .frame(width: 226, height: 58)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(#colorLiteral(red: 217/255, green: 175/255, blue: 68/255, alpha: 1)), lineWidth: 3)
                        )
                    HStack(spacing: 8) {
                        ForEach(0..<goalImageDictionary.keys.count, id: \.self) { index in
                            ZStack {
                                let nameOfImageGoal = Array(goalImageDictionary.keys)
                                let countOfImageGoal = Array(goalImageDictionary.values)
                                Image(nameOfImageGoal[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45, height: 45)
                                    .background((Color(#colorLiteral(red: 241/255, green: 215/255, blue: 215/255, alpha: 1))))
                                    .cornerRadius(10)
                                
                                Text("x\(countOfImageGoal[index])")
                                    .font(.custom("MadimiOne-Regular", size: 18))
                                    .foregroundColor(.yellow)
                                    .offset(x: 18, y: 20)
                            }
                        }
                    }
                }
            }
            .opacity(opacityForScreen)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
            ZStack {
                Text(expainToolLabel)
                    .frame(width: 300, height: 300)
                    .multilineTextAlignment(.center)
                    .font(.custom("MadimiOne-Regular", size: 30))
                    .foregroundColor(.white)
                VStack {
                    ForEach(0..<board.count, id: \.self) { row in
                        HStack {
                            ForEach(0..<board[row].count, id: \.self) { col in
                                Image ("\(board[row][col].image ?? "ovenImage" )")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35, height: 40)
                                    .padding(2)
                                    .offset(x: self.offset.width, y: self.offset.height)
                                    .padding(.vertical, -2)
                                    .background(Color(#colorLiteral(red: 227/255, green: 171/255, blue: 172/255, alpha: 1)))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(#colorLiteral(red: 182/255, green: 77/255, blue: 77/255, alpha: 1)), lineWidth: 3)
                                    )
                                    .cornerRadius(10)
                                    .onTapGesture {
                                        withAnimation {
                                            useShowelTool(row: row, col: col)
                                            useAchieve(row: row, col: col)
                                        }
                                    }
                                    .gesture(
                                        withAnimation {
                                            DragGesture()
    //                                            .onChanged { value in
    //
    //                                            }
                                                .onEnded { value in
                                                    if abs(value.translation.width) > abs(value.translation.height) {
                                                        if value.translation.width < 0 {
                                                            swapCellsToLeft(row1: row, col1: col)
                                                            if checkForMatches(board: board) {
                                                                swapCellsToLeft(row1: row, col1: col)
                                                            } else {
                                                                previousPosition(row: row, col: col)
                                                            }
                                                        } else {
                                                            swapCellsToRight(row1: row, col1: col)
                                                            if checkForMatches(board: board) {
                                                                swapCellsToRight(row1: row, col1: col)
                                                            } else {
                                                                previousPosition(row: row, col: col)
                                                            }
                                                        }
                                                    } else {
                                                        if value.translation.height < 0 {
                                                            swapCellsToTop(row1: row, col1: col)
                                                            if checkForMatches(board: board) {
                                                                swapCellsToTop(row1: row, col1: col)
                                                            } else {
                                                                previousPosition(row: row, col: col)
                                                            }
                                                        } else {
                                                            swapCellsToBottom(row1: row, col1: col)
                                                            if checkForMatches(board: board) {
                                                                swapCellsToBottom(row1: row, col1: col)
                                                            } else {
                                                                previousPosition(row: row, col: col)
                                                            }
                                                        }
                                                    }
                                                }
                                        })
                            }
                        }
                        .padding(.vertical, -3)
                    }
                    
                }
                .opacity(opacityForScreen)
                .frame(width: 350, height: 400)
                .background(Color(#colorLiteral(red: 247/255, green: 218/255, blue: 217/255, alpha: 1)))
                .opacity(opacityForScreen)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(#colorLiteral(red: 182/255, green: 77/255, blue: 77/255, alpha: 1)), lineWidth: 7)
                        .opacity(opacityForScreen)
                )
                
                .offset(y: 20)
                
             
            }
            
            HStack(spacing: 65) {
                VStack {
//                    ZStack {
//                        Image("moneyBackground")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 96, height: 36)
//                            .cornerRadius(15)
//                            .offset(x: 5, y: 13)
//
//                        Text("2500")
//                            .font(.custom("MadimiOne-Regular", size: 18))
//                            .foregroundColor(.yellow)
//                            .offset(x: 20, y: 13)
//
//
//                        Image("moneyCount")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 65, height: 65)
//                            .offset(x: -30, y: 13)
//                    }
                    
                    Button(action: {
                        if !isHummerPicked && UserDefaultsManager.defaults.object(forKey: Keys.moneyKey.rawValue) as! Int > 50 {
                            isShowelPicked = !isShowelPicked
                        }
                    }) {
                        ZStack {
                            if currentIndex >= 2 {
                                Image("backgroundSettingsButton")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 79, height: 79)
                                    .cornerRadius(15)
                                
                                Image("showelTool")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 85, height: 85)
                                    .offset(x: -5, y: -25)
                                    .rotationEffect(.degrees(15))
                                
                                HStack(spacing: 3) {
                                    Text("50")
                                        .font(.custom("MadimiOne-Regular", size: 18))
                                        .foregroundColor(.white)
                                        .bold()
                               
                                    Image("moneyCount")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 19, height: 19)
                                }
                                .offset(y: 20)
                            } else {
                                Image("backgroundSettingsButton")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 79, height: 79)
                                    .cornerRadius(15)
                                
                                Image("lockedImage")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 34, height: 34)
                                    .offset(y: -10)
                                
                                Text("level 3")
                                    .font(.custom("MadimiOne-Regular", size: 18))
                                    .foregroundColor(.white)
                                    .bold()
                                    .offset(y: 20)
                            }
                        }
                        .disabled(isShowelPicked)
                        .opacity(opacityForShowel)
                        .scaleEffect(isShowelPicked ? 1.15  : 1.0) // Уменьшаем кнопку при нажатии
                    }
                }
                
                VStack {
//                    ZStack {
//                        Image("moneyBackground")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 96, height: 36)
//                            .cornerRadius(15)
//                            .offset(x: 5, y: 13)
//
//                        Text("4")
//                            .font(.custom("MadimiOne-Regular", size: 18))
//                            .foregroundColor(.pink)
//                            .offset(x: 14, y: 13)
//
//                        Image("heartImage")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 65, height: 65)
//                            .offset(x: -30, y: 13)
//                    }
                    
                    Button(action: {
                        if !isShowelPicked && UserDefaultsManager.defaults.object(forKey: Keys.moneyKey.rawValue) as! Int > 100 {
                            isHummerPicked = !isHummerPicked
                        }
                    }) {
                        ZStack {
                            if currentIndex >= 4 {
                                Image("backgroundSettingsButton")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 79, height: 79)
                                    .cornerRadius(15)
                                
                                Image("hammerTool")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 85, height: 85)
                                    .offset(y: -20)
                                
                                HStack(spacing: 3) {
                                    Text("100")
                                        .font(.custom("MadimiOne-Regular", size: 18))
                                        .foregroundColor(.white)
                                        .bold()
                               
                                    Image("moneyCount")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 19, height: 19)
                                }
                                .offset(y: 20)
                            } else {
                                Image("backgroundSettingsButton")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 79, height: 79)
                                    .cornerRadius(15)
                                
                                Image("lockedImage")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 34, height: 34)
                                    .offset(y: -10)
                                
                                Text("level 5")
                                    .font(.custom("MadimiOne-Regular", size: 18))
                                    .foregroundColor(.white)
                                    .bold()
                                    .offset(y: 20)
                            }
                        }
                        .disabled(isHummerPicked)
                        .opacity(opacityForHummer)
                        .scaleEffect(isHummerPicked ? 1.15  : 1.0)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
        }
        
        .onTapGesture {
            opacityForScreen = 1.0
            opacityForShowel = 1.0
            opacityForHummer = 1.0
        }
        
        .onAppear {
            setupBoard()
            startTimer()
            currentIndex = UserDefaultsManager.defaults.integer(forKey: Keys.indexForStage.rawValue)
            openToolsLevels()
    }
        
        .navigationDestination(isPresented: $isLostGame) {
            LoseView()
        }
        .navigationDestination(isPresented: $isPuasedGame) {
            PauseView(timeRemaining: $timeRemaining)
        }
        
        .navigationDestination(isPresented: $isVictoryGame) {
            VictoryView()
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    GameView()
}
