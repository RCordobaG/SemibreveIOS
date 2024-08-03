//
//  NetworkMonitor.swift
//  Semibreve
//
//  Created by Rodrigo Córdoba on 02/08/24.
//

import Foundation
import Network

class NetworkMonitor : ObservableObject{
    let netMonitor = NWPathMonitor()
    let queue = DispatchQueue(label: "networkMonitor")
    
    var isReachable = false
    var connectionType = "none"
    
    init(){
        
        netMonitor.pathUpdateHandler = { path in
            self.isReachable = path.status == .satisfied
            if path.usesInterfaceType(.wifi) {
                print("WiFi")
                self.connectionType = "WiFi"
            }
            
            else if path.usesInterfaceType(.cellular){
                print("No Wifi")
                self.connectionType = "Cellular"
            }
            
            else{
                self.connectionType = "Other"
            }
        }
        
        netMonitor.start(queue: queue)
    }
}
