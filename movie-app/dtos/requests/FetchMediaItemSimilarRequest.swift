
struct FetchMediaItemSimilarRequest {
    let accessToken: String = Config.bearerToken
    let mediaId: Int
    let language: String = "en-US"
    let page: Int 
    
    func asRequestParams() -> [String: Any] {
        return [
            "language": language,
            "page": page
        ]
    }
}
