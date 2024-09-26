resource LexiconEng = open SyntaxEng,ParadigmsEng in {
    
    oper
        -- nouns
        country_N : N = mkN "country" ;
        island_N : N = mkN "island" ;
        territory_N : N = mkN "territory" ;
        state_N : N = mkN "state" ;
        world_N : N = mkN "world" ; 
        union_N : N = mkN "union" ;

        -- adjectives
        autonomous_A : A = mkA "autonomous" ;
        divided_A : A = mkA "divided" ;
        landlocked_A : A = mkA "landlocked" ;
        transcontinental_A : A = mkA "transcontinental" ;
        developed_A : A = mkA "developed" ;
        developing_A : A = mkA "developing" ;
        sovereign_A : A = mkA "sovereign" ;
        mediterranean_A : A = mkA "mediterranean" ;

        -- placed name nouns
        Africa_N : N = mkN "Africa" ;
        America_N : N = mkN "America" ;
        ArabWorld_N : N = mkN "Arab World" ;
        Asia_N : N = mkN "Asia" ;
        Australasia_N : N = mkN "Australasia" ;
        Balkan_N : N = mkN "Balkan" ;
        Basin_N : N = mkN "Basin" ;
        Benelux_N : N = mkN "Benelux" ;
        Caribbean_N : N = mkN "Caribbean" ;
        Caucasus_N : N = mkN "Caucasus" ;
        Denmark_N : N = mkN "Denmark" ;
        Eurasia_N : N = mkN "Eurasia" ;
        Europe_N : N = mkN "Europe" ;
        Fennoscandia_N : N = mkN "Fennoscandia" ;
        Ireland_N : N = mkN "Ireland" ;
        Martin_N : N = "Martin" ;
        Melanesia_N : N = mkN "Melanesia" ;
        Micronesia_N : N = mkN "Micronesia" ;
        MiddleAmerica_N : N = mkN Middle_Str America_N ;
        MiddleEast_N : N = mkN Middle_Str East_Str ;
        Netherland_N : N = mkN Netherland_N ;
        NewZealand_N : N = mkN "New Zealand" ;
        NorthAfrica_N : N = mkN North_Str Africa_N ;
        NorthAmerica_N : N = mkN North_Str America_N ;
        Oceania_N : N = mkN "Oceania" ;
        Palestine_N : N = mkN "Palestine" ;
        Polynesia_N : N = mkN "Polynesia" ;
        Scandinavia_N : N = mkN "Scandinavia" ;
        SouthAmerica_N : N = mkN South_Str America_N ;
        SouthAsia_N : N = mkN South_Str Asia_N ;
        SoutheastAfrica_N : N = mkN "Southeast Africa" ;
        SoutheastAsia_N : N = mkN "Southeast Asia" ;
        SoutheastEurope_N : N = mkN "Southeast Europe" ;
        SouthwestEurope_N : N = mkN "Southwest Europe" ;
        WindwardInsland_N : N = mkN "Windward Island" ; 
        WestAfrica_N : N = mkN West_Str Africa_N ;
            
        
        -- place name adjectives
        Catalan_A : A = mkA "Catalan" ;
        Central_A : A = mkA "Central" ;
        Eastern_A : A = mkA "Eastern" ;
        SubSaharan_A : A = mkA "Subsaharan" ; 
        Baltic_A : A = mkA "Baltic" ;
        European_A : A = mkA "European" ;
        Low_A : A = mkA "Low" ;
        Nordic_A : A = mkA "Nordic" ;
        Western_A : = mkA "Western" ;
     
        
        -- place name strings
        Antilles_Str : Str = "Antilles" ;
        Arab_Str : Str = "Arab" ;
        Dutch_Str : Str = "Dutch" ;
        East_Str : Str = "East" ;
        Kingdom_Str : Str = "Kingdom of" ; 
        Middle_Str : Str = "Middle" ;
        North_Str : Str = "North" ;
        Personal_Str : Str = "personal" ;
        Realm_Str : Str = "Realm of" ;
        Saint_Str : Str = "Saint" ;
        South_Str : Str = "South" ;
        Southeast_Str : Str = "Southeast" ;
        Southwest_Str : Str = "Southwest" ; 
        Sovereign_Str : Str = "sovereign" ;     
		West_Str : Str = "West" ;
		Latin_Str : Str = "Latin"
		
}
