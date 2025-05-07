using Data.Model;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Data.Interface
{
    public interface IIntegracaoApi
    {
        Task<apiretorno> GetAPI(string nameApi, string token = null);
        Task<apiretorno> GetAPI(string nameApi, List<string> paramapi, string token = null);
        Task<apiretorno> PostAPI<T>(string nameApi, T body, string token = null);
        Task<apiretorno> PostAPI<T>(string nameApi, List<string> paramapi, T body, string token = null);
        Task<apiretorno> PutAPI<T>(string nameApi, T body, string token = null);
        Task<apiretorno> PutAPI<T>(string nameApi, List<string> paramapi, T body, string token = null);
        Task<apiretorno> DeleteAPI(string nameApi, string token = null);
        Task<apiretorno> DeleteAPI(string nameApi, List<string> paramapi, string token = null);
    }
}
