//
//  Note.swift
//  Notepad Browser
//
//  Created by Brian McVeigh on 11/28/14.
//  Copyright (c) 2014 Pakorasoft. All rights reserved.
//

import Cocoa

class Note: NSObject, NSCoding {
    var url = ""
    var text = ""
    
    required init(coder aDecoder: NSCoder) {
        self.url = aDecoder.decodeObjectForKey("url") as String
        self.text = aDecoder.decodeObjectForKey("text") as String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.url, forKey: "url")
        aCoder.encodeObject(self.text, forKey: "text")
    }
}
