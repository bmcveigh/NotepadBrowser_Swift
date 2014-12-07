//
//  ViewController.swift
//  Notepad Browser
//
//  Created by Brian McVeigh on 11/27/14.
//  Copyright (c) 2014 Pakorasoft. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
    
    @IBOutlet var urlField: NSTextField!
    @IBOutlet var webView: WebView!
    @IBOutlet var smallTextView: NSTextView!
    @IBOutlet var definitionTextView: NSTextView!
    @IBOutlet var wordField: NSTextField!
    @IBOutlet var fontsComboBox: NSComboBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the default homepage.
        var url = NSURL(string: "http://www.google.com/")
        var request = NSURLRequest(URL: url!)
        webView.mainFrame.loadRequest(request)
        
        // Configure the fonts for the combo box
        var fontMgr = NSFontManager.sharedFontManager()
        var fontFamilies = fontMgr.availableFontFamilies
        
        // Add the font labels to the combo box
        //fontsComboBox.addItemsWithObjectValues(fontFamilies)
        
        smallTextView.usesFontPanel = true
        smallTextView.usesFindBar = true
        // Controls whether the receiver changes its height to fit the height of its text.
        //smallTextView.rulerVisible = true
        
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func setSelectedFont(sender: AnyObject) {
        var fontNameStr: String? = fontsComboBox.stringValue
        print(fontNameStr)
        var font = NSFont(name: fontNameStr!, size: 12.0)
        
        var selectedRange: NSRange = smallTextView.selectedRange()
        if strlen(smallTextView.string!) > 0 {
            smallTextView.setFont(font!, range: selectedRange)
        }
    }
    
    @IBAction func setSelectedFontSize(sender: AnyObject) {
    }
    
    
    @IBAction func exportToTextFile(sender: AnyObject) {

        // http://stackoverflow.com/questions/24097826/read-and-write-data-from-text-file
        
        let savePanel = NSSavePanel()
        savePanel.beginWithCompletionHandler { (result: Int) -> Void in
            if result == NSFileHandlingPanelOKButton {
                let exportedFileURL = savePanel.URL
                
                // Start writing
                let path = exportedFileURL?.path
                var textFieldString = "" + self.smallTextView.string!
                var text = textFieldString
                //println(path)
                
                //writing
                text.writeToFile(path!, atomically: false, encoding: NSUTF8StringEncoding, error: nil);
                
                //reading
                let text2 = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)

                
                
            }
        } // End block
        
    }
    
    @IBAction func exportToRTF(sender: AnyObject) {
        /*NSSavePanel *panel = [NSSavePanel savePanel];
        
        [panel setAllowedFileTypes:[NSArray arrayWithObject:@"rtf"]];
        if ([panel runModal] == NSOKButton){
            
            
            [[textView RTFFromRange:
                NSMakeRange(0, [[textView string] length])]
                writeToFile:[panel filename] atomically:YES];
            
        }*/
        
        let panel: NSSavePanel = NSSavePanel()
        
        panel.allowedFileTypes = ["rtf"]
        
        if (panel.runModal() == NSOKButton) {

            var richText = smallTextView.attributedString()
            
            var fileWrapper = richText.fileWrapperFromRange(NSMakeRange(0, richText.length), documentAttributes:[NSDocumentTypeDocumentAttribute: NSRTFDTextDocumentType] , error: nil)
            
            fileWrapper?.writeToURL(panel.URL!, options: nil, originalContentsURL: nil, error: nil)
        }
        
        
    }
    
    @IBAction func importFromTextFile(sender: AnyObject) {
        
        let openPanel = NSOpenPanel()
        var i = openPanel.runModal()
        
        if (i == NSOKButton) {
            let importedFileURL = openPanel.URL
            
            let path = importedFileURL?.path
            
            let text = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)
            
            // Set the loaded file's text to the text area
            self.smallTextView.string = text
            
        }
        
    }
    @IBAction func searchDictionary(sender: AnyObject) {
        
        
    }
    
    func sayHelloAgain() -> String {
        return "Hello again!"
    }
    
    
    // This is called when the user hits "return" in the URL field, or OKs
    //    the open file sheet. We fetch the data from the URL,
    //    then display it in the text view
    @IBAction func fetchAndDisplayURL(sender: AnyObject) {
        var str = "http://" + urlField.stringValue
        var url = NSURL(string: str)
        var request = NSURLRequest(URL: url!)
        webView.mainFrame.loadRequest(request)
        
    }
    
    // Pass the text in the small text view
    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
        let text = segue.destinationController as TextViewController
        text.representedObject = smallTextView.string
    }
}

