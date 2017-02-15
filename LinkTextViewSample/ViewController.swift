//
//  ViewController.swift
//  LinkTextViewSample
//
//  Created by Shota Nakagami on 2017/02/15.
//  Copyright © 2017年 Shota Nakagami. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseString = "これは設定アプリへのリンクを含む文章です。\n\nこちらのリンクはGoogle検索です"
        
        let attributedString = NSMutableAttributedString(string: baseString)
        
        attributedString.addAttribute(NSLinkAttributeName,
                                      value: UIApplicationOpenSettingsURLString,
                                      range: NSString(string: baseString).range(of: "設定アプリへのリンク"))
        
        attributedString.addAttribute(NSLinkAttributeName,
                                      value: "https://www.google.co.jp/",
                                      range: NSString(string: baseString).range(of: "こちら"))
        
        textView.attributedText = attributedString
        textView.isSelectable = true
    }
    
    func linkAttributedString(baseString: String, linkableString: String, urlString: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: baseString)
        attributedString.addAttribute(NSLinkAttributeName,
                                      value: urlString,
                                      range: NSString(string: baseString).range(of: linkableString))
        return attributedString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Text View Delegate
    
    func textView(_ textView: UITextView,
                  shouldInteractWith URL: URL,
                  in characterRange: NSRange,
                  interaction: UITextItemInteraction) -> Bool {
        
        UIApplication.shared.open(URL)
        
        return false
    }
}

