import Foundation

struct ProgressModel {
    
    public enum ImageName: String {
        case progressViewBackground = "progressViewBackground"
        case backgroundSettingsButton = "backgroundSettingsButton"
        case backButton = "backButton"
        case backArrowProgressButton = "backArrowProgressButton"
        case forwardArrowProgressButton = "forwardArrowProgressButton"
        case backButton3 = "backgroundSettings1Button"
    }
    
    var descriptionText = "IN THIS STAGE YOU NEED TO COLLECT ALL THE ELEMENTS OF THE KITCHEN TO AND COLLECT"
    var procentProgressArray = ["0%",
                                "15%",
                                "30%",
                                "45%",
                                "60%",
                                "75%",
                                "90%",
                                "100%"]
    var levelProgressArray =   ["LEVEL 1",
                                "LEVEL 2",
                                "LEVEL 3",
                                "LEVEL 4",
                                "LEVEL 5",
                                "LEVEL 6",
                                "LEVEL 7"]
    var itemProgressArray =     ["MICROWAVE",
                                 "TOUCHBOX",
                                 "SPIRITUAL",
                                 "SINK",
                                 "CUPBOARD",
                                 "FRIDGE",
                                 "GAS STOVE"]
    var imageProgressArray =    ["microvawe",
                                 "touchbox",
                                 "spiritual",
                                 "sink",
                                 "cupboard",
                                 "fridge",
                                 "gasStove"]
}
