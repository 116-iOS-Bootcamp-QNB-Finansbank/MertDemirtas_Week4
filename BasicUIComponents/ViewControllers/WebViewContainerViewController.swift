//
//  WebViewContainerViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 18.09.2021.
//

import UIKit
import WebKit

class WebViewContainerViewController: UIViewController {

    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var webView: WKWebView!
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    private var lastContentOffset: CGFloat = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad() // html content gosterelim font ve font buyuklugunu css ile degistirelim
        
        webView.scrollView.delegate = self
        
        
        backButton.adjustsImageSizeForAccessibilityContentSizeCategory = true
        backButton.adjustsImageWhenDisabled = true
        // Do any additional setup after loading the view.
        
//        let preferences = WKPreferences()
//        preferences.javaScriptEnabled = true
//
//        let configuration = WKWebViewConfiguration()
//        configuration.preferences = preferences
        
        activityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.color = .red
        activityIndicatorView.startAnimating()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: activityIndicatorView)
        
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url,
                                    cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                    timeoutInterval: TimeInterval(8))
        
        webView.allowsBackForwardNavigationGestures = true
        webView.load(urlRequest)
        webView.addObserver(self,
                            forKeyPath: #keyPath(WKWebView.isLoading),
                            options: .new,
                            context: nil)
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        
        
    }
    
    private var activityIndicatorView: UIActivityIndicatorView!
    
    var urlString: String!
    
//    override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "loading" {
//            if webView.isLoading {
//
//            }
//        }
//    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading" {
            if webView.isLoading {
                activityIndicatorView.startAnimating()
            } else {
                activityIndicatorView.stopAnimating()
            }
            
            
            
            
            activityIndicatorView.isHidden = !webView.isLoading
        }
    }
    
    
    
    
    @IBAction func backButton(_ sender:UIButton){
        
        if(webView.canGoBack){
            webView.goBack()
        }
    }
    
    
    @IBAction func reloadButton(_ sender: Any) {
        webView.reload()
    }
    
    @IBAction func forwardButton(_ sender: Any) {
        if(webView.canGoForward){
            webView.goForward()
        }
    }
    
    
}





extension WebViewContainerViewController: WKUIDelegate {
    
     func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        if(!webView.canGoBack){
            backButton.tintColor = UIColor.darkGray
        }
        else{
            backButton.tintColor = UIColor.systemBlue
        }
        if(!webView.canGoForward){
            forwardButton.tintColor = UIColor.darkGray
        }
        else{
            forwardButton.tintColor = UIColor.systemBlue
    }
        
        
}
    
    
    
    
    
    
}

extension WebViewContainerViewController: WKNavigationDelegate {
    
    
    
    
}


extension WebViewContainerViewController: UIScrollViewDelegate{
    
    
  

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset > toolbar.frame.size.height) {
                toolbar.isHidden = true
            }
        else if (self.lastContentOffset < toolbar.frame.size.height) {
                toolbar.isHidden = false
            }
            // update the new position acquired
        self.lastContentOffset = toolbar.frame.size.height
        }

        
    
    
}
