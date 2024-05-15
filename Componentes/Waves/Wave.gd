extends Node
##Node responsável por segurar os dados de cada inimigo a ser spwanado pelo node Waves.
class_name Wave

##Contém os inimigos que seram spawnados. Cada Inimigos é spawnado conforme o Quantidade[] na posição correspondente.
@export var Inimigos : Array[PackedScene]

##Contém o a quantidade que cada inimigo em Inimigo[] deve ser spawnado.
@export var Quantidade : Array[int]

##Contém os nodes Path2D no qual os inimigos devem spawnar.
@export var LocalizacaoSpawn : Array[Path2D]

