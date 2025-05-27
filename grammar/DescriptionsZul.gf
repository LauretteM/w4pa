concrete DescriptionsZul of Descriptions = CountriesZul ** open SyntaxSBantuZul,ParadigmsZul,Prelude,ResZul,WikiDataLexiconZul in {

    lincat
        Description = NP ;
        CityFeature = NP ;
        LanguageFeature = NP ;
        NumberDet = Det ;

    lin
        CountryKindDescription ck = ck ;
        CountryRegionDescription cr = mkNP (mkNP country_N) (mkRS (mkVP (mkLoc (locativisedNoun cr)))) ;
        FullCountryDescription ck cr = mkNP ck (mkRS (mkVP (mkLoc (locativisedNoun cr)))) ;

        CityDescription c = mkNP (possCN capital_city_N (mkNP c)) ;
        CityFeatureDescription cf c = mkNP cf together_with (mkNP (possCN capital_city_N (mkNP c))) ;

        LargestCity = mkNP (mkNP city_N) (mkRS (mkVP (mkAP big_A))) ;

}
