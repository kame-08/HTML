//
//  HTML.swift
//  HTML
//
//  Created by Ryo on 2022/07/09.
//

import Foundation
//import Combine
//
//let subject = PassthroughSubject<String, Never>()
//
//final class Receiver {
//    private var subscription = Set<AnyCancellable>()
//
//    init(){
//        subject
//            .sink { value in
//                print("Received value", value)
//            }
//            .store(in: &subscription)
//    }
//}
//
//let receiver = Receiver()
//subject.send("a")

func HTML(replaceString:String)->String{
    //    // プログラムの開始
    //    print("URLを入力: ");
    //    // キーボードから return キーが押下されるまで読み込む
    //    let standardInput: FileHandle = FileHandle.standardInput;
    //    // 入力された情報を文字列にする(UTF-8で文字列を生成する。)
    //    var inputString: String = String(data: standardInput.availableData, encoding: String.Encoding.utf8)!;
    //
    //    // 入力した文字列から改行文字を空文字に置き換える
    //    let replaceString = inputString.replacingOccurrences(of: "\n", with: "");
    
    // 入力したURLからHTMLのソースを取得する。
    let targetURL: URL = URL(string: replaceString)!;
    do {
        // 入力したURLのページから、HTMLのソースを取得する。
        let sourceHTML: String = try String(contentsOf: targetURL, encoding: String.Encoding.utf8);
        //        print("取得したHTMLのソースは以下です。↓\n" + sourceHTML);
        return sourceHTML
    }
    catch {
        // 何かしらのエラーが発生した。
        //        print("エラーが発生しました。");
        return ("エラーが発生しました。");
    }
}


