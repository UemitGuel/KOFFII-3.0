//
//  TestViewComplain.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 30.06.21.
//

import SwiftUI

struct TestViewComplain: View {
    @EnvironmentObject var vm: ComplainCloud
    
    var body: some View {
        VStack {
            content
        }
        .onAppear {
            vm.refresh()
        }
    }
    
    private var content: some View {
        switch vm.state {
        case .idle:
            return AnyView(Text("idle"))
        case .loading:
            return AnyView(Text("loading"))
        case .loaded(let complains):
            return AnyView(Text(complains.first!.title))
        case .error(let error):
            return AnyView(Text("\(error.localizedDescription)"))
        }
    }
    
}

struct TestViewComplain_Previews: PreviewProvider {
    static var previews: some View {
        TestViewComplain()
    }
}
