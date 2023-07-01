


import Foundation

//https://apingweb.com/api/rest/ec06c03707727fb797b474e3465b9a606/products

//()->Void

class ProductsAPI{
    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void){
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "apingweb.com"
        urlComponents.path = "/api/rest/ec06c03707727fb797b474e3465b9a606/products"
        
        guard let url = urlComponents.url else { return }
        
        var request = URLRequest.init(url: url)
        
        request.httpMethod = "GET"
        
        let session = URLSession.init(configuration: .default)
        
        let _ = session.dataTask(with: request) { data, response, error in
        
            
            guard let data = data else {return}
            let decoder = JSONDecoder.init()
            do {
                let response = try decoder.decode(ProductResponse.self, from: data)
                let products = response.products
                DispatchQueue.main.async {
                    completion(.success(products))
                }
//                completion(.success(products))
            } catch {
                print(error)
            }
        }.resume()
    }
    
    enum NetworkError: Error {
        case urlInvalid
        case requestInvalid
    }
    
    func fetchProducts() async throws -> [Product] {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "apingweb.com"
        urlComponents.path = "/api/rest/ec06c03707727fb797b474e3465b9a606/products"
        
        guard let url = urlComponents.url else { throw NetworkError.urlInvalid }
        var request = URLRequest.init(url: url)
        
        let session = URLSession.init(configuration: .default)
        let decoder = JSONDecoder.init()
        
        do {
            let (data, response) = try await session.data(for: request)
            print(response)
            
            let jsonResponse = try decoder.decode(ProductResponse.self, from: data)
            return jsonResponse.products
            
        } catch {
            print(error)
            throw NetworkError.requestInvalid
        }
    }
}
