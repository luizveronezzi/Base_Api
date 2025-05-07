using Data.Interface;
using Data.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Threading.Tasks;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class acessosController : ControllerBase
    {

        private readonly IUnitOfWork _uow;

        public acessosController(IUnitOfWork uow)
        {
            _uow = uow;
        }

        // GET: api/acessos/5
        [HttpGet("{id}")]
        public async Task<ActionResult<acessos>> Getacessos(int id)
        {
            apiretorno retorno = new();
            try
            {
                var dados = await _uow.Acessos.PesquisarAsync(id);
                if (dados == null)
                {
                    return BadRequest(retorno.ApiError("Acesso Não Encontrado"));
                }
                else
                {
                    return Ok(retorno.ApiOk("Leitura Completa", dados));
                }

            }
            catch (Exception)
            {
                return BadRequest(retorno.ApiError("Erro da Leitura dos Dados"));
            }
        }

        // PUT: api/acessos/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut]
        public async Task<IActionResult> Putacessos(acessos acessos)
        {
            apiretorno retorno = new();
            await _uow.Acessos.AlterarAsync(acessos);
            try
            {
                await _uow.SaveAsync();
                return Ok(retorno.ApiOk("Acesso Atualizado Com Sucesso"));

            }
            catch (DbUpdateConcurrencyException)
            {
                return BadRequest(retorno.ApiError("Falha ao Atualizar o Acesso"));
            }
        }

        // POST: api/acessos
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<acessos>> Postacessos(acessos acessos)
        {
            apiretorno retorno = new();
            try
            {
                await _uow.Acessos.InserirAsync(acessos);
                await _uow.SaveAsync();
                return Ok(retorno.ApiOk("Acesso Inserido Com Sucesso", acessos));
            }
            catch (DbUpdateConcurrencyException)
            {
                return BadRequest(retorno.ApiError("Erro ao Inserir o Acesso"));
            }
            //return CreatedAtAction("Getacessos", new { id = acessos.id }, acessos);
        }

        // DELETE: api/acessos/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Deleteacessos(int id)
        {
            apiretorno retorno = new();
            try
            {
                var dados = await _uow.Acessos.PesquisarAsync(id);
                if (dados == null)
                {
                    return BadRequest(retorno.ApiError("Acesso Não Encontrado"));
                }
                else
                {
                    await _uow.Acessos.ExcluirAsync(dados);
                    await _uow.SaveAsync();
                    return Ok(retorno.ApiOk("Acesso Excluido Com Sucesso"));
                }

            }
            catch (DbUpdateConcurrencyException)
            {
                return BadRequest(retorno.ApiError("Erro ao Excluir o Acesso"));
            }
        }
    }
}
