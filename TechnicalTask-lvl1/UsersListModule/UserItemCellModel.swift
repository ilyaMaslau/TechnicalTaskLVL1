import Foundation

struct UserItemCellModel {
    let userName: String
    let userEmail: String
    let cityName: String
    let streetName: String

    static let mockModel = UserItemCellModel(
        userName: "User Name",
        userEmail: "email@gmail.com",
        cityName: "City name",
        streetName: "Street name"
    )
}
