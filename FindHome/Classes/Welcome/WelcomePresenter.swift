//
//  WelcomePresenter.swift
//  FindHome
//
//  Created by TaNhi on 10/2/18.
//  Copyright © 2018 TaNhi. All rights reserved.
//

import Foundation

class WelcomePresenter: WelcomePresenting{
    
    var view: WelcomeView;
    var output: WelcomeOutput;

    init(view: WelcomeView, output: WelcomeOutput) {
        self.view = view;
        self.output = output;
    }
    
    
    func viewOnReady() {
        print("Ready");
    }
    
    func tappedAllPost(){
        self.output.welcome(showAllPost: nil);
    }
    
    func tappedHistory(){
        
    }
    
    func tappedAccount(){
        
    }
    
    
    func tappedMore(){
        
    }
    
}
