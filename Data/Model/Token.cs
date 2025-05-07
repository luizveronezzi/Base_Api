using System;

namespace Data.Model
{
    public class Token
    {
        public string ChaveToken { get; set; }
        public DateTime Validade { get; set; }
        public string Login { get; set; }
        public string Senha { get; set; }
    }
}
