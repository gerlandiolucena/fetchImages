//
//  StringsHelper.swift
//  fetchImages
//
//  Created by Gerlandio Lucena on 12/03/22.
//

import Foundation

extension String {
    //TODO: Adicionar strings em arquivo de localização
    struct Error {
        static var baseURLFail: String { "Não foi possível converter a url base do projeto." }
    }
    
    struct Request {
        struct Header {
            static var authorization: String { "Authorization" }
            static var clientId: String { "Client-ID" }
        }
    }
}
