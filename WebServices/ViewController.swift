//
//  ViewController.swift
//  WebServices
//
//  Created by Nikhil Tanappagol on 8/23/17.
//  Copyright © 2017 Nikhil Tanappagol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loadRecords()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadRecords(){
        //The address of the web services
        let urlString = URL(string:"http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors")
        // Create the session by getting the configuration and then creating the session
        //let config = URLSessionConfiguration.default
        //let session = URLSession(configuration: config, delegate: nil, delegateQueue: nil)
        //create the url object
        //let url = URL(string: urlString)
        // create the request  object
        //let request  = URLRequest(url: url!)
        // execute request 
        let taskData = URLSession.shared.dataTask(with: urlString!) { (data, response, error) in
            if error != nil{
                print("error")
            } else {
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                   // print(json)
                    let actor = json["actors"] as? [[String:String]]
                    print(actor)
                    print(json)
                }
                catch {
                    print (error)
                }
            }
        }
        taskData.resume()
}
}

