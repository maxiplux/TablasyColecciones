//
//  Navegador.swift
//  TablasyColeciones
//
//  Created by JUAN on 6/01/18.
//  Copyright © 2018 net.juanfrancisco.blog. All rights reserved.
//

import UIKit
import WebKit
class Navegador: UIViewController {

    var url : String = "http://cvflight.com/"
    var web : WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        print(url)
        let urlCargar = URL(string: url)
        let request = URLRequest(url: urlCargar!)
        web.load(request)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
extension Navegador: WKUIDelegate, WKNavigationDelegate{

    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if let server = challenge.protectionSpace.serverTrust {
            completionHandler(.useCredential, URLCredential(trust: server))
        }
    }
    override func loadView()
    {
        let webConfiguracion = WKWebViewConfiguration()
        web = WKWebView(frame: .zero, configuration: webConfiguracion)
        web.uiDelegate = self
        web.navigationDelegate = self
        view = web
    }
}
