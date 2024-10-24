import Foundation

enum Keys: String {
    case moneyKey = "moneyKey"
    case lifesKey = "lifesKey"
    case earlyKey = "earlyKey"
    case recordDataSinceFirstLaunchKey = "firstLaunchKey"
    case isFirstLauchKey = "hasLaunchedBefore"
}

class UserDefaultsManager {
    static let defaults = UserDefaults.standard
    
    func save(countMoney: Int, countLifes: Int, isReadyToGet: [String]) {
        if UserDefaultsManager.defaults.string(forKey: Keys.moneyKey.rawValue) == nil, UserDefaultsManager.defaults.string(forKey: Keys.lifesKey.rawValue) == nil, UserDefaultsManager.defaults.string(forKey: Keys.earlyKey.rawValue) == nil {
            UserDefaultsManager.defaults.set(countMoney, forKey: Keys.moneyKey.rawValue)
            UserDefaultsManager.defaults.set(countLifes, forKey: Keys.lifesKey.rawValue)
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(isReadyToGet) {
                UserDefaultsManager.defaults.set(encoded, forKey: Keys.earlyKey.rawValue)
            }
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
    
    func checkFirstLaunch() {
        if UserDefaultsManager.defaults.object(forKey: Keys.recordDataSinceFirstLaunchKey.rawValue) == nil {
            UserDefaultsManager.defaults.set(Date(), forKey: Keys.recordDataSinceFirstLaunchKey.rawValue)
//                print("Первый запуск приложения.")
            } else {
                if let firstLaunchDate =  UserDefaultsManager.defaults.object(forKey: Keys.recordDataSinceFirstLaunchKey.rawValue) as? Date {
                    let daysPassed = Calendar.current.dateComponents([.day], from: firstLaunchDate, to: Date()).day ?? 0
                    print("Количество дней с первого запуска: \(daysPassed)")
                }
            }
        }
    }
                
