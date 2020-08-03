# Declaração de arrays:

```sh
let carros = [
	'Gol',
	'Passat',
	'Ecosport',
	'Golf',
	'Uno'
];
```

# Resgatando valores de arrays:

```sh
let gol = carros[0]; // Retorna o valor 'Gol' do array carros, pois está no primeiro índice que é o 0
let passat = carros[1]; // Retorna o valor 'Passat' do array carros, pois está no índice 1 do array
let golf = carros[3]; // Retorna o valor 'Golf' do array carros, pois está no índice 3 do array
let uno = carros[4]; // Retorna o valor 'Uno' do array carros, pois está no índice 4 do array
```

Também é possível usar variáveis como índice do array para substituir o valor direto
Que é basicamente o que a gente faz com o i no no for
- No índice 2 do array carros está o valor ecosport

```sh
let ecosportIndice = 2;
let ecosport = carros[ecosportIndice];  // Retorna o valor 'Ecosport' do array carros, pois a variável ecosportIndice vale 2...
```

# Inserindo valores em arrays sem ser pela declaração da variável:

```sh
carros.push('Corsa'); // A função push, vai adicionar a string que vier por parâmetro que, nesse caso
					  // é o item 'Corsa' ao array, e ele vai entrar na última posição do array, 
					  // ficando:
```

	* Isso é o output do console, não é pra digitar
	[
		'Gol',
		'Passat',
		'Ecosport',
		'Golf',
		'Uno',
		'Corsa'
	]


```sh

carros.push('Mustang'); 	// Adicionado mais o item 'Mustang' ao array
							// Ficando:
```							

	* Isso é o output do console, não é pra digitar
	[
		'Gol',
		'Passat',
		'Ecosport',
		'Golf',
		'Uno',
		'Corsa',
		'Mustang'
	]

Outro jeito além do push para adicionar ites no array é assim:

```sh
carros[] = 'Fusca'; 	// Dessa outra forma, também é adicioando no final do array o valor
						// Ficando:
```	

	* Isso é o output do console, não é pra digitar
	[
		'Gol',
		'Passat',
		'Ecosport',
		'Golf',
		'Uno',
		'Corsa',
		'Mustang',
		'Fusca'
	]

# Como modificar um item de um array

O indice 3 do array carros é o Golf, vamos adicionar o GTI no nome dele,
```sh
let indiceAModificar = 3;
```
Para isso, precisamos passar o indice no carros e atribuir um novo valor

```sh
carros[indiceAModificar] = 'Golf GTI';
```

O array ficou assim:

	* Isso é o output do console, não é pra digitar
	[
		'Gol',
		'Passat',
		'Ecosport',
		'Golf GTI',
		'Uno',
		'Corsa',
		'Mustang',
		'Fusca'
	]

Agora, mudando o Uno (que é o índice 4) para Camaro

```sh
carros[4] = 'Camaro';
```

Ficando:

	* Isso é o output do console, não é pra digitar
	[
		'Gol',
		'Passat',
		'Ecosport',
		'Golf GTI',
		'Camaro',
		'Corsa',
		'Mustang',
		'Fusca'
	]


# Resgatar a quantidade de itens dentro do array

- carros.length retorna a quantidade de itens que tem dentro do array

```sh
let carrosQuantidade = carros.length;
```

Inteirando o array (looping com for)
Declarando uma variável de interação como o 'index' (pode ser o nome que quiser, geralmente é i que é a abreviação de index),

Dentro do () do for, temos 3 etapas, separadas por ;
Na primeira você define um valor inicial, 
Na segunda, faz a condição para o loop ser válido (se for true, vai entrar no loopping)
Na terceira, altera essa variável (index++ ou index--)

Nesse caso, vamos inteirar o for de acordo com o tamanho do array carros, se tiver 8 itens no array, vamos inteirar 8 vezes
Vale lembrar que o array começa no index 0, e o .length vai retornar a quantidade de itens e não tem relação com o index,
então, se o array.length retorna 8 itens, ele terá os index do 0 ao 7

Processo do looping:
Com o index começando com 0 (var index = 0)
Vai ser feito a verificação da segunda parte do for (index < carrosQuantidade), se for verdadeiro, vai entrar e
Vai ser executado o bloco de código do for, que é tudo que está dentro do {}
Depois vai fazer a atribuição da terceira parte do for que é (index++), ou seja, o index vai aumentando 1 a cada volta,
Mas o index só aumenta depois de executar todo o bloco de código dentro do {}, então, se iniciar o index com 0, na primeira volta se
Chamar o index dentro do bloco, ele irá valer 0, mas vai aumentando um a cada volta

```sh
for (var index = 0; index < carrosQuantidade; index++) {
	console.log(carros[index]);
	console.log[index];
}
```

# Trabalhando com ararys de multiníveis

Vamos supor que a gente queira segmentar os nossos carros por marcas,
Para isso, vamos ter que ter basicamente array dentro de array, saca esse exemplo

```sh

let marcasVW = []; // inicializo um array vazio
let marcasFord = []; // inicializo um array vazio
let marcasGM = []; // inicializo um array vazio

for (var index = 0; index < carrosQuantidade; index++) {

	if(carros[index] == 'Gol' || carros[index] == 'Golf GTI' || carros[index] == 'Passat' || carros[index] == 'Fusca') {
		marcasVW.push(carros[index]; 
	}

	if(carros[index] == 'Ecosport' || carros[index] == 'Mustang') {
		marcasFord.push(carros[index]; 
	}

	if(carros[index] == 'Camaro' || carros[index] == 'Corsa') {
		marcasGM.push(carros[index]; 
	}

}

console.log(marcasVW);
console.log(marcasFord);
console.log(marcasGM);

let marcas = [
	marcasVW,
	marcasFord,
	marcasGM,
];
```

Esse array marcas, que agora contém 3 arrays de marcas dentro contendo modelos em cada um ficaria assim:

	* Isso é o output do console, não é pra digitar
	[
		[
			'Gol',
			'Passat',
			'Golf GTI',
			'Fusca'
		],
		[
			'Ecosport',
			'Mustang',
		],
		[
			'Camaro',
			'Corsa',
		]
	]


Ele viraria um array de 2 níveis, já que é um array que contém arrays
Para pegar um valor específico de um array, você precisa por as [] com os índices dentro, precisa ser 1 [] pra cada nível:
Exemplo, vamos supor que eu queria pegar o camaro:

Primeiro de tudo, dê um console.log(marcas), ou jogue marcas no console do navegador, vai retornar algo assim:

```sh
console.log(marcas)
```

	* Isso é o output do console, não é pra digitar
	[
		0: [
			0: 'Gol',
			1: 'Passat',
			2: 'Golf GTI',
			3: 'Fusca',
			length: 4
		],
		1: [
			0: 'Ecosport',
			1: 'Mustang',
			length: 2
		],
		2: [
			0: 'Camaro',
			1: 'Corsa',
			length: 2
		],
		length: 3
	]

Então, para pegar o Camaro primeiro, precisamos entrar no nó que ele está (é o índice 2)

```sh
marcas[2] // Isso vai retornar um arary simples:
```
	* Isso é o output do console, não é pra digitar
	[
		0: 'Camaro',
		1: 'Corsa',
		length: 2
	]

Até esse ponto, podemos fazer 2 coisas:
- 1: Atribuir esse resultado a uma variável e pegar o valor dela pelo index normalmente
```sh
let chevrolet = marcas[2];
chevrolet[0]; // <--- Aqui está o Camaro
```

- 2: Ou pegar o valor direto, colocando um [] para cada nível e com o respectivo índice:
```sh
marcas[2][0]; // <--- Aqui está o Camaro
```



Se quisessem inteirar em cada um desses itens, bastaria inserir um for, dentro de outro for
O for de fora, ou seja, o primeiro for seria o responsável por pegar as marcas e o segundo for (o de dentro) pegaria os modelos dentro
```sh
for (var marcaIndice = 0; marcaIndice < marcas.length; marcaIndice++) {

	let marcaCarro = marcas[marcasIndice]; // <-- Essa seria a sua marca, (O array simples que contém os modelos)
	
	for (var modeloIndice = 0; modeloIndice < marcaCarro.length; modeloIndice++) {
		
		marcaCarro[modeloIndice]; // <-- Esse seria o seu modelo
	
	}

}
```


