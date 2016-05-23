//
//  URLStringBuilder.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 09.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

class URLStringBuilder: URLStringBuilderInterface {
    
    func urlStringBuilder(method: MethodsAPI, parameters: NSDictionary, accessToken: String?) -> String {
        var httpBody = ""
        var parametersBody = ""
        var accessTokenBody = ""
        
        for i in parameters {
            parametersBody = parametersBody + String(i.key) + "=" + String(i.value) + "&"
        }
        if let str = accessToken {
            accessTokenBody = "access_token=" + str
        } else {
            accessTokenBody = ""
        }
        
        httpBody = mainResource + method.rawValue + "?" + parametersBody + releaseVKSdk + accessTokenBody
        
        return httpBody
    }
}


