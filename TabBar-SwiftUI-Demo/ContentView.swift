//
//  ContentView.swift
//  TabBar-SwiftUI-Demo
//
//  Created by Ling Zhan on 2020/6/11.
//  Copyright © 2020 Ling Zhan. All rights reserved.
//

import SwiftUI
import TabBar_SwiftUI

// 自製圖片用法
 let tabBarItems: [TabBarItem] = [
    .init(icon: "music1_gray", selectedIcon: "music1_red"),
    .init(icon: "music2_gray", selectedIcon: "music2_red"),
    .init(icon: "music3_gray", selectedIcon: "music3_red")]

// SF Symbols 用法
let tabBarSystemItems: [TabBarItem] = [
    .init(icon: "tag.circle", selectedIcon: "tag.circle.fill", width: 35, height: 35, color: .gray, selectedWidth: 38, selectedHeight: 38, selectedColor: .red),
    .init(icon: "mic.circle", selectedIcon: "mic.circle.fill", width: 35, height: 35, color: .gray, selectedWidth: 38, selectedHeight: 38, selectedColor: .red),
    .init(icon: "message.circle", selectedIcon: "message.circle.fill", width: 35, height: 35, color: .gray, selectedWidth: 38, selectedHeight: 38, selectedColor: .red)
]

struct ContentView: View {
    @State var selectedTag: Int = 0
    var body: some View {
        VStack {
            if selectedTag == 0 {
                View1()
                    .frame(minHeight: 0,maxHeight: .infinity)
                    .background(Color.yellow.edgesIgnoringSafeArea(.top))
                
            }else if selectedTag == 1 {
                View2()
                    .frame(minHeight: 0,maxHeight: .infinity)
                    .background(Color.green.edgesIgnoringSafeArea(.top))
            }else {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("View3")
                        Spacer()
                    }
                    Spacer()
                }
                .frame(minHeight: 0,maxHeight: .infinity)
                .background(Color.blue.edgesIgnoringSafeArea(.top))
            }
            
            VStack(spacing: 0) {
                TabBarView(selectedIndex: $selectedTag, items: tabBarSystemItems, iconType: .system, iconAlignment: .bottom, height: 49)
                    .animation(.easeIn)
                    .background(Color.clear)
            }
                // 填充不同設備 SafeArea 底部的高度
                .background(Color.clear.edgesIgnoringSafeArea(.bottom))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
