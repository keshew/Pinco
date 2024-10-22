import SwiftUI

struct Cell {
    var string: String?
    var image: String?
    var positon: CGPoint?
}

struct GameView: View {
    @State private var timer: Timer?
    @Environment(\.presentationMode) var presentationMode
    @State private var isLostGame = false
    @State private var timeRemaining = 120
    @State private var currentGoalCount = 3
    @State private var offset = CGSize.zero
    @State private var board: [[Cell]] = Array(repeating: Array(repeating: Cell(string: nil, image: nil), count: 7), count: 9)
    let goalCountArray = [3,3,3,3]
    let itemsArray: [String: String] = ["bowlImage": "bowlImage",
                                        "bowlPureeImage": "bowlPureeImage",
                                        "bowlWoodImage": "bowlWoodImage",
                                        "breadboxImage": "breadboxImage",
                                        "carafeeWaterImage": "carafeeWaterImage",
                                        "cheeseImage": "cheeseImage",
                                        "cookingСupImage": "cookingСupImage",
                                        "cupRedHandledImage": "cupRedHandledImage",
                                        "cupWaterImage": "cupWaterImage",
                                        "forkImage": "forkImage",
                                        "greenCupImage": "greenCupImage",
                                        "jucieCupImage": "jucieCupImage",
                                        "ovenImage": "ovenImage",
                                        "plateWithSpoonImage": "plateWithSpoonImage",
                                        "potImage": "potImage",
                                        "potWaterImage": "potWaterImage",
                                        "redGrafeeImage": "redGrafeeImage",
                                        "spatulaImage": "spatulaImage",
                                        "whiteCupWithSpoonImage": "whiteCupWithSpoonImage",
                                        "yellowCooklngCupImage": "yellowCooklngCupImage"]
    
    let goalImageArray: [String] = ["bowlWoodImage",
                                    "plateWithSpoonImage",
                                    "potWaterImage",
                                    "cheeseImage"]
    
    private func swapCellsToBottom(row1: Int, col1: Int) {
        let row2 = (row1 + 1) % board.count
        let temp = board[row1][col1]
        board[row1][col1] = board[row2][col1]
        board[row2][col1] = temp
    }
    private func swapCellsToTop(row1: Int, col1: Int) {
        let row2 = (row1 - 1) % board.count
        let temp = board[row1][col1]
        board[row1][col1] = board[row2][col1]
        board[row2][col1] = temp
    }
    private func swapCellsToLeft(row1: Int, col1: Int) {
        let col2 = (col1 - 1) % board.count
        let temp = board[row1][col1]
        board[row1][col1] = board[row1][col2]
        board[row1][col2] = temp
    }
    private func swapCellsToRight(row1: Int, col1: Int) {
        let col2 = (col1 + 1) % board.count
        let temp = board[row1][col1]
        board[row1][col1] = board[row1][col2]
        board[row1][col2] = temp
    }
    
    func previousPosition(row: Int, col: Int) {
        board[row][col] = board[row][col]
    }
    func setupBoard() {
        // Заполнение игрового поля случайными значениями
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                let randomKey = itemsArray.keys.randomElement()
                board[row][col] = Cell(string: itemsArray[randomKey!], image: itemsArray[randomKey!], positon: CGPoint(x: row, y: col))
            }
        }
    }
    func checkForMatches(board: [[Cell]]) -> Bool {
        var matches: [(Int, Int)] = []
        // Проверка по горизонтали
        //перечисление от нуля до всех внутренних массивов внешнего (5 штук)
        for row in 0..<board.count {
            //перечисление от нуля до элементов каждого внутреннего массива(5штук) - 2 (чтобы было три в ряд)
            for col in 0..<board[row].count - 2 {
                //идет проверка и переменной инциаилизаруется значение элемента внутреннего массива например 1
                if let value = board[row][col].string,
                   //если это значение равняется с соседним элементом
                   value == board[row][col + 1].string,
                   //если это значение равняется с элементом через один элемент
                   value == board[row][col + 2].string {
                    //доавляем эти значения в массив
                    matches.append((row, col))
                    matches.append((row, col + 1))
                    matches.append((row, col + 2))
                }
            }
        }
    
        // Проверка по вертикали
        for col in 0..<board[0].count {
            for row in 0..<board.count - 2 {
                if let value = board[row][col].string,
                   value == board[row + 1][col].string,
                   value == board[row + 2][col].string {
                    matches.append((row, col))
                    matches.append((row + 1, col))
                    matches.append((row + 2, col))
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
        
        if !matches.isEmpty {
            return false
        } else {
            return true
        }
    }
    func startTimer() {
        timeRemaining = 120
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.timer?.invalidate()
                isLostGame = true
            }
        }
    }
    var body: some View {
        ZStack {
            Image("progressViewBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            HStack {
                Button(action: {
                    // BACK ACTION
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
                Spacer().frame(width: 25)
                
                Text("LEVEL 1")
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
                Spacer().frame(width: 15)
                
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
            .offset(x: 0, y: -340)
            
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
                    ForEach(0..<goalImageArray.count, id: \.self) { index in
                        ZStack {
                            Image(goalImageArray[index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                                .background((Color(#colorLiteral(red: 241/255, green: 215/255, blue: 215/255, alpha: 1))))
                                .cornerRadius(10)
                            
                            Text("x\(currentGoalCount)")
                                .font(.custom("MadimiOne-Regular", size: 18))
                                .foregroundColor(.yellow)
                                .offset(x: 18, y: 20)
                        }
                    }
                }
            }
            .offset(x: 2, y: -260)
            
            VStack {
                ForEach(0..<board.count, id: \.self) { row in
                    HStack {
                        ForEach(0..<board[row].count, id: \.self) { col in
                            Image ("\(board[row][col].image ?? "ovenImage" )")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 45)
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
//                                        print(checkForMatches(board: board))
                                    }
                                }
                                .gesture(
                                    withAnimation {
                                        DragGesture()
                                            .onChanged { value in
//                                                self.offset = value.translation
                                            }
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
            .frame(width: 370, height: 440)
            .background(Color(#colorLiteral(red: 247/255, green: 218/255, blue: 217/255, alpha: 1)))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(#colorLiteral(red: 182/255, green: 77/255, blue: 77/255, alpha: 1)), lineWidth: 5)
            )
            .offset(y: 10)
            .onAppear {
                setupBoard()
                startTimer()
            }
            VStack {
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
                .offset(y: 5)
                
                Button(action: {
                    print("Кнопка магазина нажата")
                }) {
                    ZStack {
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
                    .frame(width: 104, height: 104)
                }
            }
            .offset(x: 80, y: 315)
            
            VStack {
                ZStack {
                    Image("moneyBackground")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 96, height: 36)
                        .cornerRadius(15)
                        .offset(x: 5, y: 13)
                    
                    Text("2500")
                        .font(.custom("MadimiOne-Regular", size: 18))
                        .foregroundColor(.yellow)
                        .offset(x: 20, y: 13)
                    
                    
                    Image("moneyCount")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 65, height: 65)
                        .offset(x: -30, y: 13)
                }
                .offset(y: 5)
                
                Button(action: {
                    print("Кнопка магазина нажата")
                }) {
                    ZStack {
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
                    .frame(width: 104, height: 104)
                }
            }
            .offset(x: -80, y: 315)
        }
        .navigationDestination(isPresented: $isLostGame) {
            LoseView()
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    GameView()
}


