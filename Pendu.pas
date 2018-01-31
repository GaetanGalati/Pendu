

{algorithme Le Jeu Du Pendu
//BUT: Faire un jeu de pendu
//ENTRER: le mot a trouver / une lettre
//SORTIE: Victoire ou defaite


Fonction lettreVerif(Car: CARACTERE; ch : CHAINE):BOOLEEN
	VAR

		test : BOOLEEN
		i : ENTIER

	DEBUT

		test <- FAUX
		i <- 1

		TANTQUE (test = FAUX) ET (i <= LONGEUR(ch)
			SI ch[i] = Car ALORS // Si la lettre a la position i de ch = la lettre rentrez pas l'utilisateur test = vrais
				test <- VRAI
			FINSI
			i <-(i+1)
		FINTANTQUE
	FINFONCTION




Fonction lettreAfect(Car2 : CARACTERE; mot1 : CHAINE) : CHAINE //Fonction pour affecter la lettre a la chaine "_ _ _ _"

VAR
	
	mot_ : CHAINE
	i : ENTIER

DEBUT

	mot_ = mot1

	POUR i DE 1 A LONGEUR(mot1) FAIRE
	DEBUT
		SI Car2 = mot[i] ALORS //Si le caractere = la caractere a la position i du mot...
			mot_[i] <- Car2 //Afféctation de la lettre
		FIN
	FIN
FINPROCEDURE



VAR

	Motrouve,MotCache : CHAINE //Le mot a trouver et la suite de "_ _ _"
	Lettre : CARACTERE //La lettre entrer par l'op
	i,pendu,cpt : ENTIER //La vie du joueur, et le cpt qui sert a déterminer la victoire

DEBUT

	i <- 0
	pendu <- 6
	MotCache <- ""
	Motrouve <- ""
	Lettre <- ""


	ECRIRE "Entrez le mot a trouver"
	Lire Motrouve
	POUR i DE 1 A LONGUEUR(motrouve) FAIRE //se qui donnera une suite de "_ _ _ _"
		MotCache[i] <- "_ "
	FINPOUR

	TANTQUE pendu > 0 OU cpt < LONGUEUR(motrouve) FAIRE
		ECRIRE "Entrez une lettre"
		LIRE lettre
		SI lettreVerif(Lettre, motrouve) = VRAI ALORS
			Motrouve <- lettreAfect(Lettre, motrouve)
			cpt <- cpt + 1
		SINON
			pendu <- pendu -1
		FINSI
			
		CAS (pendu) PARMIS

			CAS 6:		ECRIRE "        "
						ECRIRE "|       "
						ECRIRE "|       "
						ECRIRE "|       "
						ECRIRE "|       "
						ECRIRE "|_______"


			CAS 5:		ECRIRE " _____  "
						ECRIRE "|/      "
						ECRIRE "|       "
						ECRIRE "|       "
						ECRIRE "|       "
						ECRIRE "|_______"

			CAS 4:		ECRIRE " _____  "
						ECRIRE "|/   |  "
						ECRIRE "|       "
						ECRIRE "|       "
						ECRIRE "|       "
						ECRIRE "|_______"

			CAS 3:		ECRIRE " _____  "
						ECRIRE "|/   |  "
						ECRIRE "|    O  "
						ECRIRE "|       "
						ECRIRE "|       "
						ECRIRE "|_______"

			CAS 2:		ECRIRE " _____  "
						ECRIRE "|/   |  "
						ECRIRE "|    O  "
						ECRIRE "|    |  "
						ECRIRE "|       "
						ECRIRE "|_______"

			CAS 1:		ECRIRE " _____  "
						ECRIRE "|/   |  "
						ECRIRE "|    O  "
						ECRIRE "|   /|\ "
						ECRIRE "|       "
						ECRIRE "|_______"

			CAS 0:		ECRIRE " _____  "
						ECRIRE "|/   |  "
						ECRIRE "|    X  "
						ECRIRE "|   /|\ "
						ECRIRE "|   / \ "
						ECRIRE "|_______"
						ECRIRE "GAME OVER"
		FINCASPARMIS
	FINTANTQUE

	SI cpt >= LONGUEUR(motrouve) ALORS
		ECRIRE ("Vous avez gagnez ! Le mot était bien ",motrouve)
	FINSI

	SI pendu <= 0 ALORS
		ECRIRE ("Vous avez perdu ! Le mot a trouver était",motrouve)
	FINSI

FIN}

PROGRAM Jeu_du_pendu;

uses crt;




Function lettreVerif(Car : char; ch : string) : boolean ;
	VAR

		test : boolean;
		i : integer;

	BEGIN

		test := false;
		i := 1;

		 while (i <= length(ch)) and (test = false) DO

			begin
				if ch[i] = Car then
				begin // Si la lettre a la position i de ch = la lettre rentrez pas l'utilisateur test = vrais
					test := true;
					//writeln('Test = true');//DEBUG
				end;
				i := (i+1);
				//writeln('i := i +1');//DEBUG
			end;
		lettreVerif := test;
	END;

Function lettreAfect(Car2 : char; mot1,mot2 : string) : string; //Fonction pour affecter la lettre a la chaine "_ _ _ _"

VAR
	
	mot_ : string;
	i : integer;

BEGIN

	mot_ := mot2;

	for i := 1 to length(mot1) DO
	begin
		if Car2 = mot1[i] then //Si le caractere = le caractere a la position i du mot...
		begin 	
			mot_[i] := Car2;//Afféctation de la lettre
			writeln(mot_);//DEBUG
		end
	end;

	lettreAfect := (mot_);

END;

//-----PROGRAM PRICIPAL------

VAR

	Motrouve,MotCache : string; //Le mot a trouver et la suite de "_ _ _"
	Lettre : char; //La lettre entrer par l'op
	i,pendu{,cpt} : integer; //La vie du joueur, et le cpt qui sert a déterminer la victoire

BEGIN
	clrscr;

	i := 0;
	pendu := 6;
	MotCache := (' ');
	Motrouve := (' ');
	Lettre := (' ');

	TextColor (yellow);
	writeln ('                                        |Le Jeu Du Pendu|                                       ');
	writeln ('                                |Appuiez sur entrer pour jouer|                                 ');
	readln();
	clrscr;
	TextColor (white);

	writeln ('Entrez le mot a trouver');
	readln (Motrouve);
	ClrScr;
	MotCache := (motrouve);

	readln();
	for i := 1 to length(MotCache) DO
		begin //se qui donnera une suite de "----"

			MotCache[i] := ('-');

		end;
	writeln(MotCache);
	readln();


	while (pendu > 0) and {(cpt < length(motrouve))} (motCache <> motrouve) do
		begin
			writeln ('Entrez une lettre');
			readln (lettre);
			InsLine;
		

			if lettreVerif(Lettre, motrouve) then
				begin
					MotCache := lettreAfect(Lettre, motrouve,motCache);
					{cpt := cpt + 1;}
					//writeln(MotCache);//DEBUG
				end
			ELSE
				begin
					pendu := pendu -1;
				end;


		case pendu of

		 6:	begin
		 		writeln ('        ');
				writeln ('|       ');
				writeln ('|       ');
				writeln ('|       ');
				writeln ('|       ');
				writeln ('|_______');
			end;

		 5: begin	
		 		writeln (' _____  ');
				writeln ('|/      ');
				writeln ('|       ');
				writeln ('|       ');
				writeln ('|       ');
				writeln ('|_______');
			end;

		 4:	begin
		 		writeln (' _____  ');
				writeln ('|/   |  ');
				writeln ('|       ');
				writeln ('|       ');
				writeln ('|       ');
				writeln ('|_______');
			end;

		3:	begin	
				writeln (' _____  ');
				writeln ('|/   |  ');
				writeln ('|    O  ');
				writeln ('|       ');
				writeln ('|       ');
				writeln ('|_______');
			end;

		 2:	begin	
		 		writeln (' _____  ');
				writeln ('|/   |  ');
				writeln ('|    O  ');
				writeln ('|    |  ');
				writeln ('|       ');
				writeln ('|_______');
			end;

		 1:	begin	
		 		writeln (' _____  ');
				writeln ('|/   |  ');
				writeln ('|    O  ');
				writeln ('|   /|\ ');
				writeln ('|       ');
				writeln ('|_______');
			end;

		 0:	begin
				TextColor (red);	
		 		writeln (' _____  ');
				writeln ('|/   |  ');
				writeln ('|    X  ');
				writeln ('|   /|\ ');
				writeln ('|   / \ ');
				writeln ('|_______');
				writeln ('GAME OVER');
			end;
		end;

	END;

	{IF cpt >= length(motrouve)} if motCache = motrouve then
		begin

			TextColor (green);
			writeln ('Vous avez gagnez ! Le mot etait bien: ',motrouve);
		end;

	IF pendu <= 0 then
		begin
			writeln ('Vous avez perdu ! Le mot a trouver etait: ',motrouve);
		end;
readln();
END.


