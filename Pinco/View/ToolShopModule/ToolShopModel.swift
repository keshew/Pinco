import Foundation

struct ToolShopModel {
    public enum Const: String {
        case menuImage = "menuImage"
        case pause = "PAUSE"
        case moneyBackground = "moneyBackground"
        case heartImage  = "heartImage"
        case moneyCount = "moneyCount"
        case menu = "menu"
        case backgrounDailyShopButton = "backgrounDailyShopButton"
        case homeButton = "homeButton"
        case gamePaused = "GAME PAUSED"
        case settingsButton = "settingsButton"
        case resume = "RESUME"
        case lightButton = "lightButton"
        case retryImage = "retryImage"
        case retry = "retry"
        case menuWoman = "menuWoman"
    }
    
    let items = Array(1...3)
    let labelArray = ["BEGGINER", "ADVANCED", "EXPERIENCED"]
    let amountLifes = [1, 3, 5]
    let priceForLifes = [150, 250, 450]
    let toolsImageArray = ["rocketTool", "greandeTool", "bombTool"]
    let sizeForImages: [CGFloat] = [120,120,120]
    
    
}
