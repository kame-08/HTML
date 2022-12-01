//
//  ContentView.swift
//  HTML
//
//  Created by Ryo on 2022/07/08.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowAddSite: Bool = false
    @State private var isShowSetting: Bool = false
    @State private var isShowSafari: Bool = false
    @State private var isShowHTML: Bool = false
    @State var URL1 = "https://www.switch-science.com/catalog/7600/"
    
    @State var searchText = ""
    
    @AppStorage("counter")  var counter:Bool = true
    
    var body: some View {
        NavigationStack {

            List {
                HStack{
                    Image(systemName: "scribble")
                    
                    Button {
                        URL1 = "https://www.switch-science.com/catalog/7600/"
                        
                        self.isShowHTML = true
                    } label: {
                        HStack{
                            Text("SWITCHSCIENCE")
                                
                            Spacer()
                        }
                        
                    }
                    //これがないと挙動が
//                    .buttonStyle(BorderlessButtonStyle())
                    .sheet(isPresented: $isShowHTML) {

                        HTMLView(URL: $URL1)
                            .edgesIgnoringSafeArea(.bottom)
                    }
                    
                    Button {
                        
                        URL1 = "https://www.switch-science.com/catalog/7600/"
                        
                        if(counter){
                            self.isShowSafari = true
                        }else{
                     
                            
                            UIApplication.shared.open(URL(string:URL1)!)
                        }

                    } label: {
                        Image(systemName: "safari")
                    }
                    //これがないと挙動が
                    .buttonStyle(BorderlessButtonStyle())
                    .sheet(isPresented: $isShowSafari) {
                        
                        SafariView(url: URL(string:URL1)!)
                            .edgesIgnoringSafeArea(.bottom)
                        
                    }
    
                }
                
                HStack{
                    Image(systemName: "scribble")
                    Button {
                        URL1 = "https://raspberry-pi.ksyic.com/main/index/pdp.id/849,850,851/pdp.open/849/"
                        self.isShowHTML = true
                    } label: {
                        HStack{
                            Text("KSY")

                            Spacer()
                        }
                        
                    }
                    //これがないと挙動が
//                    .buttonStyle(BorderlessButtonStyle())
                    .sheet(isPresented: $isShowHTML) {

                        HTMLView(URL: $URL1)
                            .edgesIgnoringSafeArea(.bottom)

                    }
                    Button {
                        URL1 = "https://raspberry-pi.ksyic.com/main/index/pdp.id/849,850,851/pdp.open/849/"
                        if(counter){
                            self.isShowSafari = true
                        }else{
                     
                            
                            UIApplication.shared.open(URL(string:URL1)!)
                        }
                    } label: {
                        Image(systemName: "safari")
                    }
                    //これがないと挙動が
                    .buttonStyle(BorderlessButtonStyle())
                    .sheet(isPresented: $isShowSafari) {
                        SafariView(url: URL(string:URL1)!)
                            .edgesIgnoringSafeArea(.bottom)

                    }
                }
            }.refreshable {
                //更新
            }
            
            //            .navigationTitle("タイトル")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        self.isShowSetting = true
                    } label: {
                        Image(systemName: "gearshape")
                    }
                    .sheet(isPresented: $isShowSetting) {
                        SettingView()
                            .presentationDetents([.medium])
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        self.isShowAddSite = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $isShowAddSite) {
                        AddSiteView()
                            .presentationDetents([.medium])
                    }
                }
            }
            .searchable(text: $searchText)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
