//
//  SettingView.swift
//  HTML
//
//  Created by Ryo on 2022/07/08.
//

import SwiftUI

struct SettingView: View {
    @State private var selection = 1
    @AppStorage("counter")  var counter:Bool = true
    
    //    @AppStorage("count_key") var counter = 0
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("一般")) {
                    Picker(selection: $selection, label: Text("更新頻度")) {
                        Text("1").tag(1)
                        /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
                    }.pickerStyle(WheelPickerStyle())
                }
                Toggle(isOn: $counter) {
                    Text("サイトをアプリ内ブラウザで開く")
                }
            }
            .navigationTitle("設定")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
