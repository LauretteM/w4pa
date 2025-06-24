concrete DescriptionsZul of Descriptions = CountriesZul, CurrenciesZul, SymbolSBantuZul ** open SyntaxSBantuZul,ParadigmsZul,Prelude,ResZul,WikiDataLexiconZul in {

    lincat
        Description = NP ;
        CityFeature = NP ;
        LanguageFeature = NP ;
        CurrencyFeature = NP ;
        NumberMod = VP ;
        SymbNumber = Symb ;

    lin
        CountryKindDescription ck = ck ;
        CountryRegionDescription cr = mkNP (mkNP country_N) (mkRS (mkVP (mkLoc (locativisedNoun cr)))) ;
        FullCountryDescription ck cr = mkNP ck (mkRS (mkVP (mkLoc (locativisedNoun cr)))) ;

        CityDescription c = mkNP (possCN capital_city_N c) ;
        CityFeatureDescription cf c = mkNP cf together_with_ConjN (mkNP (possCN capital_city_N c)) ;

        CurrencyFeatureDescription f = f ;

        LargestCity = mkNP (mkNP city_N) (mkRS (mkVP (mkAP big_A))) ;

        OfficialLanguage c = mkNP (mkNP language_N) (mkRS (mkVP (mkLoc (locativisedNoun (mkNP (possCN law_N c)))))) ;
        SpokenInCountry c = mkNP (mkNP language_N) (mkRS (mkVP (mkVP is_spoken_V) (SyntaxSBantuZul.mkAdv c))) ;
        SpokenInTwoCountries c1 c2 = mkNP (mkNP language_N) (mkRS (mkVP (mkVP is_spoken_V) (SyntaxSBantuZul.mkAdv (mkNP c1 with_ConjN c2)))) ;
        SpokenCountriesNumber nummod = mkNP (mkNP language_N) (mkRS (mkVP (mkVP is_spoken_V) (SyntaxSBantuZul.mkAdv (mkNP (mkNP aPl_Det country_N) (mkRS nummod))))) ;
        NumberOfSpeakers nummod = mkNP (mkNP language_N) (mkRS (assocVP (mkNP (mkNP aPl_Det speaker_N) (mkRS nummod)))) ;
        
        SpokenCountriesAndTheOfficial c nummod = mkNP (mkNP language_N) (mkRS (mkRS (mkVP (mkVP is_spoken_V) (SyntaxSBantuZul.mkAdv (mkNP (mkNP aPl_Det country_N) (mkRS nummod))))) and_Conj (mkRS (mkVP (mkLoc (locativisedNoun (mkNP (possCN law_N c))))))) ;
        SpokenCountriesNumberOfSpeakers numc nums = mkNP (mkNP language_N) (mkRS (mkRS (assocVP (mkNP (mkNP aPl_Det speaker_N) (mkRS nums)))) and_Conj (mkRS (mkVP (mkVP is_spoken_V) (SyntaxSBantuZul.mkAdv (mkNP (mkNP aPl_Det country_N) (mkRS numc)))))) ;

        OfficialCurrency c = mkNP (mkNP type_N (mkNP money_N)) (mkRS (mkVP (mkLoc (locativisedNoun (mkNP (possCN law_N c)))))) ;
        CentralBankFeature cb = mkNP (mkNP type_N (mkNP money_N)) (mkRS (mkVP be_taken_out_V)) ;

        SymbModA s = mkVP (mkAP (mkNumA s)) ;
        SymbModSmallN s = mkVP (mkNP aSg_Det (mkSmallNumN s)) ;
        SymbModN10Sg s = mkVP (mkNP aSg_Det (mkNumN10 s)) ;
        SymbModN10Pl s = mkVP (mkNP aPl_Det (mkNumN10 s)) ;
        SymbModN100Sg s = mkVP (mkNP aSg_Det (mkNumN100 s)) ;
        SymbModN100Pl s = mkVP (mkNP aPl_Det (mkNumN100 s)) ;
        SymbModN1000Sg s = mkVP (mkNP aSg_Det (mkNumN1000 s)) ;
        SymbModN1000Pl s = mkVP (mkNP aPl_Det (mkNumN1000 s)) ;

        SymbNumb symb = symb ;
}
