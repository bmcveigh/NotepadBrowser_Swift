//
//  WordModel.swift
//  Notepad Browser
//
//  Created by Brian McVeigh on 11/29/14.
//  Copyright (c) 2014 Pakorasoft. All rights reserved.
//

import Cocoa
import Foundation

class WordModel: NSObject, Printable {
    let word: String
    let definition: String
    
    override var description: String {
        return "Word: \(word), Definition: \(definition)\n"
    }
    
    init(name: String?, appStoreURL: String?) {
        self.word = name ?? ""
        self.definition = appStoreURL ?? ""
    }
}