//
//  AsyncAction.swift
//  SUI3Test
//
//  Created by Viktor Kushnerov on 24.12.21.
//

import Foundation

typealias AsyncAction<T> = (T) async throws -> Void
typealias Loading<T> = () async throws -> T
