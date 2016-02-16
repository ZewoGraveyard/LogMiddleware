// LogMiddleware.swift
//
// The MIT License (MIT)
//
// Copyright (c) 2015 Zewo
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

@_exported import Log
@_exported import HTTP

public struct LogMiddleware: MiddlewareType {
    private let log: Log
    private let level: Log.Level

    public init(log: Log, level: Log.Level = .Info) {
        self.log = log
        self.level = level
    }

    public func respond(request: Request, chain: ChainType) throws -> Response {
        let response = try chain.proceed(request)
        var message = "================================================================================\n"
        message += "Request:\n"
        message += "\(request)\n"
        message += "--------------------------------------------------------------------------------\n"
        message += "Response:\n"
        message += "\(response)\n"
        message += "================================================================================\n\n"
        log.log(level, item: message)
        return response
    }
}

public struct DebugLogMiddleware: MiddlewareType {
    private let log: Log
    private let level: Log.Level

    public init(log: Log, level: Log.Level = .Info) {
        self.log = log
        self.level = level
    }

    public func respond(request: Request, chain: ChainType) throws -> Response {
        let response = try chain.proceed(request)
        var message = "================================================================================\n"
        message += "Request:\n"
        message += "\(request.debugDescription)\n"
        message += "--------------------------------------------------------------------------------\n"
        message += "Response:\n"
        message += "\(response.debugDescription)\n"
        message += "================================================================================\n\n"
        log.log(level, item: message)
        return response
    }
}