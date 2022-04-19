//
//  Envelope.swift
//  TourPortal
//
//  Created by Max Shashkov on 19.04.2022.
//

import Foundation

extension String {
  
  func envelope() -> String {
    let header = """
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ns1="http://www.borland.com/namespaces/Types" xmlns:ns2="urn:webservice-electrasoft-ru:types-ewsServerIntf">
<SOAP-ENV:Body>
"""
    let footer = "</SOAP-ENV:Body></SOAP-ENV:Envelope>"
    return header + self + footer
  }
}
