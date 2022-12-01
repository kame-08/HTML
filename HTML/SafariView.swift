//
//  SafariView.swift
//  HTML
//
//  Created by Ryo on 2022/07/17.
//
//
import SwiftUI
import SafariServices
//
//struct SafariView: UIViewControllerRepresentable {
//    var url: URL
//    typealias UIViewControllerType = SFSafariViewController
//
//    func makeUIViewController(context: Context) -> SFSafariViewController {
//        let config = SFSafariViewController.Configuration()
//        config.barCollapsingEnabled = false
//        let safariViewController = SFSafariViewController(url: url, configuration: config)
//        return safariViewController
//    }
//
//    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
//    }
//}
//

struct SafariView: UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.dismissButtonStyle = .close
        
        return safariViewController
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
    }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: URL(string: "https://www.switch-science.com/catalog/7600/")!)
    }
}
