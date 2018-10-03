//
//  WelcomeContract.swift
//  FindHome
//
//  Created by TaNhi on 10/2/18.
//  Copyright © 2018 TaNhi. All rights reserved.
//

import Foundation
protocol WelcomeOutput:class {
    func welcome(showAllPost: Any?);
    func welcome(showHistory: Any?);
    func welcome(showAccount: Any?);
    func welcome(showMore: Any?);
}

protocol WelcomeView: class {
    
}

protocol WelcomePresenting: class {
    func viewOnReady();
    
    func tappedAllPost();
    func tappedHistory();
    func tappedAccount();
    func tappedMore();
}
