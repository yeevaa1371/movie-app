
struct FetchFavoriteMediaItemRequest {
    let accessToken: String = Config.bearerToken
    let accountId: Int = 22141382
    
    func asRequestParams() -> [String: Any] {
        return [:]
    }
}
