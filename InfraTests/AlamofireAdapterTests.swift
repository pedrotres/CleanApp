//
//  InfraTests.swift
//  InfraTests
//
//  Created by pedro tres on 25/09/22.
//

import XCTest
import Alamofire

class AlamofireAdapter {
    
    private let session: Session
    
    init(session: Session = .default) {
        self.session = session
    }
    
    func post(to url: URL, with data: Data?) {
        let json = try? JSONSerialization.jsonObject(with: data!) as? [String: Any]
        session.request(url, method: .post, parameters: json).resume()
    }
}

final class AlamofireAdapterTests: XCTestCase {

    func test_post_should_make_request_with_valid_url_and_method() {
        
        let url = makeUrl()
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolStub.self]
        let session = Session(configuration: configuration)
        let sut = AlamofireAdapter(session: session)
        sut.post(to: url, with: makeValidData())
        let exp = expectation(description: "waiting")
        URLProtocolStub.observerRequest { request in
            XCTAssertEqual(url, request.url)
            XCTAssertEqual("POST", request.httpMethod)
            XCTAssertNotNil(request.httpBodyStream)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
}

class URLProtocolStub: URLProtocol {
    
    static var emit: ((URLRequest) -> Void)?
    
    static func observerRequest(completion: @escaping (URLRequest) -> Void) {
        URLProtocolStub.emit = completion
    }
    
    open override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    open override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    open override func startLoading() {
        URLProtocolStub.emit?(request)
    }

    open override func stopLoading() {
        
    }

}
