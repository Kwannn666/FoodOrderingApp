import Foundation
import Combine

/// A dependency injection container for resolving app services.
///
/// This observable object owns instances of services used across the
/// application. It can be passed through SwiftUI's environment to
/// allow views and view models to retrieve dependencies. Having a
/// container also makes it trivial to swap live implementations with
/// mocks for unit testing.
final class DIContainer: ObservableObject {
    /// The current environment configuration (base URL, store ID, etc).
    let environment: Environment

    /// The API client responsible for executing HTTP requests.
    let apiClient: APIClient

    /// Creates a new container with the supplied environment and API
    /// client. Defaults to using the `LiveAPIClient` implementation.
    init(environment: Environment, apiClient: APIClient = LiveAPIClient()) {
        self.environment = environment
        self.apiClient = apiClient
    }
}