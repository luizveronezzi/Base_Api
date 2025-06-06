﻿using Data.Interface;
using Data.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace API.Services
{
    public class IntegracaoApi : IIntegracaoApi

    {
        public string token { get; set; }
        public string parametros { get; set; } = string.Empty;

        private readonly HttpClient _httpClient = new HttpClient();

        public IntegracaoApi(IConfiguration _configuration)
        {
            _httpClient.DefaultRequestHeaders.Accept.Clear();
            _httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue(_configuration["APIConfig:ContentTypeJson"]));
            _httpClient.BaseAddress = new System.Uri(_configuration["APIConfig:UrlBase"]);
        }

        public void SetUrlbase(string urlNova)
        {
            _httpClient.BaseAddress = new System.Uri(urlNova);
        }

        public void SetParameters(Dictionary<string, dynamic> parameters)
        {
            string sets = "?";
            string value;

            foreach (var item in parameters)
            {
                value = Convert.ToString(item.Value);
                value = System.Uri.EscapeDataString(value);
                sets += item.Key + "=" + value + "&";
            }
            this.parametros = sets.Substring(0, sets.Length - 1);
        }

        public async Task<apiretorno> GetAPI(string nameApi)
        {
            if (this.parametros != null)
            {
                nameApi = string.Concat(nameApi, this.parametros);
            }

            if (this.token != null)
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", this.token);
            }

            var response = await _httpClient.GetAsync(nameApi);
            var resposta = await Verifica_Acesso(response);

            return resposta;
        }

        public async Task<apiretorno> PostAPI<T>(string nameApi, T body)
        {
            if (this.parametros != null)
            {
                nameApi = string.Concat(nameApi, this.parametros);
            }

            if (this.token != null)
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", this.token); ;
            }

            var response = await _httpClient.PostAsJsonAsync(nameApi, body);
            var resposta = await Verifica_Acesso(response);

            return resposta;
        }

        public async Task<apiretorno> PutAPI<T>(string nameApi, T body)
        {
            if (this.parametros != null)
            {
                nameApi = string.Concat(nameApi, this.parametros);
            }

            if (this.token != null)
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", this.token);
            }

            var response = await _httpClient.PutAsJsonAsync(nameApi, body);
            var resposta = await Verifica_Acesso(response);

            return resposta;
        }

        public async Task<apiretorno> DeleteAPI(string nameApi)
        {
            if (this.parametros != null)
            {
                nameApi = string.Concat(nameApi, this.parametros);
            }

            if (this.token != null)
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", this.token);
            }

            var response = await _httpClient.DeleteAsync(nameApi);
            var resposta = await Verifica_Acesso(response);

            return resposta;
        }

        public async Task<dynamic> GetData<T>(apiretorno data)
        {
            var retorno = await Task.Run(() => JsonConvert.DeserializeObject<T>(data.data));
            return retorno;
        }

        private async Task<apiretorno> Verifica_Acesso(HttpResponseMessage response)
        {
            apiretorno resposta = new();

            if (!response.IsSuccessStatusCode)
            {
                resposta.statuscode = (int)response.StatusCode;
                resposta.success = false;
                resposta.mensage = response.ReasonPhrase;
            }
            else
            {
                resposta = await response.Content.ReadFromJsonAsync<apiretorno>();
                resposta.data = await response.Content.ReadAsStringAsync();
            }
            return resposta;
        }

    }
}
