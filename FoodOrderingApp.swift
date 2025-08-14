import SwiftUI

/// The main entry point of the food ordering iOS application.
///
/// This struct creates a single `WindowGroup` scene and injects a
/// dependency container into the environment so that downstream views
/// can resolve their dependencies. Using `@StateObject` ensures the
/// container is created once and survives view reloads.
@main
struct FoodOrderingApp: App {
    @StateObject private var diContainer = DIContainer(environment: Environment())

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(diContainer)
        }
    }
}