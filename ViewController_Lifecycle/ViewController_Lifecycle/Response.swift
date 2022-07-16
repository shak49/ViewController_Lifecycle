//
//  Response.swift
//  ViewController_Lifecycle
//
//  Created by Shak Feizi on 7/16/22.
//

import UIKit


struct Response: Codable {
    let userId, id: Int?
    let title, body: String?
}
