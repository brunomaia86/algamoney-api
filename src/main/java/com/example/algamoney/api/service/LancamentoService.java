package com.example.algamoney.api.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.algamoney.api.model.Lancamento;
import com.example.algamoney.api.repository.LancamentoRepository;

@Service
public class LancamentoService {

	@Autowired
	LancamentoRepository lancamentoRepository;

	public List<Lancamento> buscarTodos() {
		return lancamentoRepository.findAll();
	}
	
	public Lancamento buscarPorCodigo(Long codigo) {
		return lancamentoRepository.findOne(codigo);
	}

	public Lancamento salvarLancamento(Lancamento lancamento) {
		return lancamentoRepository.save(lancamento);
	}
}
