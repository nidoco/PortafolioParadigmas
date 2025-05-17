sing_a_song(ana).
listens_to_music(rodirgo).

listens_to_music(ana) :- sing_a_song(ana).
happy(ana) :- sing_a_song(ana).
happy(rodrigo) :- listens_to_music(rodrigo).
plays_guitar(rodirgo) :- listens_to_music(rodrigo).