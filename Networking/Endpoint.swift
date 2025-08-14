import Foundation

/// Represents an API endpoint and encapsulates the information needed
/// to construct a `URLRequest`.
///
/// Endpoints define the path relative to the base URL, HTTP method,
/// optional query items and an optional request body. They can be
/// composed to model your API surface in a type‑safe manner.
struct Endpoint {
    /// The relative path of the endpoint (e.g. "/menus"). Should
    /// always begin with a slash.
    let path: String

    /// The HTTP method for the request ("GET", "POST", etc.). Defaults
    /// to "GET".
    var method: String = "GET"

    /// Query parameters appended to the URL. Defaults to an empty
    /// array.
    var queryItems: [URLQueryItem] = []

    /// Optional body to include in the request. Provide encoded JSON
    /// data here for POST/PUT requests.
    var body: Data?
}