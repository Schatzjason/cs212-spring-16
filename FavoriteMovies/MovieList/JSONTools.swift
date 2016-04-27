import Foundation

protocol Archivable {
    var JSONForm: AnyObject {get}
    init?(JSONObject: AnyObject)
}


