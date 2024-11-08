//
//  TextExample.swift
//  curso_ios
//
//  Created by Eddy Mendoza on 8/11/24.
//

import SwiftUI

struct TextExample : View {
    var body: some View {
        
        VStack {
            Text("Eddycito")
                .bold()
                .font(.headline)
            
            Text("Pollito con papas")
                .font(
                    .system(
                        size: 20,
                        weight: .ultraLight,
                        design: .monospaced
                    )
                )
                .italic()
                .underline()
                .foregroundColor(.blue)
                .background(.red)
            
            Text("Habia una vez un pollito que se llamaba maiz y que se comía papas")
                .frame(width: 160)
                .lineLimit(3)
                .lineSpacing(10)
                
        }
        
    }
}

#Preview {
    TextExample()
}
