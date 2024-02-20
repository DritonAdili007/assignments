//
//  main.swift
//  adapterAssingment
//
//  Created by Driton Adili on 20.02.24.
//

import Foundation

class FileAdapter {
    private let file: String
    
    init(file: String) {
        self.file = file
    }
    
    func readContent() -> String {
        return "Any class written in Swift format in ##\(file)"
    }
    
    func writeToSwiftFile(outputFile: String) {
        do {
            try readContent().write(toFile: outputFile, atomically: true, encoding: .utf8)
            print("Content written to Swift file: \(outputFile)")
        } catch {
            print("Error writing to Swift file: \(error.localizedDescription)")
        }
    }
}

class Client {
    private let fileAdapter: FileAdapter
    
    init(fileAdapter: FileAdapter) {
        self.fileAdapter = fileAdapter
    }
    
    func processFileAndWriteToSwift(outputFile: String) {
        let content = fileAdapter.readContent()
        fileAdapter.writeToSwiftFile(outputFile: outputFile)
    }
}

let fileAdapter = FileAdapter(file: "text_format_file.txt")
let client = Client(fileAdapter: fileAdapter)
let outputFile = "swift_format_file.swift"
client.processFileAndWriteToSwift(outputFile: outputFile)
