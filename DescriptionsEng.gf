concrete DescriptionsEng of Descriptions = open SyntaxEng,ParadigmsEng,ParamX,Prelude,LexiconEng in {

    lincat
        Description = NP ;
        CountryKind = NP ;
        CountryLocation = NP ;

    lin
        KindDescription ck = ck ;
        LocationDescription cl = mkNP (mkNP aSg_Det country_N) (SyntaxEng.mkAdv in_Prep cl) ;
        FullDescription ck cl = mkNP ck (SyntaxEng.mkAdv in_Prep cl) ;

        -- RealUnion : CountryKind ;
        IslandCountry = mkNP aSg_Det (mkCN (mkN "island") (mkNP country_N)) ;
        DividedTerritory = mkNP aSg_Det (mkCN (mkA "divided") (mkN "territory")) ;
        LandlockedCountry = mkNP aSg_Det (mkCN (mkA "landlocked") country_N) ;
        -- TranscontinentalCountry : CountryKind ;
        -- DevelopedCountry : CountryKind ;
        -- DevelopingCountry : CountryKind ;
        -- PersonalUnion : CountryKind ;
        -- SovereignState : CountryKind ;
        -- MediterraneanCountry : CountryKind ;
        -- AutonomousCountryDenmark : CountryKind ;

        Africa = mkNP (mkN "Africa") ;
        -- Europe : CountryLocation ;
        -- Asia : CountryLocation ;
        -- WestAfrica : CountryLocation ;
        -- SubsaharanAfrica : CountryLocation ;

}