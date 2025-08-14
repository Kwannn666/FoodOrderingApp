import Foundation

/// A mock implementation of `APIClient` for unit testing.
///
/// This client returns preconfigured results instead of performing
/// actual network calls. You can set the `responseData` property to
/// supply arbitrary JSON to decode. If `responseError` is non‑nil the
/// request will throw that error instead.
final class MockAPIClient: APIClient {
    /// Optional raw JSON data to return when a request is made. When
    /// `nil` the client will return an empty JSON object ("{}") which
    /// may fail to decode depending on the expected type.
    var responseData: Data?

    /// Optional error to throw instead of returning data. Useful for
    /// testing error handling in view models or use cases.
    var responseError: Error?

    func request<T>(_ endpoint: Endpoint) async throws -> T where T : Decodable {
        // If an error has been configured, throw it immediately.
        if let error = responseError {
            throw error
        }
        // Provide some default JSON (an empty object) when no data is
        // supplied. This allows decoding into empty structs.
        let data = responseData ?? Data("{}".utf8)
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decoding(error)
        }
    }
}