using System.Collections.Generic;
using System.Threading.Tasks;

namespace Data.Interface
{
    public interface IGenericoCrud<Tabela> where Tabela : class
    {
        Task InserirAsync(Tabela tabela);
        Task AlterarAsync(Tabela tabela);
        Task ExcluirAsync(Tabela tabela);
        Task InserirVariosAsync(List<Tabela> tabela);
        Task<Tabela> PesquisarAsync(int id);
    }
}
