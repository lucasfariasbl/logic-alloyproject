abstract sig Indicavel {}

sig Artista extends Indicavel {}

sig Album extends Indicavel {
	propriedade: one Artista,
	composicao: set Cancao
}

sig Cancao extends Indicavel {
	colaboradores: set Artista
}

abstract sig Categoria {
	indicados: set Indicavel
}

one sig MelhorArtistaBanda extends Categoria {}
one sig MelhorAlbum extends Categoria {}
one sig MelhorColaboracao extends Categoria {}
one sig MelhorCancao extends Categoria {}


fact GrammyRules {
	Categoria = MelhorArtistaBanda + MelhorAlbum + MelhorColaboracao + MelhorCancao

	all c: Categoria | #c.indicados >= 4 and #c.indicados <= 8

	MelhorArtistaBanda.indicados in Artista
	MelhorAlbum.indicados in Album
	MelhorColaboracao.indicados in Cancao
	MelhorCancao.indicados in Cancao

	all c: Cancao | some c.colaboradores

	// Regra 1: Artistas/bandas indicados na categoria Melhor Artista/Banda devem ter um álbum indicado na categoria Melhor Álbum. (Lógica revisada)
	all a: MelhorArtistaBanda.indicados | some alb: MelhorAlbum.indicados | a = alb.propriedade

	// Regra 2: Canções indicadas para Melhor Colaboração devem ter mais de um artista.
	all c: MelhorColaboracao.indicados | #c.colaboradores > 1

	// Regra 3: Pelo menos metade das canções indicadas para Melhor Canção devem pertencer a um álbum que também está indicado para Melhor Álbum.
	let cancoes_indicadas = MelhorCancao.indicados,
		cancoes_de_albuns_indicados = (MelhorAlbum.indicados).composicao,
		cancoes_em_comum = cancoes_indicadas & cancoes_de_albuns_indicados,
		outras_cancoes_indicadas = cancoes_indicadas - cancoes_em_comum
	{
		#cancoes_em_comum >= #outras_cancoes_indicadas
	}
}

run {} for 8
