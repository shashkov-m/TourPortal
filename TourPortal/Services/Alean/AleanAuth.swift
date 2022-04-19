//
//  AleanAuth.swift
//  TourPortal
//
//  Created by Max Shashkov on 19.04.2022.
//

import Foundation
import SwiftyXMLParser
import Alamofire

final class AleanAuth {
  
  static let shared = AleanAuth()
  private let authServer = "http://extgate.alean.ru:8082/webservice/ewebsvc.dll/soap/IewsServer"
  private let login = "Test"
  private let password = "testik"
  private let httpMethod = "POST"
  private let contentTypeHeader = (header: "Content-type", value: "text/xml")
  private(set) var sessionID: String? {
    didSet {
      print(sessionID)
    }
  }
  
  private init() { }
  
  private func makeAuthRequest() -> URLRequest? {
    guard let url = URL(string: authServer) else { return nil }
    let header = "<m:Login xmlns:m=\"urn:webservice-electrasoft-ru:types-ewsServerIntf-IewsServer\" SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\">"
    let userAlias = "<UserAlias xsi:type=\"xsd:string\">\(login)</UserAlias>"
    let userPassword = "<Password xsi:type=\"xsd:string\">\(password)</Password>"
    let languge = "<Language xsi:type=\"xsd:string\">RU</Language>"
    let footer = "</m:Login>"
    let result = header + userAlias + userPassword + languge + footer
    let body = result.envelope().data(using: .utf8)
    var request = URLRequest(url: url)
    request.httpMethod = httpMethod
    request.addValue(contentTypeHeader.value, forHTTPHeaderField: contentTypeHeader.header)
    request.httpBody = body
    return request
  }
  
  private func makeLogoutRequest(sessionID: String) -> URLRequest? {
    guard let url = URL(string: authServer) else { return nil }
    let header = "<m:Logout xmlns:m=\"urn:webservice-electrasoft-ru:types-ewsServerIntf-IewsServer\" SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\">"
    let sessionID = "<SessionID xsi:type=\"string\">\(sessionID)</SessionID>"
    let footer = "</m:Logout>"
    let result = header + sessionID + footer
    let body = result.envelope().data(using: .utf8)
    var request = URLRequest(url: url)
    request.httpMethod = httpMethod
    request.addValue(contentTypeHeader.value, forHTTPHeaderField: contentTypeHeader.header)
    request.httpBody = body
    return request
  }
  
  func auth() {
    guard let request = makeAuthRequest() else { return }
    AF.request(request).response { [weak self] response in
      guard let data = response.data, let self = self else { return }
      let xml = XML.parse(data)
      let element = xml["SOAP-ENV:Envelope", "SOAP-ENV:Body", "NS1:LoginResponse", "SessionID"]
      if let sessionID = element.text {
        self.sessionID = sessionID
      }
    }
  }
  func logout() {
    guard let sessionID = sessionID, let request = makeLogoutRequest(sessionID: sessionID) else { return }
    AF.request(request).response { [weak self] _ in
      self?.sessionID = nil
    }
  }
}
