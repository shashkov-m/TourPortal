//
//  Alean.swift
//  TourPortal
//
//  Created by Max Shashkov on 19.04.2022.
//

import Foundation
import SwiftyXMLParser
import Alamofire

final class Alean {
  static let shared = Alean()
  private let login = "Test"
  private let password = "testik"
  private let httpMethod = "POST"
  private let contentTypeHeader = (header: "Content-type", value: "text/xml")
  private(set) var sessionID: String?
  private let aleanQueue = DispatchQueue(label: "AleanQueue", qos: .userInitiated)
  
  private enum AleanURLs: String {
    private var baseURL: String {
      "http://extgate.alean.ru:8082/webservice/ewebsvc.dll/soap"
    }
    case authServer = "/IewsServer"
    case reservationServer = "/ItwsReservationService"
    
    var url: URL? {
      guard let url = URL(string: baseURL) else { return nil }
      return url.appendingPathComponent(self.rawValue)
    }
  }
  
  private init() { }
  
  private enum AleanError: Error {
    case cannotGetDataFromResponse
  }
  
  private func makeAuthRequest() -> URLRequest? {
    guard let url = AleanURLs.authServer.url else { return nil }
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
    guard let url = AleanURLs.authServer.url else { return nil }
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
  
  private func makeTourListRequest(sessionID: String, departureCity: String, from: Date, till: Date, durationMin: Int, durationMax: Int) -> URLRequest? {
    guard let url = AleanURLs.reservationServer.url else { return nil }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let dateFrom = dateFormatter.string(from: from)
    let dateTill = dateFormatter.string(from: till)
    let header = "<m:GetAbodeReservationTable xmlns:m=\"urn:webservice-electrasoft-ru:types-twsReservationServiceIntf-ItwsReservationService\" SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\">"
    let footer = "</m:GetAbodeReservationTable>"
    let sessionID = "<SessionID xsi:type=\"string\">\(sessionID)</SessionID>"
    let departure = "<TourShortNameArray xsi:type=\"ns1:TWideStringDynArray\"><item>\(departureCity)</item></TourShortNameArray>"
    let baseSeatQuantity = "<BaseSeatQuantity xsi:type=\"xsd:int\">-1</BaseSeatQuantity>"
    let extSeatQuantity = "<ExtSeatQuantity xsi:type=\"xsd:int\">-1</ExtSeatQuantity>"
    let touristAgeArray = "<TouristAgeArray xsi:type=\"SOAP-ENC:Array\" SOAP-ENC:arrayType=\"xsd:int[1]\"><item>-1</item></TouristAgeArray>"
    let minPrice = "<MinPrice xsi:type=\"xsd:double\">-1</MinPrice>"
    let maxPrice = "<MaxPrice xsi:type=\"xsd:double\">-1</MaxPrice>"
    let beginDateFrom = "<BeginDateFrom xsi:type=\"xsd:dateTime\">\(dateFrom)</BeginDateFrom>"
    let beginDateTill = "<BeginDateTill xsi:type=\"xsd:dateTime\">\(dateTill)</BeginDateTill>"
    let durationFrom = "<DurationFrom xsi:type=\"xsd:int\">\(durationMin)</DurationFrom>"
    let durationTill = "<DurationTill xsi:type=\"xsd:int\">\(durationMax)</DurationTill>"
    let result = header + sessionID + departure + baseSeatQuantity + extSeatQuantity + touristAgeArray + minPrice + maxPrice + beginDateTill + beginDateFrom + durationFrom + durationTill + footer
    let body = result.envelope().data(using: .utf8)
    var request = URLRequest(url: url)
    request.httpBody = body
    request.httpMethod = httpMethod
    request.addValue(contentTypeHeader.value, forHTTPHeaderField: contentTypeHeader.header)
    request.timeoutInterval = 15
    return request
  }
  
  private func makeHotelDetailsRequest(sessionID: String, hotelShortName: String) -> URLRequest? {
    guard let url = AleanURLs.reservationServer.url else { return nil }
    let header = "<m:GetHotelDescription xmlns:m=\"urn:webservice-electrasoft-ru:types-twsReservationServiceIntf-ItwsReservationService\" SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\">"
    let sessionID = "<SessionID xsi:type=\"string\">\(sessionID)</SessionID>"
    let hotelShortName = "<HotelShortName xsi:type=\"xs:string\">\(hotelShortName)</HotelShortName>"
    let footer = "</m:GetHotelDescription>"
    let result = header + sessionID + hotelShortName + footer
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
  
  func getTourList(departureCity: String, from: Date, till: Date, durationMin: Int, durationMax: Int, completion: @escaping (Result <[Hotel], Error>) -> ()) {
    guard let sessionID = sessionID else { return }
    guard let request = makeTourListRequest(sessionID: sessionID,
                                            departureCity: departureCity,
                                            from: from,
                                            till: till,
                                            durationMin: durationMin,
                                            durationMax: durationMax)
    else {
      return
    }
    AF.request(request).response(queue: aleanQueue) { [weak self] response in
      guard let data = response.data else {
        completion(.failure(AleanError.cannotGetDataFromResponse))
        return
      }
      guard let self = self else { return }
      let xml = XML.parse(data)
      let result = self.parseHotelData(xml: xml)
      completion(.success(result))
    }
  }
  
  func getHotelDetails(sessionID: String, hotelShortName: String) {
    guard let requets = makeHotelDetailsRequest(sessionID: sessionID, hotelShortName: hotelShortName) else { return }
  }
  
  private func parseHotelData(xml: XML.Accessor) -> [Hotel] {
    var hotels = [Hotel]()
    let xml = xml["ReservationAbodeTable"]
    let hotelXML = xml["HotelList", "Hotel"]
    let roomXML = xml["RoomCategoryList", "RoomCategory"]
    let offerXML = xml["OfferList", "Offer"]
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ru")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    
    return hotels
  }
  
}
