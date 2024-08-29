resource LexiconEng = open SyntaxEng,ParadigmsEng in {
    
    oper
        -- nouns
        country_N : N = mkN "country" ;
        island_N : N = mkN "island" ;
        territory_N : N = mkN "territory" ;

        -- adjectives
        divided_A : A = mkA "divided" ;
        landlocked_A : A = mkA "landlocked" ;


        -- placed name nouns
        Africa_N : N = mkN "Africa" ;
        Asia_N : N = mkN "Asia" ;
        Australasia_N : N = mkN "Australasia" ;
        Balkan_N : N = mkN "Balkan" ;
        Benelux_N : N = mkN "Benelux" ;
        Caribbean_N : N = mkN "Caribbean" ;
        Caucasus_N : N = mkN "Caucasus" ;
        Eurasia_N : N = mkN "Eurasia" ;
        Europe_N : N = mkN "Europe" ;
        Fennoscandia_N : N = mkN "Fennoscandia" ;
        Ireland_N : N = mkN "Ireland" ;
        Melanesia_N : N = mkN "Melanesia" ;
        Micronesia_N : N = mkN "Micronesia" ;
        Oceania_N : N = mkN "Oceania" ;
        Palestine_N : N = mkN "Palestine" ;
        Polynesia_N : N = mkN "Polynesia" ;
        Scandinavia_N : N = mkN "Scandinavia" ;
        SubsaharanAfrica_CN : CN = mkCN SubSaharan_A Africa_N ;
        WestAfrica_N : N = mkN West_Str Africa_N ;

        -- place name adjectives
        SubSaharan_A : A = mkA "Subsaharan" ;

        -- place name strings
        West_Str : Str = "West" ;
        East_Str : Str = "East" ;
        North_Str : Str = "North" ;
        South_Str : Str = "South" ;
        Southeast_Str : Str = "Southeast" ;
        Southwest_Str : Str = "Southwest" ;
        Middle_Str : Str = "Middle" ;
        

}