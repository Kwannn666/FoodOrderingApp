import XCTest
@testable import FoodOrderingApp

/// Unit tests for the API client implementations.
///
/// These tests demonstrate how to use the mock client and test
/// decoding success and error scenarios. To run these tests you
/// should open the project in Xcode and execute the test suite.
final class APIClientTests: XCTestCase {
    struct MockModel: Codable, Equatable {
        let name: String
    }

    func testMockClientReturnsDecodedModel() async throws {
        let json = "{"name":"Test"}".data(using: .utf8)!
        let client = MockAPIClient()
        client.responseData = json

        let endpoint = Endpoint(path: "/test")
        let model: MockModel = try await client.request(endpoint)
        XCTAssertEqual(model, MockModel(name: "Test"))
    }

    func testMockClientThrowsConfiguredError() async {
        struct TestError: Error {}
        let client = MockAPIClient()
        client.responseError = TestError()
        let endpoint = Endpoint(path: "/test")
        do {
            let _: MockModel = try await client.request(endpoint)
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssert(error is TestError)
        }
    }
}