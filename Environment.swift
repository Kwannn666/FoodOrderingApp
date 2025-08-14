import Foundation

/// A simple environment model holding configuration values for the app.
///
/// This struct can be extended to store additional settings such as
/// brand or locale. Values can be overridden at runtime to support
/// different environments (development, staging, production) without
/// recompiling the app.
struct Environment {
    /// Base URL for the API endpoints. Should point at your back‑end
    /// server. The default here is a placeholder and should be
    /// configured per deployment.
    var baseURL: URL = URL(string: "https://api.example.com")!

    /// Optional restaurant or store identifier. When present this value
    /// scopes network requests to a specific branch.
    var storeID: String?

    /// Optional table identifier for dine‑in QR sessions. When set the
    /// ordering flow will automatically attach this table number to
    /// newly created orders.
    var tableID: String?
}