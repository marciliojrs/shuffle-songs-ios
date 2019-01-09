protocol Controller {
    associatedtype ViewType
    var mainView: ViewType { get }
}
