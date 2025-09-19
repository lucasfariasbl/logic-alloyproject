# Projeto de Lógica - Alloy

## Descrição do Projeto
Este projeto modela o sistema de indicações do Grammy, focando nas 4 principais categorias: melhor artista/banda, melhor álbum, melhor canção e melhor colaboração. O modelo especifica as relações entre artistas, álbuns e canções, garantindo que artistas indicados possuam álbuns também indicados, que colaborações envolvam múltiplos artistas, e que pelo menos metade das canções indicadas estejam presentes em álbuns indicados. Cada categoria suporta de 4 a 8 indicações, seguindo as regras específicas da premiação.

## Antes de Tudo

Antes de executar este projeto, verifique se o **Alloy Analyzer** está instalado em sua máquina. Para verificar se já possui o Alloy instalado:

- **Windows/Mac**: Procure pelo arquivo `alloy.jar` ou aplicativo Alloy (normalmente fica na pasta de extração) em seu sistema
- **Linux**: Tente executar `java -jar alloy.jar` em seu terminal (se estiver no PATH)

## Instalação do Alloy

Se você não possui o Alloy instalado, siga os passos abaixo:

### Download da Versão Mais Recente

1. Acesse a página de releases do Alloy: https://github.com/AlloyTools/org.alloytools.alloy/releases
2. Baixe a versão mais recente (atualmente Alloy 6.2.0)
3. Escolha o arquivo apropriado para seu sistema operacional:
   - **Multiplataforma**: `org.alloytools.alloy.dist.jar` (funciona em Windows, Mac e Linux)
   - **MacOS**: `alloy.dmg` (específico para Mac)

### Instalação

**Para arquivo JAR (Windows, Mac, Linux):**
1. Extraia o arquivo baixado para uma pasta de sua escolha
2. Para executar: duplo-clique no arquivo JAR ou execute via terminal:
   ```bash
   java -jar org.alloytools.alloy.dist.jar
   ```

**Para MacOS (.dmg):**
1. Abra o arquivo `alloy.dmg` baixado e clique duas vezes no ícone do Alloy4
2. Para manter a aplicação, arraste o ícone para fora da janela dmg e coloque em seu diretório home ou desktop

## Clonando o Projeto

Para obter uma cópia deste projeto, execute o seguinte comando:

```bash
git clone https://github.com/lucasfariasbl/logic-alloyproject
```

## Como Usar o Alloy Analyzer

Após instalar o Alloy e clonar o projeto, siga estes passos:

1. **Abra o Alloy Analyzer** (duplo-clique no JAR ou execute via terminal)

2. **Abra o projeto:**
   - Selecione **Open** 
   - Navegue até a pasta do projeto clonado
   - Selecione o arquivo `.als` do projeto

3. **Execute o modelo:**
   - Selecione um comando para executar através do menu **Execute**
   - Por padrão, o analisador executará o comando superior no arquivo

4. **Visualize os resultados:**
   - Os resultados da análise aparecerão no painel de mensagens
   - Cada contraexemplo e instância satisfatória terá um hyperlink clicável que abrirá o Alloy Visualizer

## Contribuidores

* **Adson Gabriel Farias da Silva**: [NotAdson](https://github.com/NotAdson)
* **Ana Beatriz Lins Pereira**: [ab-lins](https://github.com/ab-lins)
* **Érik Alves Almeida**: [ErikAlvesAlmeida](https://github.com/erikAlvesAlmeida/)
* **Lucas Farias Bezerra de Lima**: [lucasfariasbl](https://github.com/lucasfariasbl)
* **Yan Vitor de Lira Silva**: [yanvls7](https://github.com/yanvls7)

---

## Recursos Adicionais

- [Documentação Oficial do Alloy](https://alloytools.org/)
- [Tutorial Online](https://alloytools.org/tutorials/online/)
- [Repositório no GitHub](https://github.com/AlloyTools/org.alloytools.alloy)
