disease(diabete_tipo_2).
disease(diabete_tipo_1).
disease(odontalgia).
disease(osteoartrite).
disease(artrite_reumatoide).
disease(spondilite_anchilosante).
disease(dismenorrea).
disease(tendinite).
disease(tenosinovite).
disease(distorsione).
disease(contusione).
disease(lombalgia).
disease(torcicollo).
disease(borsite).
disease(stiramento).
disease(periartrite).
disease(post_trauma).
disease(sciatalgia).
disease(mialgia).
disease(dislocazione).
disease(herpes_simplex).
disease(herpes_zoster).
disease(varicella).
disease(herpes_labiale).
disease(herpes_genitale).
disease(herpes_simplex_recidivante).
disease(herpes_simplex_profilassi).
disease(herpes_neonatale).
disease(encefalite_herpetica).
disease(cheratite_herpetica).
disease(prevenzione_infarto).
disease(prevenzione_ictus).
disease(angina_stabile).
disease(angina_instabile).
disease(prevenzione_post_cabg).
disease(prevenzione_post_angioplastica).
disease(prevenzione_post_ptca).
disease(malattia_ateromasica_conclamata).
disease(prevenzione_eventi_cv_rischio_elevato).
disease(prevenzione_riocclusione_bypass).
disease(prevenzione_eventi_cv_dialisi).
disease(prevenzione_trombosi_extracorporea).
disease(osteoporosi_postmenopausale).
disease(osteoporosi_indotta_da_glucocorticoidi).
disease(osteoporosi_maschile).
disease(anomalie_esofagee).
disease(ipocalcemia).
disease(incapacità_stare_eri).
disease(ipersensibilità_alendronato).
disease(gastrite_attiva).
disease(ulcera_peptica).
disease(esofagite).
disease(esofago_di_barrett).
disease(malassorbimento).
disease(ipoparatiroidismo).
disease(deficit_vitamina_d).
disease(insufficienza_renale_grave).
disease(incapacita_ergersi).
disease(osteonecrosi_mascella).
disease(ulcere_peptiche_recenti).
disease(disfagia).
disease(ipersensibilita_alendronato).
disease(dislipidemia).
disease(stenosi_esofagea).
disease(acalasia_esofagea).
disease(osteonecrosi_mandibola).
disease(osteonecrosi_condotto_uditivo_esterno).
disease(neoplasia).
disease(gastrite).
disease(duodenite).
disease(emorragia_gastrointestinale).
disease(carenza_vitamina_d).
disease(malassorbimento_calcio).
disease(gravidanza).
disease(allattamento).
disease(insufficienza_renale_severa).
disease(frattura_femore).
disease(ipersensibilita_acido_acetilsalicilico).
disease(mastocitosi).
disease(asma_indotta_da_fans).
disease(ulcera_gastroduodenale).
disease(diatesi_emorragica).
disease(insufficienza_epatica_grave).
disease(insufficienza_cardiaca_grave).
disease(trattamento_metotrexato_alto_dosaggio).
disease(terzo_trimestre_gravidanza).
disease(ipersensibilita_fans).
disease(sanguinamento_gastrointestinale).
disease(coagulopatia).
disease(ipersensibilita_valaciclovir).
disease(compromissione_renale).
disease(ipersensibilita_aciclovir).
disease(cardiopatia_ischemica).
disease(ipersensibilita_aceclofenac).
disease(vasculopatia_periferica).
disease(vasculopatia_cerebrale).
disease(insufficienza_cardiaca_congestizia).
disease(ulcera_peptica_attiva).
disease(stati_patologici_gas_intestinale).
disease(gastroresezione).
disease(ipersensibilita_acarbosio).
disease(enteropatie_croniche).
disease(compromissione_epatica_grave).
disease(malattia_infiammatoria_intestinale).
disease(ulcera_colon).
disease(ostruzione_parziale_intestinale).

disease_data(
    ostruzione_parziale_intestinale,
    'Ostruzione intestinale parziale',
    'Condizione in cui il contenuto intestinale non riesce a progredire normalmente a causa di un restringimento o blocco parziale del lume intestinale.',
    'Gonfiore, dolore addominale, nausea, vomito, stipsi, rumori addominali aumentati',
    'Aderenze post-chirurgiche, ernie, tumori, malattia di Crohn, volvolo',
    gastrointestinal,
    true,
    false,
    false
).

disease_data(
    ulcera_colon,
    'Ulcera del colon',
    'Lesione della mucosa del colon caratterizzata da infiammazione e necrosi, spesso associata a malattie infiammatorie croniche intestinali.',
    'Dolore addominale, diarrea con sangue, febbre, perdita di peso',
    'Colite ulcerosa, ischemia intestinale, infezioni batteriche o da farmaci',
    gastrointestinal,
    true,
    false,
    false
).

disease_data(
    malattia_infiammatoria_intestinale,
    'Malattia infiammatoria intestinale (IBD)',
    'Gruppo di patologie croniche caratterizzate da infiammazione della mucosa intestinale, comprendente il morbo di Crohn e la colite ulcerosa.',
    'Diarrea persistente, dolori addominali, sangue nelle feci, perdita di peso',
    'Eziologia multifattoriale: immunitaria, genetica e ambientale',
    gastrointestinal,
    true,
    false,
    false
).

disease_data(
    compromissione_epatica_grave,
    'Grave compromissione epatica',
    'Condizione patologica in cui il fegato perde in modo marcato la capacità di svolgere le sue funzioni metaboliche, sintetiche e detossificanti.',
    'Ittero, ascite, encefalopatia epatica, emorragie, alterazioni coagulazione',
    'Cirrosi, epatiti virali gravi, abuso cronico di alcol, epatotossicità da farmaci',
    gastrointestinal,
    true,
    false,
    false
).

disease_data(
    ipersensibilita_acarbosio,
    'Ipersensibilità ad acarbosio',
    'Reazione allergica al principio attivo acarbosio o a uno degli eccipienti del farmaco.',
    'Orticaria, rash, prurito, difficoltà respiratorie',
    'Reazione immunitaria a farmaci contenenti acarbosio',
    allergic,
    false,
    false,
    false
).

disease_data(
    enteropatie_croniche,
    'Enteropatie croniche',
    'Malattie infiammatorie croniche dell’intestino, come morbo di Crohn e colite ulcerosa.',
    'Dolori addominali, diarrea cronica, sanguinamento, perdita di peso',
    'Eziologia autoimmune e genetica',
    gastrointestinal,
    true,
    false,
    false
).

disease_data(
    stati_patologici_gas_intestinale,
    'Stati patologici del tratto gastrointestinale',
    'Condizioni caratterizzate da accumulo eccessivo di gas intestinale e distensione addominale (es. sindrome di Roemheld, ernie di grandi dimensioni).',
    'Distensione addominale, dolore, reflusso, dispnea',
    'Eccessiva fermentazione intestinale, ernie, dismotilità',
    gastrointestinal,
    true,
    false,
    false
).

disease_data(
    gastroresezione,
    'Gastroresezione',
    'Condizione del paziente a seguito di intervento chirurgico di resezione parziale o totale dello stomaco.',
    'Malassorbimento, nausea, reflusso, perdita di peso',
    'Asportazione chirurgica per tumore, ulcera o altra patologia gastrica',
    gastrointestinal,
    true,
    false,
    false
).

disease_data(
    ulcera_peptica_attiva,
    'Ulcera peptica attiva',
    'Lesione ulcerativa a carico della mucosa gastrica o duodenale in fase attiva, causata da un’eccessiva secrezione acida o infezione da H. pylori.',
    'Dolore epigastrico, nausea, vomito, sanguinamento gastrointestinale, anemia',
    'Helicobacter pylori, FANS, stress, fumo, alcol',
    gastrointestinal,
    true,
    false,
    false
).

disease_data(
    insufficienza_cardiaca_congestizia,
    'Insufficienza cardiaca congestizia',
    'Condizione in cui il cuore non riesce a pompare sangue in modo efficace, causando accumulo di liquidi nei polmoni e nei tessuti periferici.',
    'Affaticamento, difficoltà respiratoria, edemi periferici, aumento di peso rapido',
    'Danni al miocardio, ipertensione, infarto, malattie valvolari',
    cardiovascular,
    true,
    false,
    false
).

disease_data(
    cardiopatia_ischemica,
    'Cardiopatia ischemica',
    'Condizione in cui il muscolo cardiaco riceve meno sangue e ossigeno a causa di restringimento delle arterie coronarie.',
    'Dolore toracico (angina), affaticamento, mancanza di respiro',
    'Aterosclerosi delle arterie coronarie',
    cardiovascular,
    true,
    false,
    false
).

disease_data(
    ipersensibilita_aceclofenac,
    'Ipersensibilità ad aceclofenac',
    'Reazione allergica al farmaco aceclofenac, tipicamente crociata con altri FANS.',
    'Orticaria, rash, broncospasmo, shock anafilattico',
    'Risposta immunitaria verso aceclofenac o sostanze correlate',
    allergic,
    false,
    false,
    false
).

disease_data(
    vasculopatia_periferica,
    'Vasculopatia periferica',
    'Patologia dei vasi sanguigni periferici, tipicamente agli arti inferiori.',
    'Claudicatio intermittente, dolore, freddo agli arti',
    'Aterosclerosi periferica',
    cardiovascular,
    true,
    false,
    false
).

disease_data(
    vasculopatia_cerebrale,
    'Vasculopatia cerebrale',
    'Disturbo della circolazione sanguigna nel cervello.',
    'Capogiri, confusione, ictus, deficit neurologici',
    'Aterosclerosi dei vasi cerebrali o embolia',
    neurological,
    true,
    false,
    false
).


disease_data(
    ipersensibilita_aciclovir,
    'Ipersensibilità ad aciclovir',
    'Reazione allergica al farmaco antivirale aciclovir',
    'Orticaria, rash cutanei, broncospasmo, anafilassi',
    'Reazione immunomediata o pseudoallergica al principio attivo',
    allergic,
    false,
    false,
    false
).

disease_data(
    ipersensibilita_valaciclovir,
    'Ipersensibilità al valaciclovir',
    'Reazione allergica al farmaco antivirale valaciclovir',
    'Rash, orticaria, anafilassi, broncospasmo',
    'Reazione immunomediata a farmaco antivirale di tipo nucleosidico',
    allergic,
    false,
    false,
    false
).

disease_data(
    compromissione_renale,
    'Compromissione renale',
    'Funzione renale ridotta o alterata',
    'Aumento creatinina, oliguria, affaticamento',
    'Diabete, ipertensione, nefriti, farmaci nefrotossici',
    urological,
    true,
    false,
    false
).


disease_data(
    ipersensibilita_fans,
    "Ipersensibilità ai FANS", 
    "Reazione allergica o pseudoallergica ai farmaci antinfiammatori non steroidei", 
    "Orticaria, broncospasmo, rash cutanei, edema", 
    "Meccanismo immunitario o inibizione COX con rilascio di leucotrieni", 
    allergic,
    false,
    false,
    false
).

disease_data(
    sanguinamento_gastrointestinale,
    "Sanguinamento gastrointestinale", 
    "Perdita di sangue nello stomaco, esofago o intestino", 
    "Melena, ematemesi, anemia, dolore addominale", 
    "Ulcere, gastrite, FANS, varici esofagee", 
    gastrointestinal,
    false,
    false,
    false
).

disease_data(
    coagulopatia,
    "Coagulopatia", 
    "Disturbo della coagulazione del sangue", 
    "Epistassi, ecchimosi, emorragie prolungate", 
    "Deficit fattori coagulazione, epatopatie, anticoagulanti", 
    hematologic,
    true,
    false,
    false
).


disease_data(
    ipersensibilita_acido_acetilsalicilico,
    "Ipersensibilità all'acido acetilsalicilico",
    "Reazione allergica o intolleranza ai salicilati",
    "Orticaria, broncospasmo, anafilassi",
    "Reazione immunitaria o pseudoallergica",
    allergic,
    false,
    false,
    false
).

disease_data(
    mastocitosi,
    "Mastocitosi",
    "Accumulo anomalo di mastociti nei tessuti",
    "Prurito, vampate, ipotensione, shock",
    "Mutazioni genetiche (es. c-KIT)",
    hematologic,
    true,
    true,
    false
).

disease_data(
    asma_indotta_da_fans,
    "Asma indotta da FANS",
    "Forma di asma scatenata da antinfiammatori non steroidei",
    "Broncospasmo, respiro sibilante, tosse",
    "Inibizione della via della cicloossigenasi",
    respiratory,
    true,
    false,
    false
).

disease_data(
    ulcera_gastroduodenale,
    "Ulcera gastroduodenale",
    "Lesione della mucosa gastrica o duodenale",
    "Dolore epigastrico, nausea, emorragia",
    "Infezione da H. pylori, FANS, stress",
    gastrointestinal,
    false,
    false,
    false
).

disease_data(
    diatesi_emorragica,
    "Diatesi emorragica",
    "Tendenza patologica al sanguinamento",
    "Ecchimosi, epistassi, sanguinamenti gengivali",
    "Deficit coagulativi, piastrinici o vascolari",
    hematologic,
    true,
    false,
    false
).


disease_data(
    insufficienza_epatica_grave,
    "Insufficienza epatica grave",
    "Compromissione della funzionalità epatica",
    "Ittero, ascite, encefalopatia",
    "Cirrrosi, epatiti, tossicità farmaci",
    gastrointestinal,
    true,
    false,
    false
).

disease_data(
    insufficienza_cardiaca_grave,
    "Insufficienza cardiaca grave",
    "Ridotta capacità del cuore di pompare sangue",
    "Dispnea, edema, affaticamento",
    "Cardiopatia ischemica, ipertensione, valvulopatie",
    cardiovascular,
    true,
    false,
    false
).

disease_data(
    trattamento_metotrexato_alto_dosaggio,
    "Trattamento con metotrexato ad alto dosaggio",
    "Uso farmacologico di metotrexato ≥15 mg/settimana",
    "Mielosoppressione, epatotossicità, immunosoppressione",
    "Terapia per tumori o patologie autoimmuni",
    endocrine,
    false,
    false,
    false
).

disease_data(
    terzo_trimestre_gravidanza,
    "Terzo trimestre di gravidanza",
    "Ultima fase della gestazione (settimane 28-40)",
    "Contrazioni, movimenti fetali, ritenzione idrica",
    "Stadio avanzato della gravidanza",
    reproductive,
    false,
    false,
    true
).

disease_data(
    insufficienza_renale_severa,
    "Insufficienza renale severa",
    "Condizione in cui i reni non riescono a filtrare adeguatamente i prodotti di scarto",
    "Edema, ipertensione, stanchezza, alterazioni elettrolitiche",
    "Patologie croniche renali, diabete, ipertensione",
    urological,
    true,
    false,
    false
).

disease_data(
    frattura_femore,
    "Frattura del femore",
    "Rottura dell’osso del femore, comune soprattutto negli anziani",
    "Dolore acuto, incapacità di deambulare, deformità della gamba",
    "Trauma diretto, cadute, osteoporosi",
    musculoskeletal,
    false,
    false,
    false
).


disease_data(
    gravidanza,
    "Gravidanza",
    "Condizione fisiologica della gestazione",
    "Amenorrea, nausea, cambiamenti ormonali e corporei",
    "Fecondazione dell’ovulo da parte dello spermatozoo",
    reproductive,
    false,
    false,
    false
).

disease_data(
    allattamento,
    "Allattamento",
    "Fase successiva al parto in cui avviene la nutrizione del neonato tramite latte materno",
    "Produzione di latte, aumento del fabbisogno nutrizionale",
    "Condizione fisiologica post-parto",
    reproductive,
    false,
    false,
    false
).

disease_data(
    gastrite,
    "Gastrite",
    "Infiammazione della mucosa dello stomaco",
    "Dolore epigastrico, nausea, vomito, digestione lenta",
    "Infezione da Helicobacter pylori, FANS, stress, alcol",
    gastrointestinal,
    false,
    false,
    false
).

disease_data(
    duodenite,
    "Duodenite",
    "Infiammazione della mucosa del duodeno",
    "Dolore addominale, nausea, senso di pienezza",
    "Infezione da Helicobacter pylori, farmaci gastrolesivi",
    gastrointestinal,
    false,
    false,
    false
).

disease_data(
    emorragia_gastrointestinale,
    "Emorragia gastrointestinale",
    "Perdita di sangue nel tratto digerente",
    "Melena, ematemesi, anemia, debolezza",
    "Ulcere, tumori, varici esofagee, farmaci FANS",
    gastrointestinal,
    true,
    false,
    false
).

disease_data(
    carenza_vitamina_d,
    "Carenza di vitamina D",
    "Livelli insufficienti di vitamina D nel sangue",
    "Osteomalacia, affaticamento, debolezza muscolare",
    "Dieta inadeguata, scarsa esposizione solare, malassorbimento",
    endocrine,
    false,
    false,
    false
).

disease_data(
    malassorbimento_calcio,
    "Malassorbimento del calcio",
    "Difficoltà nell’assorbimento intestinale del calcio",
    "Ipocalcemia, osteopenia, crampi muscolari",
    "Malattie intestinali, deficit di vitamina D, interventi chirurgici",
    gastrointestinal,
    true,
    true,
    false
).

disease_data(
    dislipidemia,
    "Dislipidemia",
    "Alterazione dei livelli di lipidi nel sangue (colesterolo, trigliceridi)",
    "Ipercolesterolemia, ipertrigliceridemia, nessun sintomo specifico",
    "Fattori genetici, dieta, stile di vita",
    metabolic,
    true,
    false,
    false
).

disease_data(
    stenosi_esofagea,
    "Stenosi esofagea",
    "Restringimento patologico del lume esofageo",
    "Difficoltà a deglutire, rigurgito, perdita di peso",
    "Infiammazione cronica, reflusso gastroesofageo, traumi, tumori",
    gastrointestinal,
    true,
    false,
    false
).

disease_data(
    acalasia_esofagea,
    "Acalasia esofagea",
    "Disturbo della motilità esofagea causato da mancato rilasciamento dello sfintere inferiore",
    "Disfagia, rigurgito, dolore toracico, perdita di peso",
    "Degenerazione neuronale del plesso mioenterico",
    gastrointestinal,
    true,
    true,
    false
).

disease_data(
    osteonecrosi_mandibola,
    "Osteonecrosi della mandibola",
    "Morte del tessuto osseo della mandibola, spesso indotta da bifosfonati o trattamenti oncologici",
    "Dolore, esposizione ossea, infezione orale",
    "Trattamento con bifosfonati, chemioterapia, trauma dentale",
    musculoskeletal,
    false,
    true,
    false
).

disease_data(
    osteonecrosi_condotto_uditivo_esterno,
    "Osteonecrosi del condotto uditivo esterno",
    "Rara necrosi dell’osso nel condotto uditivo esterno",
    "Otalgia, secrezioni, esposizione ossea",
    "Uso cronico di bifosfonati, infezioni",
    otolaryngologic,
    false,
    true,
    false
).

disease_data(
    neoplasia,
    "Neoplasia",
    "Proliferazione cellulare anomala, benigna o maligna",
    "Massa palpabile, emorragie, sintomi sistemici variabili",
    "Mutazioni genetiche, esposizione a carcinogeni, predisposizione ereditaria",
    neoplastic,
    true,
    false,
    false
).

disease_data(
    incapacita_ergersi,
    "Incapacità a mantenere il busto eretto",
    "Condizione che impedisce al paziente di stare seduto o in piedi per almeno 30 minuti",
    "Debolezza muscolare, instabilità, deficit neurologici",
    "Malattie neurologiche, ortopediche o post-operatorie",
    musculoskeletal,
    true,
    false,
    false
).

disease_data(
    osteonecrosi_mascella,
    "Osteonecrosi della mandibola o mascella",
    "Morte del tessuto osseo nella mascella, spesso dopo estrazione dentale",
    "Dolore, esposizione ossea, infezioni orali",
    "Trattamenti con bifosfonati, scarsa igiene orale, traumi dentali",
    musculoskeletal,
    false,
    true,
    false
).

disease_data(
    ulcere_peptiche_recenti,
    "Ulcere peptiche recenti",
    "Presenza o storia recente di ulcera gastrica o duodenale",
    "Dolore addominale, ematemesi, melena",
    "Helicobacter pylori, FANS, stress cronico",
    gastrointestinal,
    true,
    false,
    false
).

disease_data(
    disfagia,
    "Disfagia",
    "Difficoltà nella deglutizione",
    "Sensazione di cibo bloccato, tosse durante i pasti, perdita di peso",
    "Disturbi neurologici, neoplasie, infiammazioni",
    gastrointestinal,
    false,
    false,
    false
).

disease_data(
    ipersensibilita_alendronato,
    "Ipersensibilità alendronato",
    "Reazione allergica al principio attivo o eccipienti",
    "Orticaria, prurito, dispnea, shock anafilattico",
    "Reazione immunomediata al farmaco o ai suoi componenti",
    dermatological,
    false,
    true,
    false
).

disease_data(
    anomalie_esofagee,
    "Anomalie esofagee",
    "Condizioni che ostacolano lo svuotamento esofageo",
    "Difficoltà a deglutire, rigurgito", "Disturbi anatomici o funzionali",
     gastrointestinal,
     false,
     false,
     false
).

disease_data(
    ipocalcemia,
    "Ipocalcemia",
    "Bassi livelli di calcio nel sangue",
    "Crampi, formicolii, spasmi muscolari",
    "Carenze vitaminiche o disfunzioni paratiroidee",
    metabolic,
    false,
    false,
    false
).

disease_data(
    incapacità_stare_eri,
    "Incapacità a stare eretti",
    "Incapacità a mantenere la posizione seduta o eretta per almeno 30 minuti",
    "Limitazione posturale",
    "Condizioni neurologiche o muscolo-scheletriche",
    musculoskeletal,
    true,
    false,
    false
).

disease_data(
    ipersensibilità_alendronato,
    "Ipersensibilità ad alendronato",
    "Reazione allergica al farmaco",
    "Orticaria, prurito, shock anafilattico",
    "Allergia al principio attivo",
    dermatological,
    false,
    false,
    false
).

disease_data(
    gastrite_attiva,
    "Gastrite attiva",
    "Infiammazione della mucosa gastrica in fase acuta",
    "Dolore epigastrico, nausea",
    "Infezioni, FANS, stress",
     gastrointestinal,
     false,
     false,
     false
).

disease_data(
    ulcera_peptica,
    "Ulcera peptica",
    "Lesione della mucosa gastrica o duodenale",
    "Dolore addominale, nausea, emorragie",
    "Helicobacter pylori, FANS",
     gastrointestinal,
     true,
     false,
     false
).

disease_data(
    esofagite,
    "Esofagite",
    "Infiammazione dell’esofago",
    "Bruciore retrosternale, disfagia",
    "Reflusso acido, infezioni",
    gastrointestinal,
    false,
    false,
    false
).

disease_data(
    esofago_di_barrett,
    "Esofago di Barrett",
    "Condizione pre-neoplastica dell’esofago",
    "Asintomatico o come il reflusso",
    "Reflusso gastroesofageo cronico",
    neoplastic,
    true,
    false,
    false
).

disease_data(
    malassorbimento,
    "Malassorbimento",
    "Ridotta capacità di assorbire nutrienti",
    "Diarrea, perdita di peso, carenze nutrizionali",
    "Celiachia, insufficienza pancreatica",
    gastrointestinal,
    true,
    false,
    false
).

disease_data(
    ipoparatiroidismo,
    "Ipoparatiroidismo",
    "Deficit di paratormone",
    "Ipocalcemia, tetania, parestesie",
    "Autoimmune o chirurgico",
    endocrine,
    true,
    true,
    false
).

disease_data(
    deficit_vitamina_d,
    "Deficit di vitamina D",
    "Livelli insufficienti di vitamina D",
    "Osteomalacia, debolezza, crampi",
    "Carenza alimentare o esposizione solare ridotta",
    endocrine,
    false,
    false,
    false
).

disease_data(
    insufficienza_renale_grave,
    "Insufficienza renale grave",
    "Grave compromissione della funzione renale (VFG < 35 ml/min)",
    "Astenia, ritenzione idrica, ipertensione",
    "Diabete, ipertensione, glomerulonefriti",
    urological,
    true,
    false,
    false
).

disease_data(
    osteoporosi_maschile,
    "Osteoporosi maschile",
    "Riduzione della massa ossea negli uomini, con aumento del rischio di fratture, spesso associata ad ipogonadismo, età o trattamenti cronici.",
    "Fratture (soprattutto anca, vertebre), dolore osseo, diminuzione statura",
    "Età, ipogonadismo, uso di corticosteroidi, malassorbimento, alcolismo cronico",
    metabolic,
    true,
    false,
    false
).

disease_data(
    osteoporosi_indotta_da_glucocorticoidi,
    "Osteoporosi indotta da glucocorticoidi",
    "Perdita di massa ossea causata da trattamento cronico con corticosteroidi sistemici (es. prednisone)",
    "Fratture, dolore osseo, riduzione della statura",
    "Uso prolungato di glucocorticoidi, età avanzata, carenza di vitamina D o calcio",
    metabolic,
    true,
    false,
    false
).

disease_data(
    osteoporosi_postmenopausale,
    "Osteoporosi postmenopausale",
    "Patologia metabolica dell’osso caratterizzata da riduzione della massa ossea e aumentato rischio di fratture, soprattutto vertebrali e dell’anca, nelle donne dopo la menopausa.",
    "Fratture (soprattutto anca e vertebre), dolore osseo, riduzione della statura, incurvamento della schiena.",
    "Deficit estrogenico post-menopausale, età avanzata, familiarità, uso di glucocorticoidi.",
    metabolic,
    true,
    false,
    false
).

disease_data(
    prevenzione_trombosi_extracorporea,
    "Prevenzione della trombosi nel circuito extracorporeo",
    "Uso di ASA per prevenire la coagulazione del sangue nei circuiti extracorporei (es. dialisi)",
    "Nessun sintomo (profilassi)",
    "Emodialisi, circolazione extracorporea, rischio trombotico aumentato",
    cardiovascular,
    true,
    false,
    false
).

disease_data(
    prevenzione_eventi_cv_dialisi,
    "Prevenzione eventi cardiovascolari in pazienti dializzati",
    "Profilassi cardiovascolare in pazienti sottoposti a emodialisi cronica",
    "Nessun sintomo (profilassi)",
    "Malattia renale cronica, dialisi extracorporea",
    cardiovascular,
    true,
    false,
    false
).

disease_data(
    prevenzione_riocclusione_bypass,
    "Prevenzione della riocclusione dei bypass",
    "Uso dell’acido acetilsalicilico per evitare trombosi dei bypass coronarici post-intervento",
    "Nessun sintomo (profilassi)",
    "Bypass aorto-coronarico, storia di coronaropatia ischemica",
    cardiovascular,
    true,
    false,
    false
).

disease_data(
    prevenzione_eventi_cv_rischio_elevato,
    "Prevenzione cardiovascolare in soggetti ad alto rischio",
    "Profilassi primaria in pazienti con rischio cardiovascolare elevato",
    "Nessun sintomo (profilassi)",
    "Fattori di rischio: ipertensione, diabete, ipercolesterolemia, fumo",
    cardiovascular,
    true,
    false,
    false
).

disease_data(
    malattia_ateromasica_conclamata,
    "Malattia ateromasica conclamata",
    "Patologia vascolare cronica causata da placche aterosclerotiche, clinicamente evidente",
    "Angina, ischemia cerebrale o periferica, infarto",
    "Aterosclerosi, dislipidemia, ipertensione, fumo, diabete",
    cardiovascular,
    true,
    false,
    false
).

disease_data(
    prevenzione_post_ptca,
    "Prevenzione trombosi dopo PTCA",
    "Profilassi della trombosi dopo angioplastica coronarica con o senza impianto di stent",
    "Nessun sintomo (profilassi)",
    "Angioplastica coronarica (PTCA), posizionamento di stent",
    cardiovascular,
    true,
    false,
    false
).


disease_data(
    prevenzione_ictus,
    "Prevenzione dell’ictus ischemico",
    "Prevenzione secondaria di attacchi ischemici transitori o CVA",
    "Nessuno (profilassi)",
    "Aterosclerosi, ipertensione, aritmie",
    neurological,
    true,
    false,
    false
).

disease_data(
    angina_stabile,
    "Angina pectoris stabile",
    "Dolore toracico da sforzo per insufficiente apporto di ossigeno al cuore",
    "Dolore toracico, senso di oppressione, affaticamento",
    "Aterosclerosi coronarica",
    cardiovascular,
    true,
    false,
    false
).

disease_data(
    prevenzione_infarto,
    "Prevenzione dell’infarto miocardico",
    "Prevenzione secondaria di eventi coronarici in pazienti a rischio",
    "Nessuno (profilassi)",
    "Storia di infarto, rischio cardiovascolare elevato",
    cardiovascular,
    true,
    false,
    false
).

disease_data(
    prevenzione_post_angioplastica,
    "Prevenzione occlusione post-angioplastica",
    "Profilassi dopo intervento coronarico percutaneo",
    "Nessuno (profilassi)",
    "Stenting, angioplastica coronarica",
    cardiovascular,
    true,
    false,
    false
).

disease_data(
    prevenzione_post_cabg,
    "Prevenzione occlusione post-CABG",
    "Profilassi dell’occlusione dei bypass dopo intervento di rivascolarizzazione",
    "Nessuno (profilassi)",
    "Posizionamento di bypass coronarici",
    cardiovascular,
    true,
    false,
    false
).

disease_data(
    angina_instabile,
    "Angina pectoris instabile",
    "Forma clinica più grave di angina, precursore dell’infarto",
    "Dolore toracico a riposo, severo e improvviso",
    "Placca coronarica instabile, trombosi parziale",
    cardiovascular,
    true,
    false,
    false
).

disease_data(
    cheratite_herpetica,
    "Cheratite erpetica",
    "Infezione della cornea da Herpes simplex virus, causa comune di cecità corneale nei paesi industrializzati",
    "Arrossamento oculare, fotofobia, dolore, lacrimazione, visione offuscata",
    "HSV-1 (raramente HSV-2), riattivazione locale del virus o trasmissione diretta",
    ophthalmologic,
    true,
    false,
    false
).

disease_data(
    encefalite_herpetica,
    "Encefalite erpetica",
    "Grave infezione del sistema nervoso centrale causata da HSV-1, con necrosi del lobo temporale",
    "Febbre, alterazione dello stato mentale, convulsioni, cefalea, deficit neurologici",
    "Riattivazione del virus HSV-1 nei gangli nervosi e diffusione cerebrale",
    neurological,
    true,
    false,
    false
).

disease_data(
    herpes_neonatale,
    "Herpes neonatale",
    "Infezione grave da HSV acquisita alla nascita o durante la gravidanza, con potenziale diffusione sistemica",
    "Letargia, febbre, irritabilità, convulsioni, lesioni cutanee o mucose, sepsi",
    "Trasmissione verticale da madre infetta con HSV-2 o HSV-1 durante il parto",
    pediatric,
    true,
    true,
    false
).

disease_data(
    herpes_simplex_profilassi,
    "Profilassi da Herpes simplex",
    "Prevenzione delle recidive di Herpes simplex, specialmente in pazienti immunodepressi o sottoposti a trapianto",
    "Assenza di sintomi se la profilassi è efficace",
    "Uso continuativo di antivirali (es. aciclovir) in soggetti ad alto rischio",
    infectious,
    true,
    false,
    false
).

disease_data(
    herpes_simplex_recidivante,
    "Herpes simplex recidivante",
    "Forma ricorrente dell’infezione da virus Herpes simplex (tipicamente HSV-1 o HSV-2) dovuta alla riattivazione del virus latente",
    "Lesioni cutanee o mucose a grappolo, bruciore, dolore localizzato, ricorrenze cicliche",
    "Riattivazione di infezione latente da HSV, stress, immunodepressione, febbre, trauma locale",
    infectious,
    true,
    false,
    false
).

disease_data(
    herpes_simplex,
    "Herpes simplex",
    "Infezione virale acuta causata da HSV-1 o HSV-2",
    "Vescicole, arrossamento, dolore localizzato",
    "Contatto diretto con lesioni, immunodepressione",
    infectious,
    false,
    false,
    false
).

disease_data(
    herpes_genitale,
    "Herpes genitale",
    "Forma di Herpes simplex localizzata nell’area genitale, causata principalmente da HSV-2",
    "Ulcere, bruciore, dolore, ricorrenze frequenti",
    "Contatto sessuale, infezione virale latente",
    infectious,
    true,
    false,
    false
).

disease_data(
    herpes_labiale,
    "Herpes labiale",
    "Infezione recidivante causata da HSV-1, colpisce le labbra e aree adiacenti",
    "Bruciore, vescicole, prurito, croste",
    "Stress, febbre, esposizione solare, immunodepressione",
    infectious,
    true,
    false,
    false
).

disease_data(
    varicella,
    "Varicella",
    "Infezione virale primaria da VZV, comune nei bambini",
    "Febbre, eruzione vescicolare pruriginosa",
    "Virus varicella-zoster (VZV)",
    infectious,
    false,
    false,
    true
).

disease_data(
    herpes_zoster,
    "Herpes Zoster (fuoco di Sant’Antonio)",
    "Riattivazione del virus della varicella in età adulta",
    "Dolore neuropatico localizzato, vescicole a distribuzione dermatomale",
    "Virus varicella-zoster latente nei gangli nervosi",
    infectious,
    false,
    false,
    false
).

disease_data(
    dislocazione,
    "Dislocazione articolare",
    "Spostamento permanente delle superfici articolari, con perdita del contatto tra i capi ossei",
    "Dolore intenso, deformità, incapacità funzionale, gonfiore",
    "Trauma diretto, cadute, urti sportivi",
    traumatic,
    false,
    false,
    false
).

disease_data(
    mialgia,
    "Mialgia",
    "Dolore muscolare localizzato o diffuso, non dovuto a lesione diretta",
    "Indolenzimento, rigidità, dolore muscolare spontaneo o al movimento",
    "Sforzo fisico, infezioni virali, stress, posture scorrette",
    musculoskeletal,
    false,
    false,
    false
).

disease_data(
    sciatalgia,
    "Sciatalgia",
    "Dolore che si irradia lungo il nervo sciatico, spesso a causa di ernia del disco o compressione lombare",
    "Dolore lombare irradiato a gluteo, gamba, piede; formicolio o debolezza",
    "Compressione del nervo sciatico, ernia del disco, artrosi vertebrale",
    musculoskeletal,
    false,
    false,
    false
).

disease_data(
    post_trauma,
    "Dolore muscolare post-traumatico",
    "Dolore muscolo-scheletrico conseguente a traumi o contusioni",
    "Dolore, gonfiore, rigidità, lividi",
    "Cadute, urti, incidenti sportivi",
    traumatic,
    false,
    false,
    false
).

disease_data(
    periartrite,
    "Periartrite",
    "Infiammazione dei tessuti periarticolari (tendini, borse, legamenti)",
    "Dolore articolare, rigidità, difficoltà nei movimenti",
    "Sovraccarico meccanico, microtraumi, invecchiamento",
    musculoskeletal,
    false,
    false,
    false
).

disease_data(
    stiramento,
    "Stiramento muscolare",
    "Lesione di fibre muscolari causata da un allungamento eccessivo",
    "Dolore acuto, crampi, rigidità, debolezza muscolare",
    "Movimento improvviso o eccessivo, riscaldamento insufficiente",
    musculoskeletal,
    false,
    false,
    false
).

disease_data(
    borsite,
    "Borsite",
    "Infiammazione della borsa sinoviale, piccola sacca che riduce l’attrito tra strutture articolari",
    "Dolore localizzato, gonfiore, calore, limitazione del movimento",
    "Traumi, movimenti ripetitivi, infezioni, artrite",
    musculoskeletal,
    false,
    false,
    false
).

disease_data(
    torcicollo,
    "Torcicollo",
    "Contrattura dolorosa dei muscoli del collo che limita i movimenti",
    "Rigidità, dolore laterale al collo, inclinazione anomala del capo",
    "Movimenti bruschi, colpi d’aria, stress muscolare",
    musculoskeletal,
    false,
    false,
    false
).


disease_data(
    lombalgia,
    "Lombalgia",
    "Dolore localizzato nella parte bassa della schiena, di origine muscolo-scheletrica",
    "Dolore lombare, rigidità, limitazione del movimento",
    "Sforzi, postura scorretta, artrosi, ernia discale",
    musculoskeletal,
    true,
    false,
    false
).


disease_data(
    contusione,
    "Contusione",
    "Lesione dei tessuti molli dovuta a un trauma diretto senza rottura della pelle",
    "Dolore, gonfiore, ecchimosi, rigidità",
    "Impatto con oggetti o cadute",
    traumatic,
    false,
    false,
    false
).


disease_data(
    distorsione,
    "Distorsione articolare",
    "Lesione traumatica di un’articolazione con stiramento o rottura parziale dei legamenti",
    "Dolore acuto, gonfiore, ematoma, instabilità",
    "Trauma diretto o torsione dell’articolazione",
    traumatic,
    false,
    false,
    false
).

disease_data(
    tenosinovite,
    "Tenosinovite",
    "Infiammazione della guaina sinoviale che avvolge un tendine",
    "Dolore, gonfiore, scricchiolio nei movimenti, limitazione funzionale",
    "Movimenti ripetitivi, infezioni, patologie reumatiche",
    musculoskeletal,
    false,
    false,
    false
).

disease_data(
    tendinite,
    "Tendinite",
    "Infiammazione di un tendine, spesso causata da sovraccarico o microtraumi ripetuti",
    "Dolore localizzato, gonfiore, rigidità, difficoltà nei movimenti articolari",
    "Sforzi ripetuti, attività sportiva, invecchiamento",
    musculoskeletal,
    false,
    false,
    false
).


disease_data(
    diabete_tipo_2,
    "Diabete mellito di tipo 2",
    "Disturbo metabolico cronico caratterizzato da insulino-resistenza e iperglicemia post-prandiale persistente",
    "Polidipsia, poliuria, stanchezza, vista offuscata, perdita di peso inspiegabile",
    "Insulino-resistenza, obesità, dieta sbilanciata, predisposizione genetica",
    metabolic,
    true,
    false,
    true
).


disease_data(
    osteoartrite,
    "Osteoartrosi (artrosi)",
    "Malattia degenerativa delle articolazioni causata da deterioramento della cartilagine",
    "Dolore articolare, rigidità, ridotta mobilità, crepitio articolare",
    "Usura articolare, età avanzata, stress meccanico, obesità",
    musculoskeletal,
    true,
    false,
    false
).


disease_data(
    artrite_reumatoide,
    "Artrite reumatoide",
    "Malattia autoimmune cronica che colpisce le articolazioni sinoviali causando infiammazione e danno articolare progressivo",
    "Dolore articolare simmetrico, gonfiore, rigidità mattutina, affaticamento",
    "Reazione autoimmune, predisposizione genetica, fattori ambientali",
    autoimmune,
    true,
    false,
    true
).


disease_data(
    spondilite_anchilosante,
    "Spondilite anchilosante",
    "Malattia infiammatoria cronica che colpisce la colonna vertebrale e le articolazioni sacroiliache",
    "Mal di schiena, rigidità mattutina, limitazione della mobilità, postura curva",
    "Fattori genetici (HLA-B27), predisposizione autoimmune",
    musculoskeletal,
    true,
    false,
    true
).

disease_data(
    dismenorrea,
    "Dismenorrea primaria",
    "Dolore mestruale intenso non legato a patologie pelviche",
    "Dolori pelvici ciclici, crampi",
    "Contrazioni uterine, prostaglandine elevate",
    gynecological,
    false,
    false,
    false
    ).

disease_data(
    odontalgia,
    "Odontalgia",
    "Dolore localizzato a un dente",
    "Dolore pulsante, sensibilità al caldo/freddo",
    "Caries, infezioni, trauma dentale",
    dental,
    false,
    false,
    false
    ).


disease_data(
    diabete_tipo_1,
    "Diabete mellito di tipo 1",
    "Malattia autoimmune cronica caratterizzata dalla distruzione delle cellule beta pancreatiche, con conseguente carenza assoluta di insulina",
    "Aumento della sete (polidipsia), aumento della minzione (poliuria), perdita di peso, stanchezza, visione offuscata, chetoacidosi",
    "Autoimmunità, predisposizione genetica, fattori ambientali (infezioni virali)",
    endocrine,
    true,
    false,
    true
).