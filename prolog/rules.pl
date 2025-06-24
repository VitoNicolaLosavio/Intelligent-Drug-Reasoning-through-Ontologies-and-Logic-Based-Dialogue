% Trattamento standard
standard_treatment(Drug, Disease) :-
    treats(Drug, Disease, true).

%  Farmaci non standard
non_standard_treatment(Drug, Disease) :-
    \+ standard_treatment(Drug, Disease).


% Verifica se una malattia ha trattamenti disponibili
has_treatment(Disease) :-
    standard_treatment(_, Disease).

% Un farmaco è controindicato per un paziente
contraindicated_for_person(Person, Drug) :-
    has_disease(Person, Disease, _, _),
    contraindicated_for(Drug, Disease, _, _).

% Un farmaco è sicuro per una persona
safe_for(Person, Drug) :-
    \+ contraindicated_for_person(Person, Drug).

get_all_non_standard_treatment(Person, Drug, Disease) :-
    has_disease(Person, Disease, _, _),
    prescribed_to(Drug, Person, _, _, _, _),
    \+ standard_treatment(Drug, Disease).

% Restituisce l'ID del farmaco, il nome e la persona a cui è prescritto
prescribed_drug_info(Person, Drug, Name) :-
    prescribed_to(Drug, Person, _, _, _, _),
    drug_data(Drug, Name, _, _, _, _, _).