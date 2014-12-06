//
//  TextViewController.swift
//  Notepad Browser
//
//  Created by Brian McVeigh on 11/27/14.
//  Copyright (c) 2014 Pakorasoft. All rights reserved.
//

import Cocoa

class TextViewController: NSViewController {
    
    @IBOutlet var bigTextView: NSTextView!
        
    func sendDataBack(array: NSArray) {
        
    }
    
    @IBAction func dismiss(sender: AnyObject) {
        self.dismissViewController(self)
    }
    
    override func viewWillAppear() {
        bigTextView.string = self.representedObject as NSString
    }
    
    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
        let text = segue.sourceController as ViewController
        text.representedObject = bigTextView.string
    }
    
    
    
}
