concrete DescriptionsEng of Descriptions = CountriesEng ** open SyntaxEng,ParadigmsEng,ParamX,Prelude,LexiconEng,SymbolicEng in {

    lincat
        Description = NP ;
        CityFeature = NP ;
        LanguageFeature = NP ;
        NumberDet = Det ;

    lin
        CountryKindDescription ck = ck ;
        CountryRegionDescription cl = mkNP (mkNP aSg_Det country_N) (SyntaxEng.mkAdv in_Prep cl) ;
        FullCountryDescription ck cl = mkNP ck (SyntaxEng.mkAdv in_Prep cl) ;

        CityDescription cn = mkNP (mkCN (mkN2 capital_city_N) cn) ;
        CityFeatureDescription cf cn = mkNP and_Conj (mkListNP cf (mkNP (mkCN (mkN2 capital_city_N) cn))) ;

        LanguageFeatureDescription lf = lf ;

        LargestCity = mkNP theSg_Det (mkCN largest_A city_N) ;

        OfficialLanguage cn = mkNP (mkCN official_A (mkCN (mkN2 language_N) cn)) ;
        SpokenInCountry cn = mkNP (mkNP language_N) (mkRS (mkRCl which_RP (mkVP (passiveVP speak_V2) (SyntaxEng.mkAdv in_Prep cn)))) ;
        SpokenInTwoCountries cn1 cn2 = mkNP (mkNP language_N) (mkRS (mkRCl which_RP (mkVP (passiveVP speak_V2) (SyntaxEng.mkAdv in_Prep (mkNP and_Conj (mkListNP cn1 cn2)))))) ;
        SpokenCountriesNumber number = mkNP (mkNP language_N) (mkRS (mkRCl which_RP (mkVP (passiveVP speak_V2) (SyntaxEng.mkAdv in_Prep (mkNP number country_N))))) ;
        NumberOfSpeakers number = mkNP (mkNP language_N) (mkRS (mkRCl which_RP (mkVP (passiveVP speak_V2) (SyntaxEng.mkAdv by_Prep (mkNP number speaker_N))))) ;

        SpokenCountriesAndTheOfficial cn number = mkNP and_Conj (mkListNP 
            (mkNP (mkNP language_N) (mkRS (mkRCl which_RP (mkVP (passiveVP speak_V2) (SyntaxEng.mkAdv in_Prep (mkNP number country_N))))))
            (mkNP theSg_Det (mkCN official_A (mkCN (mkN2 language_N) cn)))
         ) ;
        SpokenCountriesAndAnOfficial cn number = mkNP and_Conj (mkListNP 
            (mkNP (mkNP language_N) (mkRS (mkRCl which_RP (mkVP (passiveVP speak_V2) (SyntaxEng.mkAdv in_Prep (mkNP number country_N))))))
            (mkNP aSg_Det (mkCN official_A (mkCN (mkN2 language_N) cn)))
         ) ;
        
        SpokenCountriesNumberOfSpeakers numspeakers numcountries =
            mkNP
                (mkNP (mkCN language_N (SyntaxEng.mkAdv with_Prep (mkNP numspeakers speaker_N))))
                (mkRS (mkRCl which_RP (mkVP (passiveVP speak_V2) (SyntaxEng.mkAdv in_Prep (mkNP numcountries country_N))))) ;

        IntDet i = mkDet (mkcard (mkSymb i.s)) ;

    oper
        mkcard : Symb -> Card = symb ;

}
