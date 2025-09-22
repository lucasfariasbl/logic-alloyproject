// ENTIDADES PRINCIPAIS
abstract sig Indicavel {}

sig Artista extends Indicavel {}
sig Album extends Indicavel {
  propriedade: one Artista,
  composicao: some Cancao  // cada álbum tem pelo menos 1 canção
}
sig Cancao extends Indicavel {
  colaboradores: some Artista // cada canção tem pelo menos 1 colaborador
}

// CATEGORIAS
abstract sig Categoria {}

one sig MelhorArtistaBanda extends Categoria { indicados: set Artista }
one sig MelhorAlbum extends Categoria { indicados: set Album }
one sig MelhorColaboracao extends Categoria { indicados: set Cancao }
one sig MelhorCancao extends Categoria { indicados: set Cancao }

// --- REGRAS REATORADAS ---
// Cada canção pode fazer parte de no máximo 2 álbuns
fact LimiteDeCancoesPorAlbum {
  all c: Cancao | #(c.~composicao) <= 2
}

// Todas as categorias compõem o universo de categorias
fact UniversoDeCategorias {
  Categoria = MelhorArtistaBanda + MelhorAlbum + MelhorColaboracao + MelhorCancao
}

// Cada categoria tem entre 4 e 8 indicados
fact NumeroDeIndicadosPorCategoria {
  #MelhorArtistaBanda.indicados >= 4 and #MelhorArtistaBanda.indicados <= 8
  #MelhorAlbum.indicados >= 4 and #MelhorAlbum.indicados <= 8
  #MelhorColaboracao.indicados >= 4 and #MelhorColaboracao.indicados <= 8
  #MelhorCancao.indicados >= 4 and #MelhorCancao.indicados <= 8
}

// Regra: artistas indicados são proprietários de álbuns indicados
fact RelacaoArtistaAlbumIndicados {
  MelhorArtistaBanda.indicados in MelhorAlbum.indicados.propriedade
}

// Regra: canções de Melhor Colaboração têm mais de 1 artista
fact ColaboracaoComMultiplosArtistas {
  all c: MelhorColaboracao.indicados | #c.colaboradores > 1
}

// Regra: pelo menos metade das canções de Melhor Canção estão em álbuns indicados
fact MetadeDasCancoesIndicadasEmAlbunsIndicados {
  let cancoes_indicadas = MelhorCancao.indicados,
      cancoes_de_albuns_indicados = (MelhorAlbum.indicados).composicao,
      cancoes_em_comum = cancoes_indicadas & cancoes_de_albuns_indicados,
      outras_cancoes_indicadas = cancoes_indicadas - cancoes_em_comum
  {
    #cancoes_em_comum >= #outras_cancoes_indicadas
  }
}

// --- ASSERÇÕES ---
// As asserções verificam se propriedades esperadas são sempre verdadeiras no modelo.

// Esta asserção verifica se um álbum indicado pode ser de um artista que não foi indicado.
// O Alloy deve encontrar um contra-exemplo, mostrando que a especificação permite isso.
assert ChecaProprietarioDeAlbumIndicado {
    // Para todo álbum indicado, o artista proprietário do álbum também deve estar indicado.
    all a: MelhorAlbum.indicados | a.propriedade in MelhorArtistaBanda.indicados
}

// Esta asserção verifica se todo artista indicado possui de fato alguma canção
// associada a ele através de um de seus álbuns indicados.
// Dada a regra "RelacaoArtistaAlbumIndicados" e a estrutura de "Album",
// esta asserção deve ser sempre válida (nenhum contra-exemplo encontrado).
assert ChecaSeArtistaIndicadoTemCancao {
    all art: MelhorArtistaBanda.indicados | // Para todo artista indicado...
        // ...existe algum álbum indicado que seja de sua propriedade...
        some alb: MelhorAlbum.indicados | alb.propriedade = art and
        // ...e esse álbum possui alguma canção.
        some alb.composicao
}

// COMANDO PARA EXECUTAR
run {
#Artista >= 8
#Album >= 8
#Cancao >= 12
} for 30 but 8 Int

// --- COMANDOS CHECK ---
// Para rodar, vá no menu "Execute" e escolha um dos "Check..."
check ChecaSeArtistaIndicadoTemCancao for 15 but 8 int
check ChecaProprietarioDeAlbumIndicado for 15 but 8 int
