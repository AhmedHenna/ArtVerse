//
//  Model.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/9/23.
//

import SwiftUI
import Combine

class Model: ObservableObject{
    @Published var showDetail: Bool = false
    @Published var selectedModal: Modal = .logIn
}

enum Modal: String{
    case register
    case logIn
}
