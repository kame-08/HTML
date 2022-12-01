//
//  AddSiteViewModel.swift
//  HTML
//
//  Created by Ryo on 2022/07/17.
//

import Foundation

final class AddSiteViewModel: ObservableObject {
    //    @Published var flag:Bool = false
    
    @Published var mark = "empty"
    
    @Published var AddCheck = true
    
    @Published var searchText = ""
    
    
    func URlCheck(URL:String){
        
        //        let url : URL = URL.init(string:"https://example.com/example.html")!
        
        //        if(日本語かどうか){
        //            mark = "OK1"
        //        }else{
        //            mark = "OK2"
        //        }
        
        //URLを全て小文字にした前から何文字
        if(URL.lowercased().prefix(8) == "https://"){
            if(URL.count >= 9){
                mark = "OK"
            }else{
                mark = "O"
            }
        }else if(URL.lowercased().prefix(7) == "http://" ){
            if(URL.count >= 8){
                mark = "OK"
            }else{
                mark = "O"
            }
        }else if(URL.count == 0){
            mark = "empty"
        }else{
            mark = "error"
            //            mark = URL
        }
        addOK()
    }
    
    func addOK(){
        if(mark == "OK" && searchText.count > 0){
            AddCheck = false
        }else{
            AddCheck = true
        }
    }
    
}
