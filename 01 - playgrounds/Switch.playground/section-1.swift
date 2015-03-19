// Playground - noun: a place where people can play

import Cocoa

//var statusCode: Int = 404
//var errorString: String
//switch statusCode {
//    case 400:
//        errorString = "Bad request."
//
//    case 401:
//        errorString = "Unauthorized."
//
//    case 403:
//        errorString = "Forbidden."
//
//    case 404:
//        errorString = "Not Found."
//
//    default:
//        errorString = "none"
//}

//var statusCode: Int = 404
//var errorString: String = "The request failed with the error:"
//switch statusCode {
//    case 400, 401, 403, 404:
//        errorString += " There was something wrong with the request."
//        fallthrough
//
//default:
//    errorString += " Please review the request and try again."
//
//}

var statusCode: Int = 301
var errorString: String = "The request failed with the error:"
switch statusCode {
    case 100, 101:
        errorString += " Informational, \(statusCode)."
    
    case 204:
        errorString += " Successful but no content, 204."
    
    case 300...307:
        errorString += " Redirection, \(statusCode)."
    
    case 400...417:
        errorString += " Client error, \(statusCode)."
    
    case 500...505:
        errorString += " Server error, \(statusCode)."
    
    case let unknownCode where (unknownCode >= 200 && unknownCode < 300)
        || unknownCode > 505:
        errorString = "\(unknownCode) is not a known error code."
    
    default:
        errorString = "Unexpected error encountered."
}
println(errorString)

let error = (code: statusCode, error: errorString)
error.code
error.error

switch error {
case (400...505, _):
    println("PANIC!")
default:
    println("Not worth panicking.")
}

    