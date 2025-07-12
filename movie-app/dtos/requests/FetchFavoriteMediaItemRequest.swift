
struct FetchFavoriteMediaItemRequest {
    let accessToken: String = Config.bearerToken
    let accountId: Int = 21889570
    
    func asRequestParams() -> [String: Any] {
        return [:]
    }
}
