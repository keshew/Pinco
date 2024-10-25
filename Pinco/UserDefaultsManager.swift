import Foundation

enum Keys: String {
    case moneyKey = "moneyKey"
    case lifesKey = "lifesKey"
    case earlyKey = "earlyKey"
    case recordDataSinceFirstLaunchKey = "firstLaunchKey"
    case isFirstLauchKey = "hasLaunchedBefore"
    case indexForStage = "indexForStage"
}

class UserDefaultsManager {
    static let defaults = UserDefaults.standard
    
    func currentAvailbleGifts() {
        if let firstLaunchDate =  UserDefaultsManager.defaults.object(forKey: Keys.recordDataSinceFirstLaunchKey.rawValue) as? Date {
            let daysPassed = Calendar.current.dateComponents([.day], from: firstLaunchDate, to: Date()).day ?? 0
            
            if daysPassed < 7 {
                var array = [""]
                if let savedData = UserDefaultsManager.defaults.data(forKey: Keys.earlyKey.rawValue) {
                    let decoder = JSONDecoder()
                    if let loadedArray = try? decoder.decode([String].self, from: savedData) {
                        array =  loadedArray
                    }
                }
                let range = daysPassed...daysPassed
                array[range] = ["CLAIM"]
                UserDefaultsManager().add(isReadyToGet: array)
            }
        }
    }
    
    func save(countMoney: Int, countLifes: Int, isReadyToGet: [String], currentStage: Int) {
        if UserDefaultsManager.defaults.string(forKey: Keys.moneyKey.rawValue) == nil, UserDefaultsManager.defaults.string(forKey: Keys.lifesKey.rawValue) == nil, UserDefaultsManager.defaults.string(forKey: Keys.earlyKey.rawValue) == nil {
            UserDefaultsManager.defaults.set(countMoney, forKey: Keys.moneyKey.rawValue)
            UserDefaultsManager.defaults.set(currentStage, forKey: Keys.indexForStage.rawValue)
            UserDefaultsManager.defaults.set(countLifes, forKey: Keys.lifesKey.rawValue)
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(isReadyToGet) {
                UserDefaultsManager.defaults.set(encoded, forKey: Keys.earlyKey.rawValue)
            }
        }
    }
    
    func add(stage: Int) {
        if  UserDefaultsManager.defaults.integer(forKey: Keys.indexForStage.rawValue) <= 7 {
            var currentValue = UserDefaultsManager.defaults.integer(forKey: Keys.indexForStage.rawValue)
            UserDefaultsManager.defaults.set(currentValue + stage, forKey: Keys.indexForStage.rawValue)
        }
    }
    
    func add(isReadyToGet: [String]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(isReadyToGet) {
            UserDefaultsManager.defaults.set(encoded, forKey: Keys.earlyKey.rawValue)
        }
    }

    func add(money: Int) {
        let current = UserDefaultsManager.defaults.object(forKey: Keys.moneyKey.rawValue)
        UserDefaultsManager.defaults.set(current as! Int + money, forKey: Keys.moneyKey.rawValue)
    }
    
    func add(lifes: Int) {
        let current = UserDefaultsManager.defaults.object(forKey: Keys.lifesKey.rawValue)
        UserDefaultsManager.defaults.set(current as! Int + lifes, forKey: Keys.lifesKey.rawValue)
    }
    
    func minus(money: Int) {
        let current = UserDefaultsManager.defaults.object(forKey: Keys.moneyKey.rawValue) as! Int
        if current > money {
            UserDefaultsManager.defaults.set(current - money, forKey: Keys.moneyKey.rawValue)
        }
    }
    
    func minus(lifes: Int) {
        let current = UserDefaultsManager.defaults.object(forKey: Keys.lifesKey.rawValue) as! Int
        if current > lifes {
            UserDefaultsManager.defaults.set(current - lifes, forKey: Keys.lifesKey.rawValue)
        }
    }
    
    func checkFirstLaunch() {
        if UserDefaultsManager.defaults.object(forKey: Keys.recordDataSinceFirstLaunchKey.rawValue) == nil {
            UserDefaultsManager.defaults.set(Date(), forKey: Keys.recordDataSinceFirstLaunchKey.rawValue)
            } else {
                if let firstLaunchDate =  UserDefaultsManager.defaults.object(forKey: Keys.recordDataSinceFirstLaunchKey.rawValue) as? Date {
                    let daysPassed = Calendar.current.dateComponents([.day], from: firstLaunchDate, to: Date()).day ?? 0
                    print("Количество дней с первого запуска: \(daysPassed)")
                }
            }
        }
    }
                
