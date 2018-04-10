package com.example.algamoney.api.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.algamoney.api.model.Lancamento;
import com.example.algamoney.api.model.Pessoa;
import com.example.algamoney.api.repository.LancamentoRepository;
import com.example.algamoney.api.repository.PessoaRepository;
import com.example.algamoney.api.repository.filter.LancamentoFilter;
import com.example.algamoney.api.service.exception.PessoaInexistenteOuInativaException;

@Service
public class LancamentoService {

	@Autowired
	LancamentoRepository lancamentoRepository;
	
	@Autowired
	PessoaRepository pessoaRepository;

	public List<Lancamento> buscarTodos(LancamentoFilter lancamentoFilter) {
		return lancamentoRepository.filtrar(lancamentoFilter);
	}
	
	public Lancamento buscarPorCodigo(Long codigo) {
		return lancamentoRepository.findOne(codigo);
	}

	public Lancamento salvar(Lancamento lancamento) {
		Pessoa pessoa = pessoaRepository.findOne(lancamento.getPessoa().getCodigo());
		if(pessoa == null || pessoa.inativa()) 
			throw new PessoaInexistenteOuInativaException();
			
		return lancamentoRepository.save(lancamento);
	}

	public void remover(Long codigo) {
		lancamentoRepository.delete(codigo);
	}
}
