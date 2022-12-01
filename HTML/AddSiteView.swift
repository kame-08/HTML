//
//  AddSiteView.swift
//  HTML
//
//  Created by Ryo on 2022/07/08.
//

import SwiftUI

struct AddSiteView: View {
    
    //State
    @ObservedObject var ViewModel = AddSiteViewModel()
    
    @State var URLText = ""
    
    @State private var isShowSafari: Bool = false
    
    
    //    @State var URL1 = "https://"
    
    var body: some View {
        NavigationStack {
            List {
                //                                Text(ViewModel.mark)
                //                                Text(URLText)
                Section {
                    TextField("名前入力", text: $ViewModel.searchText)
                    
                        .onChange(of: ViewModel.searchText) { value in
                            
                            ViewModel.addOK()
                        }
                }
                Section {
                    HStack{
                        
                        //TODO: - 日本語不可に
                        //1行では収まらない時改行(iOS16~) , axis: .vertical
                        TextField("URL入力", text: $URLText)
                            .autocapitalization(.none)
                            .keyboardType(.URL)
                            .onChange(of: URLText) { value in
                                
                                URLText = value
                                ViewModel.URlCheck(URL: value)
                            }
                        if(ViewModel.mark == "OK"){
                            Button {
                                //                                URL1 = URLText
                                self.isShowSafari = true
                            } label: {
                                Image(systemName: "safari")
                            }
                            .sheet(isPresented: $isShowSafari) {
                                SafariView(url: URL(string:URLText)!)
                                    .edgesIgnoringSafeArea(.bottom)
                            }
                        }else if(ViewModel.mark == "O"){
                            Button {
                                
                            } label: {
                                Image(systemName: "safari")
                            }
                            .disabled(true)
                        }else if(ViewModel.mark == "empty"){
                            //iOS16~
                            PasteButton(payloadType: URL.self) { Paste in
                                //これでいいの？
                                URLText = Paste[0].absoluteString
                            }
                            .buttonBorderShape(.capsule)
                        }else if(ViewModel.mark == "error"){
                            Menu {
                                Button {
                                    let a = URLText
                                    URLText = "https://" + a
                                } label: {
                                    Text("https://を追加")
                                }
                                Button {
                                    
                                    let a = URLText
                                    URLText = "http://" + a
                                } label: {
                                    Text("http://を追加")
                                }
                                
                            } label: {
                                Image(systemName: "exclamationmark.triangle")
                            } primaryAction: {
                                
                            }
                        }
                    }
                }
            }
            .navigationTitle("サイトの追加")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //TODO: 追加するコード
                    } label: {
                        HStack{
                            Image(systemName: "airplane.departure")
                            Text("追加")
                        }
                    }
                    .disabled(ViewModel.AddCheck)
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

struct AddSiteView_Previews: PreviewProvider {
    static var previews: some View {
        AddSiteView()
    }
}
