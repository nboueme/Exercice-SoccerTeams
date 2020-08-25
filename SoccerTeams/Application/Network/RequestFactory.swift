//
//  RequestFactory.swift
//  SoccerTeams
//
//  Created by Nicolas Bouème on 25/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import Foundation

final class RequestFactory {
    enum Method: String {
        case GET
        case POST
        case PUT
        case PATCH
        case DELETE
    }
    
    static func request(method: Method, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
