import Foundation

/// Defines a common interface for network operations.
///
/// Implementations of this protocol perform HTTP requests against a
/// backend service and decode the results into strongly typed models.
/// By abstracting the network layer behind this protocol it becomes
/// trivial to supply mocks during testing. Errors are surfaced via
/// Swift's `Error` type.
protocol APIClient {
    /// Executes a request for the given endpoint and decodes the
    /// resulting JSON into the supplied type.
    ///
    /// - Parameters:
    ///   - endpoint: The specification of the API route including
    ///     path, method, query and body.
    /// - Returns: A decoded instance of the expected result type.
    /// - Throws: `APIError` or decoding errors when something goes
    ///   wrong during the request lifecycle.
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}

/// A set of network error categories surfaced by the API client.
enum APIError: Error, LocalizedError {
    /// Thrown when the URL cannot be constructed or the response
    /// cannot be interpreted as `HTTPURLResponse`.
    case invalidResponse
    /// Thrown when the server responds with a non‑success status code
    /// outside the range 200–299. The associated value carries the
    /// status code.
    case statusCode(Int)
    /// Thrown when a decoding error occurs while decoding JSON into
    /// the expected type. The associated value is the underlying
    /// decoding error.
    case decoding(Error)

    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid response from server."
        case .statusCode(let code):
            return "Received HTTP status code \(code)."
        case .decoding(let error):
            return "Decoding error: \(error.localizedDescription)"
        }
    }
}