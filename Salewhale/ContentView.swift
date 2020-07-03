//
//  ContentView.swift
//  Salewhale
//
//  Created by Mhamed on 2020-07-03.
//  Copyright © 2020 Salewhale. All rights reserved.
//

import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        ContentView_Previews.previews
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            previewWithNavigationController(Browser())
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController

    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }

    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }

    func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<ViewController>>) {
        return
    }
}
#endif

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View

    init(_ builder: @escaping () -> View) {
        view = builder()
    }

    // MARK: - UIViewRepresentable
    func makeUIView(context: Context) -> UIView {
        return view
    }

    func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
#endif

func previewWithNavigationController(_ webViewController: UIViewController) -> some View {
    UIViewControllerPreview {
        let n = UINavigationController()
        n.pushViewController(webViewController, animated: true)
        n.navigationBar.isHidden = true
        return n
    }
}

class Browser: UIViewController {
    var webView = WKWebView()
    override func viewDidLoad() {
        self.view.addSubview(webView)
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        self.webView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
//        self.webView.load(URLRequest(url: URL(string: "https://www.google.com")!))
        self.webView.load(URLRequest(url: URL(string: "https://www.salewhale.ca")!))
        
    }
}

struct BrowserPreview: PreviewProvider {
    static var previews: some View {
        Group {
            previewWithNavigationController(Browser())
        }
    }
}
