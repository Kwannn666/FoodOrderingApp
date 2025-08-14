import SwiftUI

/// The root content view of the app.
///
/// This view demonstrates the basic structure of a navigation stack
/// and serves as a placeholder for further features. It also
/// demonstrates how to access the dependency container via the
/// environment.
struct ContentView: View {
    @EnvironmentObject private var container: DIContainer

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Welcome to the Food Ordering App")
                    .font(.headline)

                // Example usage of the environment configuration.
                if let store = container.environment.storeID {
                    Text("Store ID: \(store)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                NavigationLink("Show Placeholder") {
                    PlaceholderView()
                }
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}

/// A simple placeholder view demonstrating navigation.
struct PlaceholderView: View {
    var body: some View {
        Text("This is a placeholder screen.")
            .navigationTitle("Placeholder")
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DIContainer(environment: Environment()))
    }
}
#endif