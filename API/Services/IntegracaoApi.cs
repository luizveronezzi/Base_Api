using Data.Interface;
using Data.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace API.Services
{
    public class IntegracaoApi : IIntegracaoApi
    {
        private readonly IConfiguration _configuration;
        private readonly HttpClient _httpClient;

        public IntegracaoApi(IConfiguration configuration)
        {
            _configuration = configuration;

            _httpClient = new();
            _httpClient.BaseAddress = new System.Uri(_configuration["APIConfig:UrlBase"]);
            _httpClient.DefaultRequestHeaders.Accept.Clear();
            _httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue(_configuration["APIConfig:ContentTypeJson"]));

        }

        public async Task<apiretorno> GetAPI(string nameApi, string token = null)
        {
            if (token != null)
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            }

            var response = await _httpClient.GetAsync(nameApi);
            var resposta = await Verifica_Acesso(response);

            return resposta;
        }

        public async Task<apiretorno> GetAPI(string nameApi, List<string> paramapi, string token = null)
        {
            foreach (var item in paramapi)
            {
                nameApi = string.Concat(nameApi, "/" + item);
            }

            if (token != null)
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            }

            var response = await _httpClient.GetAsync(nameApi);
            var resposta = await Verifica_Acesso(response);

            return resposta;
        }

        public async Task<apiretorno> PostAPI<T>(string nameApi, T body, string token = null)
        {
            if (token != null)
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            }

            var response = await _httpClient.PostAsJsonAsync(nameApi, body);
            var resposta = await Verifica_Acesso(response);

            return resposta;
        }

        public async Task<apiretorno> PostAPI<T>(string nameApi, List<string> paramapi, T body, string token = null)
        {
            foreach (var item in paramapi)
            {
                nameApi = string.Concat(nameApi, "/" + item);
            }

            if (token != null)
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            }

            var response = await _httpClient.PostAsJsonAsync(nameApi, body);
            var resposta = await Verifica_Acesso(response);

            return resposta;
        }

        public async Task<apiretorno> PutAPI<T>(string nameApi, T body, string token = null)
        {
            if (token != null)
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            }

            var response = await _httpClient.PutAsJsonAsync(nameApi, body);
            var resposta = await Verifica_Acesso(response);

            return resposta;
        }

        public async Task<apiretorno> PutAPI<T>(string nameApi, List<string> paramapi, T body, string token = null)
        {
            foreach (var item in paramapi)
            {
                nameApi = string.Concat(nameApi, "/" + item);
            }

            if (token != null)
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            }

            var response = await _httpClient.PutAsJsonAsync(nameApi, body);
            var resposta = await Verifica_Acesso(response);

            return resposta;
        }

        public async Task<apiretorno> DeleteAPI(string nameApi, string token = null)
        {
            if (token != null)
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            }

            var response = await _httpClient.DeleteAsync(nameApi);
            var resposta = await Verifica_Acesso(response);

            return resposta;
        }

        public async Task<apiretorno> DeleteAPI(string nameApi, List<string> paramapi, string token = null)
        {
            foreach (var item in paramapi)
            {
                nameApi = string.Concat(nameApi, "/" + item);
            }

            if (token != null)
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            }

            var response = await _httpClient.DeleteAsync(nameApi);
            var resposta = await Verifica_Acesso(response);

            return resposta;
        }

        public async Task<apiretorno> Verifica_Acesso(HttpResponseMessage response)
        {
            apiretorno resposta = await response.Content.ReadAsAsync<apiretorno>();
            if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                resposta = (resposta == null ? new() : resposta);
                resposta.statuscode = 401;
                resposta.success = false;
                resposta.mensage = "Acesso Negado";
            }
            return resposta;
        }

    }
}
