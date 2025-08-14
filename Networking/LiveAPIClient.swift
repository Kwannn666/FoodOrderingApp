import Foundation

/// A concrete implementation of `APIClient` that leverages
/// `URLSession` to perform network requests.
///
/// This class can be instantiated with a custom URL session to
/// facilitate dependency injection and testing. It performs basic
/// error handling and decodes JSON into the requested type.
final class LiveAPIClient: APIClient {
    /// The underlying URL session used to perform requests. Defaults
    /// to `URLSession.shared`.
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func request<T>(_ endpoint: Endpoint) async throws -> T where T : Decodable {
        // Construct the URL by combining the scheme, host and path. In a
        // production implementation you would inject the base URL from
        // the environment. For this skeleton we'll assemble a URL
        // directly from the endpoint.
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.example.com"
        components.path = endpoint.path
        if !endpoint.queryItems.isEmpty {
            components.queryItems = endpoint.queryItems
        }

        guard let url = components.url else {
            throw APIError.invalidResponse
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        request.httpBody = endpoint.body
        if let body = endpoint.body {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        // Perform the network request using async/await. The tuple
        // returned contains both the data and the URL response.
        let (data, response) = try await session.data(for: request)

        // Ensure the response is an HTTP response to inspect the status
        // code.
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        // Check for success (2XX) status codes. Anything outside the
        // range triggers a status code error.
        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIError.statusCode(httpResponse.statusCode)
        }

        // Attempt to decode the response into the desired type using a
        // JSON decoder. If decoding fails, wrap the underlying error
        // into `APIError.decoding`.
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decoding(error)
        }
    }
}