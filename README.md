# MOD2.2
## Modelo Relacional

Volúntarios:
-idVoluntario (PK)
- Nome
- CPF
- Funcao

Canteiros:
- idCanteiro (PK)
- Local

Plantas:
- idPlanta (PK)
- Especie
- Tipo

Plantio:
- idPlantio (PK)
- DataPlantio
- QuantidadePlantada
- idVoluntario (FK)
- idCanteiro (FK)
- idPlanta (FK)

Colheita: 
- idColheita (PK)
- idPlantio (FK)
- DataColheita
- QuantidadeColhida

Instituições:
- idInstituicao (PK)
- NomeInstituicao
- Endereco

Doações:
- idDoacao (PK)
- idColheita (FK)
- idInstituicao (FK)
- QuantidadeDoad
- DataDoacao


Relação:

Voluntário — Plantio : 1 : N (Um voluntário pode realizar varios plantios)

Canteiro — Plantio : 1 : N (Um canteiro pode ter varios plantios)

Planta — Plantio : 1 : N  (Uma planta pode ser plantada diversas vezes)

Plantio — Colheita : 1 : N (Um plantio pode ter varias colheitas)

Colheita — Doacao : N : N (Varias colheitas podem ser dividas em varias doações)

Instituição — Doacao : 1 : N (Uma instituição pode receber varia doações)
