//
//  HTMLView.swift
//  HTML
//
//  Created by Ryo on 2022/07/17.
//

import SwiftUI

struct HTMLView: View {
    @State var Sorcehoge = "未取得"
    @Binding var URL : String
    
    var body: some View {
        Text(Sorcehoge)
            .onAppear(){
                Sorcehoge = HTML(replaceString: URL)
            }
    }
}

//struct HTMLView_Previews: PreviewProvider {
//    static var previews: some View {
//        HTMLView(url: URL(string: "https://www.switch-science.com/catalog/7600/")!)
//    }
//}
