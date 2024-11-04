import SwiftUI

@main
struct HandyAPP: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainPage()
            }.navigationViewStyle(.stack)
                .statusBarHidden(true)
        }
    }
    
    init() {
        let fontURL = Bundle.main.url(forResource: "PatrickHand-Regular", withExtension: "ttf")!
        CTFontManagerRegisterFontsForURL(fontURL as CFURL, CTFontManagerScope.process, nil)
    }
}
