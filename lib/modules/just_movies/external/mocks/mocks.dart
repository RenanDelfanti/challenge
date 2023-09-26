import 'package:interfaces/interfaces.dart';
import 'package:just_movies/core/exceptions/movies_exceptions.dart';

ApiResponse apiResponseMovieDetails = ApiResponse(statusCode: 200, body: mockDetails);
ApiResponse apiResponsePopularMovies = ApiResponse(statusCode: 200, body: mockPopularMovies);

ApiResponse apiResponseMovieDetailsError401 = ApiResponse(
  statusCode: 401,
  body: error401,
  failure: MoviesException.fromMap(error401, 401),
);
ApiResponse apiResponsePopularMoviesError401 = ApiResponse(
  statusCode: 401,
  body: error401,
  failure: MoviesException.fromMap(error401, 401),
);

ApiResponse apiResponseMovieDetailsError404 = ApiResponse(
  statusCode: 404,
  body: error404,
  failure: MoviesException.fromMap(error404, 404),
);
ApiResponse apiResponsePopularMoviesError404 = ApiResponse(
  statusCode: 404,
  body: error404,
  failure: MoviesException.fromMap(error404, 404),
);

ApiResponse apiResponseMovieDetailsError500 = ApiResponse(
  statusCode: 500,
  body: error500,
  failure: MoviesException.fromMap(error500, 500),
);
ApiResponse apiResponsePopularMoviesError500 = ApiResponse(
  statusCode: 500,
  body: error500,
  failure: MoviesException.fromMap(error500, 500),
);

ApiResponse apiResponseMovieDetailsErrorApiClient = ApiResponse(
  statusCode: 500,
  body: error500,
);
ApiResponse apiResponsePopularMoviesErrorApiClient = ApiResponse(
  statusCode: 500,
  body: error500,
);

var error401 = {"status_code": 7, "status_message": "Invalid API key: You must be granted a valid key.", "success": false};
var error404 = {"success": false, "status_code": 34, "status_message": "The resource you requested could not be found."};
var error500 = {"success": false, "status_code": 500, "status_message": "Internal error: Something went wrong, contact TMDb."};

var mockDetails = {
  "adult": false,
  "backdrop_path": "/H6j5smdpRqP9a8UnhWp6zfl0SC.jpg",
  "belongs_to_collection": null,
  "budget": 120000000,
  "genres": [
    {"id": 28, "name": "Ação"},
    {"id": 878, "name": "Ficção científica"},
    {"id": 12, "name": "Aventura"}
  ],
  "homepage": "",
  "id": 565770,
  "imdb_id": "tt9362930",
  "original_language": "en",
  "original_title": "Blue Beetle",
  "overview":
      "Jaime Reyes, um adolescente de origem mexicana que encontra um artefato alienígena que lhe dá um exoesqueleto mecanizado e poderes, tornando-o no Besouro Azul.",
  "popularity": 3868.894,
  "poster_path": "/y5sdkgO4IJMTnkjh9PG7kREPWrP.jpg",
  "production_companies": [
    {"id": 174, "logo_path": "/IuAlhI9eVC9Z8UQWOIDdWRKSEJ.png", "name": "Warner Bros. Pictures", "origin_country": "US"},
    {"id": 11565, "logo_path": null, "name": "The Safran Company", "origin_country": "US"},
    {"id": 128064, "logo_path": "/13F3Jf7EFAcREU0xzZqJnVnyGXu.png", "name": "DC Films", "origin_country": "US"}
  ],
  "production_countries": [
    {"iso_3166_1": "US", "name": "United States of America"}
  ],
  "release_date": "2023-08-16",
  "revenue": 122922648,
  "runtime": 127,
  "spoken_languages": [
    {"english_name": "English", "iso_639_1": "en", "name": "English"},
    {"english_name": "Portuguese", "iso_639_1": "pt", "name": "Português"},
    {"english_name": "Spanish", "iso_639_1": "es", "name": "Español"}
  ],
  "status": "Released",
  "tagline": "Jaime Reyes é um super-herói, quer ele goste ou não.",
  "title": "Besouro Azul",
  "video": false,
  "vote_average": 7.152,
  "vote_count": 802
};

var mockPopularMovies = {
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/H6j5smdpRqP9a8UnhWp6zfl0SC.jpg",
      "genre_ids": [28, 878, 12],
      "id": 565770,
      "original_language": "en",
      "original_title": "Blue Beetle",
      "overview":
          "Jaime Reyes, um adolescente de origem mexicana que encontra um artefato alienígena que lhe dá um exoesqueleto mecanizado e poderes, tornando-o no Besouro Azul.",
      "popularity": 3868.894,
      "poster_path": "/y5sdkgO4IJMTnkjh9PG7kREPWrP.jpg",
      "release_date": "2023-08-16",
      "title": "Besouro Azul",
      "video": false,
      "vote_average": 7.1,
      "vote_count": 778
    },
    {
      "adult": false,
      "backdrop_path": "/iIvQnZyzgx9TkbrOgcXx0p7aLiq.jpg",
      "genre_ids": [27, 53],
      "id": 1008042,
      "original_language": "en",
      "original_title": "Talk to Me",
      "overview":
          "Quando um grupo de amigos descobre como conjurar espíritos usando uma antiga mão embalsamada, eles ficam viciados na nova emoção. Até que um deles vai longe demais e abre a porta para o mundo espiritual.",
      "popularity": 2836.112,
      "poster_path": "/n2HcaD1dEVrwXlSFJD7GmcqHSxv.jpg",
      "release_date": "2023-07-26",
      "title": "Fale Comigo",
      "video": false,
      "vote_average": 7.2,
      "vote_count": 798
    },
    {
      "adult": false,
      "backdrop_path": "/8pjWz2lt29KyVGoq1mXYu6Br7dE.jpg",
      "genre_ids": [28, 878, 27],
      "id": 615656,
      "original_language": "en",
      "original_title": "Meg 2: The Trench",
      "overview":
          "Um mergulho exploratório nas profundezas do oceano de uma ousada equipe de pesquisa se transforma em caos quando uma operação de mineração malévola ameaça sua missão e os força a uma batalha de alto risco pela sobrevivência.",
      "popularity": 2837.94,
      "poster_path": "/klGKGITBYYyTiHrph1VDSgGULOR.jpg",
      "release_date": "2023-08-02",
      "title": "Megatubarão 2",
      "video": false,
      "vote_average": 7,
      "vote_count": 1894
    },
    {
      "adult": false,
      "backdrop_path": "/4XM8DUTQb3lhLemJC51Jx4a2EuA.jpg",
      "genre_ids": [28, 80, 53],
      "id": 385687,
      "original_language": "en",
      "original_title": "Fast X",
      "overview":
          "O fim da estrada está chegando. Velozes & Furiosos 10, é o décimo filme da franquia Velozes & Furiosos, lança os capítulos finais de uma grande saga, uma das mais famosas e populares do cinema, agora com sua terceira década e ainda mais forte. Com o mesmo elenco e personagens principais de quando começou. Ao longo de muitas missões e lutando contra todos os obstáculos impossíveis, Dom Toretto (Vin Diesel) e sua família foram mais espertos, mais furiosos e mais rápidos do que todos os inimigos em seu caminho. Agora, eles enfrentam o seu oponente mais letal: uma ameaça terrível das sombras do passado, alimentada por sede de vingança e determinada a destruir esta família.",
      "popularity": 2255.179,
      "poster_path": "/wDWAA5QApz5L5BKfFaaj8HJCAQM.jpg",
      "release_date": "2023-05-17",
      "title": "Velozes & Furiosos 10",
      "video": false,
      "vote_average": 7.3,
      "vote_count": 3811
    },
    {
      "adult": false,
      "backdrop_path": "/iiXliCeykkzmJ0Eg9RYJ7F2CWSz.jpg",
      "genre_ids": [28, 9648, 53, 80],
      "id": 762430,
      "original_language": "en",
      "original_title": "Retribution",
      "overview":
          "Com seus filhos presos no banco de trás e uma bomba que explodirá se eles saírem do carro, um trajeto normal se torna um jogo distorcido de vida ou morte enquanto Matt Turner segue as instruções cada vez mais perigosas de um estranho em uma corrida contra o tempo para salvar sua  família.",
      "popularity": 2699.586,
      "poster_path": "/yd0iEtqAXseXQgKf9RjmMaPjUPG.jpg",
      "release_date": "2023-08-23",
      "title": "A Chamada",
      "video": false,
      "vote_average": 6.7,
      "vote_count": 185
    },
    {
      "adult": false,
      "backdrop_path": "/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg",
      "genre_ids": [35, 12, 14],
      "id": 346698,
      "original_language": "en",
      "original_title": "Barbie",
      "overview":
          "No mundo mágico das Barbies, \"Barbieland\", uma das bonecas começa a perceber que não se encaixa como as outras. Depois de ser expulsa, ela parte para uma aventura no \"mundo real\", onde descobre que a beleza está no interior de cada um.",
      "popularity": 2173.73,
      "poster_path": "/yRRuLt7sMBEQkHsd1S3KaaofZn7.jpg",
      "release_date": "2023-07-19",
      "title": "Barbie",
      "video": false,
      "vote_average": 7.3,
      "vote_count": 4923
    },
    {
      "adult": false,
      "backdrop_path": "/53z2fXEKfnNg2uSOPss2unPBGX1.jpg",
      "genre_ids": [27, 9648, 53],
      "id": 968051,
      "original_language": "en",
      "original_title": "The Nun II",
      "overview":
          "Quatro anos após os acontecimentos na abadia de St. Carta, a Irmã Irene (Taissa Farmiga) regressa mais uma vez e depara-se com a força demoníaca de Valak, a Freira (Bonnie Aarons).",
      "popularity": 1934.723,
      "poster_path": "/jv7lyPfBC1heRWtQUd1gX7Q0wSo.jpg",
      "release_date": "2023-09-06",
      "title": "A Freira 2",
      "video": false,
      "vote_average": 6.6,
      "vote_count": 289
    },
    {
      "adult": false,
      "backdrop_path": "/4fLZUr1e65hKPPVw0R3PmKFKxj1.jpg",
      "genre_ids": [16, 35, 10751, 14, 10749],
      "id": 976573,
      "original_language": "en",
      "original_title": "Elemental",
      "overview":
          "Em uma cidade onde moradores do fogo, da água, da terra e do ar vivem juntos, uma jovem impetuosa e um homem tranquilo estão prestes a descobrir algo elementar: o quanto realmente têm em comum.",
      "popularity": 1284.846,
      "poster_path": "/7QsY7Jo3ZgL3pa1kdo28TA7Z6qo.jpg",
      "release_date": "2023-06-14",
      "title": "Elementos",
      "video": false,
      "vote_average": 7.8,
      "vote_count": 2314
    },
    {
      "adult": false,
      "backdrop_path": "/c6Splshb8lb2Q9OvUfhpqXl7uP0.jpg",
      "genre_ids": [28, 53],
      "id": 717930,
      "original_language": "en",
      "original_title": "Kandahar",
      "overview":
          "Um agente disfarçado da CIA chamado Tom Harris, que está designado para o Oriente Médio. Um vazamento de inteligência expõe perigosamente sua missão secreta e revela sua identidade secreta. Preso no coração de um território hostil, Harris e seu tradutor devem lutar para sair do deserto e chegar a um ponto de extração em Kandahar, no Afeganistão, enquanto escapam das forças especiais de elite que os caçam.",
      "popularity": 1386.625,
      "poster_path": "/xsmNNU5UbnurOnCOdUHbpv2XyFI.jpg",
      "release_date": "2023-05-25",
      "title": "Missão de Sobrevivência",
      "video": false,
      "vote_average": 6.9,
      "vote_count": 537
    },
    {
      "adult": false,
      "backdrop_path": "/35z8hWuzfFUZQaYog8E9LsXW3iI.jpg",
      "genre_ids": [12, 28],
      "id": 335977,
      "original_language": "en",
      "original_title": "Indiana Jones and the Dial of Destiny",
      "overview":
          "Encontrando-se em uma nova era, aproximando-se da aposentadoria, Indy luta para se encaixar em um mundo que parece tê-lo superado. Mas quando os tentáculos de um mal muito familiar retornam na forma de um antigo rival, Indy deve colocar seu chapéu e pegar seu chicote mais uma vez para garantir que um antigo e poderoso artefato não caia nas mãos erradas.",
      "popularity": 1108.143,
      "poster_path": "/ohyBuxe8peJQSdoS5hw31VmKCZ4.jpg",
      "release_date": "2023-06-28",
      "title": "Indiana Jones e A Relíquia do Destino",
      "video": false,
      "vote_average": 6.7,
      "vote_count": 1703
    },
    {
      "adult": false,
      "backdrop_path": "/waBWlJlMpyFb7STkFHfFvJKgwww.jpg",
      "genre_ids": [28, 18],
      "id": 678512,
      "original_language": "en",
      "original_title": "Sound of Freedom",
      "overview":
          "A história de Tim Ballard, um ex-agente do governo dos EUA, que largou seu emprego para dedicar sua vida a resgatar crianças de traficantes sexuais globais.",
      "popularity": 996.489,
      "poster_path": "/2BWhcrlPr6UvSJy5D044Ikq2QxH.jpg",
      "release_date": "2023-07-03",
      "title": "Som da Liberdade",
      "video": false,
      "vote_average": 8,
      "vote_count": 468
    },
    {
      "adult": false,
      "backdrop_path": "/w2nFc2Rsm93PDkvjY4LTn17ePO0.jpg",
      "genre_ids": [16, 35, 28],
      "id": 614930,
      "original_language": "en",
      "original_title": "Teenage Mutant Ninja Turtles: Mutant Mayhem",
      "overview":
          "Depois de anos sendo protegidos do mundo humano, os irmãos tartarugas saem para ganhar os corações dos nova yorkinos e serem aceitos como adolescentes normais através de seus atos heroicos. Sua nova amiga, April O’Neil, vai ajudá-los a derrotar um misterioso sindicado do crime, mas eles logo se veem em maus lençóis quando um exército de mutantes vai atrás deles.",
      "popularity": 770.729,
      "poster_path": "/n3M5gSOjWYxFakAsGbi6OFFi4LZ.jpg",
      "release_date": "2023-07-31",
      "title": "As Tartarugas Ninjas: Caos Mutante",
      "video": false,
      "vote_average": 7.3,
      "vote_count": 591
    },
    {
      "adult": false,
      "backdrop_path": "/iOJX54nVAsnPawagFiWXKv1Y6sB.jpg",
      "genre_ids": [16, 12, 10751],
      "id": 1076364,
      "original_language": "en",
      "original_title": "Carl's Date",
      "overview":
          "Carl Fredricksen relutantemente concorda em ir a um encontro com senhora amiga—mas reconhecidamente não tem ideia de como o namoro funciona hoje em dia. Sempre um amigo prestativo, Dug intervém para calmo o nervosismo pré-encontro de Carl e oferecer algumas dicas testadas e comprovadas para fazer amigos—se você for um cachorro.",
      "popularity": 982.738,
      "poster_path": "/81Uq4CEUPRpbLrSPOREpQJFdFFr.jpg",
      "release_date": "2023-06-15",
      "title": "O Encontro de Carl",
      "video": false,
      "vote_average": 7.9,
      "vote_count": 152
    },
    {
      "adult": false,
      "backdrop_path": "/2vFuG6bWGyQUzYS9d69E5l85nIz.jpg",
      "genre_ids": [28, 12, 878],
      "id": 667538,
      "original_language": "en",
      "original_title": "Transformers: Rise of the Beasts",
      "overview":
          "Nesta aventura cheia de adrenalina, Optimus Prime e os Autobots enfrentam seu maior desafio até agora. Quando uma nova ameaça capaz de destruir todo o planeta surge, eles devem se unir a uma poderosa facção conhecida como os Maximals. Com o destino da humanidade em jogo, Noah (Anthony Ramos) e Elena (Dominique Fishback) farão o que for preciso para ajudar os Transformers na batalha final para salvar a Terra.",
      "popularity": 918.526,
      "poster_path": "/zEqwfO5R2LrrLgV61xm8M9TmNTG.jpg",
      "release_date": "2023-06-06",
      "title": "Transformers: O Despertar das Feras",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 3217
    },
    {
      "adult": false,
      "backdrop_path": "/4HodYYKEIsGOdinkGi2Ucz6X9i0.jpg",
      "genre_ids": [16, 28, 12],
      "id": 569094,
      "original_language": "en",
      "original_title": "Spider-Man: Across the Spider-Verse",
      "overview":
          "Miles Morales retorna para o próximo capítulo da saga do Aranhaverso, uma aventura épica que transportará o Homem-Aranha em tempo integral e amigável do bairro do Brooklyn através do Multiverso para unir forças com Gwen Stacy e uma nova equipe de Homens-Aranha para enfrentar com um vilão mais poderoso do que qualquer coisa que eles já encontraram.",
      "popularity": 836.618,
      "poster_path": "/4CwKj1fw33BXYzxvrpM3GlAhK4L.jpg",
      "release_date": "2023-05-31",
      "title": "Homem-Aranha: Através do Aranhaverso",
      "video": false,
      "vote_average": 8.5,
      "vote_count": 4309
    },
    {
      "adult": false,
      "backdrop_path": "/yF1eOkaYvwiORauRCPWznV9xVvi.jpg",
      "genre_ids": [28, 12, 878],
      "id": 298618,
      "original_language": "en",
      "original_title": "The Flash",
      "overview":
          "Os mundos colidem quando Barry Allen usa seus superpoderes para viajar no tempo e mudar os acontecimentos do passado. Mas a tentativa de salvar sua família altera inadvertidamente o futuro.",
      "popularity": 785.846,
      "poster_path": "/vjEZrx9vSP40NKXhNxAGxvHxL9y.jpg",
      "release_date": "2023-06-13",
      "title": "The Flash",
      "video": false,
      "vote_average": 6.9,
      "vote_count": 2903
    },
    {
      "adult": false,
      "backdrop_path": "/jkKVLzLWjSvTnc84VzeljhSy6j8.jpg",
      "genre_ids": [10749, 18],
      "id": 820525,
      "original_language": "en",
      "original_title": "After Everything",
      "overview":
          "Hardin não para de pensar na sua relação conturbada com Tessa. Vítima de um bloqueio criativo, o jovem escritor resolve fazer as malas e partir para Lisboa, capital portuguesa, onde espera reencontrar a sua inspiração.",
      "popularity": 665.202,
      "poster_path": "/tRjzdNiFHda6lrXySOQPyY3OtCA.jpg",
      "release_date": "2023-09-13",
      "title": "After: Para Sempre",
      "video": false,
      "vote_average": 6.3,
      "vote_count": 40
    },
    {
      "adult": false,
      "backdrop_path": "/7I6VUdPj6tQECNHdviJkUHD2u89.jpg",
      "genre_ids": [28, 53, 80],
      "id": 603692,
      "original_language": "en",
      "original_title": "John Wick: Chapter 4",
      "overview":
          "Com o preço por sua cabeça cada vez maior, John Wick leva sua luta contra a alta mesa global enquanto procura os jogadores mais poderosos do submundo, de Nova York a Paris, de Osaka a Berlim.",
      "popularity": 713.641,
      "poster_path": "/rXTqhpkpj6E0YilQ49PK1SSqLhm.jpg",
      "release_date": "2023-03-22",
      "title": "John Wick 4: Baba Yaga",
      "video": false,
      "vote_average": 7.8,
      "vote_count": 4579
    },
    {
      "adult": false,
      "backdrop_path": "/4wVFtesa5YEWuAUHRcxoCN1Y1uN.jpg",
      "genre_ids": [28, 53],
      "id": 1085218,
      "original_language": "da",
      "original_title": "Underverden 2",
      "overview": "",
      "popularity": 575.118,
      "poster_path": "/A8EPXv3SV9qiNCIttIM4ezJRmhW.jpg",
      "release_date": "2023-04-13",
      "title": "Underverden 2",
      "video": false,
      "vote_average": 6.6,
      "vote_count": 102
    },
    {
      "adult": false,
      "backdrop_path": "/AeR5k8Sp3zc2Ql4tT6CmgqspsEq.jpg",
      "genre_ids": [12, 10751, 14, 10749],
      "id": 447277,
      "original_language": "en",
      "original_title": "The Little Mermaid",
      "overview":
          "Ariel é uma curiosa sereia que deseja experimentar a vida em terra firme e, contra a vontade de seu pai, visita a superfície. Ariel se vê em uma inesperada jornada de autodescoberta ao encontrar um príncipe, uma bruxa do mar e um novo mundo incrível.",
      "popularity": 604.363,
      "poster_path": "/yeo0MKX2cAE0Ge7qoeRCiMWvSjV.jpg",
      "release_date": "2023-05-18",
      "title": "A Pequena Sereia",
      "video": false,
      "vote_average": 6.5,
      "vote_count": 2098
    }
  ],
  "total_pages": 40208,
  "total_results": 804147
};
