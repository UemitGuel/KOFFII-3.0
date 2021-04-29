//
//  InformationDetailCoordinator.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 29.04.21.
//

import SwiftUI

struct InformationDetailCoordinator: View {
    
    var info: Information
    
    var body: some View {
        if info.isMethod {
            MethodDetailView(info: info)
        } else {
            KnowledgeDetailView(info: info)
        }
    }
}

struct InformationDetailCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        InformationDetailCoordinator(info: informationData[0])
    }
}
