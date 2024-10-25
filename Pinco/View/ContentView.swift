import SwiftUI

struct ContentView: View {
    @State private var isFirstLaunch: Bool = false
    
    var body: some View {
        VStack {
            if isFirstLaunch {
                FirstLaunchView()
            } else {
                MenuView()
            }
        }
        .onAppear(perform: checkFirstLaunch)
    }

    func checkFirstLaunch() {
        isFirstLaunch = !UserDefaults.standard.bool(forKey: Keys.isFirstLauchKey.rawValue)
        UserDefaultsManager().checkFirstLaunch()
        if isFirstLaunch {
            UserDefaultsManager.defaults.set(true, forKey: Keys.isFirstLauchKey.rawValue)
            UserDefaultsManager().save(countMoney: 2500, countLifes: 4, isReadyToGet:   ["CLAIM",
                                                                                        "EARLY",
                                                                                        "EARLY",
                                                                                        "EARLY",
                                                                                        "EARLY",
                                                                                        "EARLY",
                                                                                        "EARLY"],
                                       currentStage: 0)
        }
    }
}

#Preview {
    ContentView()
}
