//
//  MockupSongViewModel.swift
//  MVVMFC-2Tests
//
//  Created by Lê Hoàng Sinh on 9/23/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation
@testable import MVVMFC_2

class MockupSongViewModel: SongViewModelType {
    
    var url: String! = ""
    
    var closureRequest: ((Track) -> Void)?
    
    var trackResult: Track! = Track(track_name: "")
    
    func getSongData() {
        
    }
    
    
}
