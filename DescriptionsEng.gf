concrete DescriptionsEng of Descriptions = CountriesEng ** open SyntaxEng,ParadigmsEng,ParamX,Prelude,LexiconEng in {

    lincat
        Description = NP ;

    lin
        CountryKindDescription ck = ck ;
        CountryLocationDescription cl = mkNP (mkNP aSg_Det country_N) (SyntaxEng.mkAdv in_Prep cl) ;
        FullCountryDescription ck cl = mkNP ck (SyntaxEng.mkAdv in_Prep cl) ;

}
