using System;
using System.Threading.Tasks;

namespace Data.Interface
{
    public interface IUnitOfWork : IDisposable
    {
        IAcessos Acessos { get; }
        Task<int> SaveAsync();
    }
}
