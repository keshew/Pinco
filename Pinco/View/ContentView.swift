import SwiftUI

struct ContentView: View {
    @State private var isFirstLaunch: Bool = false

    var body: some View {
        VStack {
            if isFirstLaunch {
                FirstLaunchView()
            } else {
                MenuView()            }
        }
        .onAppear(perform: checkFirstLaunch)
    }

    func checkFirstLaunch() {
        isFirstLaunch = !UserDefaults.standard.bool(forKey: "hasLaunchedBefore")

        if isFirstLaunch {
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
        }
    }
}

#Preview {
    ContentView()
}
