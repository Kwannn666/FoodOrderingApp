# FoodOrderingApp v1

This repository contains a minimal skeleton for an iOS food ordering
application built using **SwiftUI**, **async/await** and a simple
**Clean Architecture** approach. The project demonstrates how to set
up a modular code base with dependency injection, a custom API
client and basic navigation. Use this as a starting point for your
own implementation of a restaurant ordering app.

## Structure

- `FoodOrderingApp.swift` – The main entry point of the app; injects a
  dependency container.
- `Environment.swift` – Holds configuration like `baseURL`, `storeID` and
  `tableID`.
- `DIContainer.swift` – Provides dependency injection for services.
- `Networking/` – Contains the network layer:
  - `Endpoint.swift` – Defines an API route.
  - `APIClient.swift` – Protocol and error definitions.
  - `LiveAPIClient.swift` – Concrete implementation using `URLSession`.
  - `MockAPIClient.swift` – Mock implementation for testing.
- `Views/ContentView.swift` – The root view demonstrating navigation
  and environment usage.
- `Tests/APIClientTests.swift` – Sample unit tests for the API client.

## Running the Project

This project is provided as a set of Swift source files. To run it:

1. Create a new iOS application project in Xcode (iOS 17+).
2. Copy the contents of this directory into your project.
3. Ensure the folder structure matches the grouping in Xcode. Create
   groups for Networking, Views and Tests as needed.
4. Build and run on a simulator or device. The app will display a
   simple home screen with navigation to a placeholder screen.

## Extending the Skeleton

From here you can begin to add new features. Suggested next steps:

- Define additional endpoints for menus, orders and carts.
- Build view models that leverage the `APIClient` to fetch data.
- Organise code into feature modules (e.g. `MenuFeature`, `OrderFeature`).
- Add persistent storage for offline caching.
- Integrate push notifications and WebSocket support for real‑time
  updates.

## Tests

The included test targets demonstrate how to configure the mock
client and assert on decoded values and errors. To run tests in
Xcode, select the appropriate scheme and press ⌘U.
