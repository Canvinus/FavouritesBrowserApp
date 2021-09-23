//
//  ViewController.swift
//  MyApp
//
//  Created by Andrey Gruzdev on 23.09.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var item: Item?
    
    @IBOutlet weak var favouriteButton: UIBarButtonItem!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = item {
            urlTextField.text = item.url
            searchButton_Clicked(self)
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clearButton_Clicked(_ sender: Any) {
        urlTextField.text = ""
    }
    
    
    override func prepare( for segue: UIStoryboardSegue, sender: Any?) {
        if sender as AnyObject? === favouriteButton{
            let url = urlTextField.text ?? ""
            item = Item(url: url)
        }
    }
    
    func webView(_ webView: WKWebView, didFailLoadWithError error: Error) {
        let alert = UIAlertController(title: "Error", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { action in
        })
        self.present(alert, animated: true)
    }
 
    @IBAction func searchButton_Clicked(_ sender: Any) {
        webView.load(NSURLRequest(url: NSURL(string: urlTextField.text!)! as URL) as URLRequest)
    }
}

