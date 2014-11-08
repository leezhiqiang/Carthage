//
//  GitSpec.swift
//  Carthage
//
//  Created by Alan Rogers on 3/11/2014.
//  Copyright (c) 2014 Carthage. All rights reserved.
//

import Foundation
import CarthageKit
import Quick
import Nimble

class GitSpec: CarthageSpec {
    override func spec() {
		var testRepoPath: String!

        beforeEach {
            testRepoPath = self.pathForFixtureRepositoryNamed("simple-repo")
			expect(testRepoPath).notTo(beNil())
			println(testRepoPath)
			let exists = NSFileManager.defaultManager().fileExistsAtPath(testRepoPath)
			expect(exists).to(beTruthy())
        }

        it("repositoryRemote should send the remote URL") {
			let remote = repositoryRemote(testRepoPath).first().value()
			expect(remote).notTo(beNil())
			expect(remote).to(equal("https://github.com/carthage/simple-repo.git"))
        }
    }
}
