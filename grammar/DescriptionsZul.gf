concrete DescriptionsZul of Descriptions = open SBantuLangZul,ParadigmsZul,Prelude,ResZul in {

    lincat
        Description = NP ;
        CountryKind = NP ;
        CountryLocation = NP ;

    lin
        KindDescription ck = ck ;
        -- LocationDescription cl = RelNP (DetCN (DetNum NumSg) (mkN "zwe" C5_6)) (UseRCl TPresTemp PPos (RelVP IdRP ())) ;
        -- FullDescription ck cl = mkNP ck (SyntaxEng.mkAdv in_Prep cl) ;

        -- RealUnion : CountryKind ;
        -- IslandCountry = mkNP aSg_Det (mkCN (mkN "island") (mkNP country_N)) ;
        DividedTerritory = mkNP aSg_Det (mkCN (mkA "divided") (mkN "territory")) ;
        LandlockedCountry = RelNP (DetCN (DetNum NumSg) (UseN (mkN "zwe" C5_6))) (UseRCl TPresTemp PNeg (RelVP IdRP (CopNPAssoc (DetCN (DetNum NumSg) (UseN (mkN "lwandle" C11_10)))))) ;
        -- TranscontinentalCountry = mkNP aSg_Det (mkCN transcontinental_A country_N) ;
        -- DevelopedCountry = mkNP aSg_Det (mkCN developed_A country_N) ;
        -- DevelopingCountry = mkNP aSg_Det (mkCN developing_A country_N) ;
        -- PersonalUnion = mkNP aSg_Det (mkNP Personal_Str union_N) ;
        -- SovereignState = mkNP aSg_Det (mkNP Sovereign_Str state_N) ;
        -- MediterraneanCountry = mkNP aSg_Det (mkCN mdeiterranean_A country_N) ;
        -- AutonomousCountryDenmark = mkNP aSg_Det (mkA autonomous_A country_N) ;

        Africa = mkNP Africa_N ;
        Asia = mkNP Asia_N ;
        ArabWorld = mkNP aSg_Det ArabWorld_N ;
        Australasia = mkNP Australasia_N ;
        ---- AustraliaAndNewZealand : CountryLocation ;
        Balkans = mkNP aPl_Det (mkNP Balkan_N) ;
        BalticStates = mkNP aPl_Det (mkCN Balctic_A State_N)
        Benelux = mkNP Benelux_N ;
        Caribbean = mkNP aSg_Det (mkNP Carribean_N) ;
        CatalanCountries = mkNP aPl_Det (mkNP Catalan_A country_N) ;
        Caucasus = mkNP aSg_Det (mkN Caucasus_N) ;
        CentralAfrica = mkNP (mkCN Central_A Africa_N) ;
        CentralAmerica = mkNP (mkCN Central_A America_N) ;
        CentralAsia = mkNP (mkCN Central_A Asia_N) ;
        CentralEurope = mkNP (mkCN Central_A Europe_N) ;
        DutchCaribbean = mkNP (mkNP Dutch_Str Carribean_N) ;
        EastAfrica = mkNP EastAfrica_N ;
        EastAsia = mkNP EastAfrica_N ;
        -- EasternEurope = mkNP (mkCN Eastern_A Europe_N) ;
        -- Eurasia = mkNP Eurasia_N ;
        -- Europe = mkNP Europe_N ;
        -- EuropeanUnion = mkNP (mkCN European_A union_N) ;
        -- Fennoscandia = mkNP Fennoscandia_N ;
        -- Ireland = mkNP Ireland_N ;
        -- KingdomOfDenmark = mkNP aPl_Det (mkNP Kingdom_Str Denmark_N) ;
        -- KingdomOfTheNetherlands = mkNP aPl_Det (mkNP Kingdom_Str Netherland_N) ;
        -- LatinAmerica = mkNP (mkNP Latin_Str America_N) ;
        -- LowCountries = mkNP aPl_Det (mkCN Low_A country_N) ;
        ---- MainlandSoutheastAsia : CountryLocation ;
        -- MediterraneanBasin = mkNP aPl_Det (mkCN mediterranean A Basin_N) ;
        -- Melanesia = mkNP Melanesia_N ;
        -- Micronesia = mkNP Micronesia_N ;
        -- MiddleAmerica = mkNP MiddleAmerica_N ;
        -- MiddleEast = mkNP MiddleEast_N ;
        -- NetherlandsAntilles = mkNP aSg_Det (mkNP Netherlands_N Antilles_Str) ;
        -- NordicCountries = mkNP aPl_Det (mkCN Nordic_A country_N) ;
        -- NorthAfrica = mkNP NorthAfrica_N ;
        -- NorthAmerica = mkNP NorthAmerica_N ;
        -- NorthernEurope = mkNP (mkCN Northern_A Europe_N) ;
        -- Oceania = mkNP Oceania ;
        -- Palestine = mkNP Palestine ;
        -- Polynesia = mkNP Polynesia ;
        -- RealmOfNewZealand = mkNP aPl_Det (mkNP Realm_Str NewZealand_N) ;
        -- SaintMartin = mkNP (mkCN Saint_Str Martin_N) ;
        -- Scandinavia = mkNP Scandinavia ;
        -- SouthAmerica = mkNP SouthAmerica_N ;
        -- SouthAsia = mkNP SouthAsia_N ;
        -- SoutheastAfrica = mkNP SoutheastAfrica_N ;
        -- SoutheastAsia = mkNP SoutheastAsia_N ;
        -- SoutheastEurope = mkNP SoutheastEurope_N ;
        -- SouthernAfrica = mkNP (mkCN Southern_A Africa_N) ;
        -- SouthernEurope = mkNP (mkCN Southern_A Europe_N) ;
        -- SouthWestEurope = mkNP SouthwestEurope_N ;
        -- SubsaharanAfrica = mkNP (mkCN Subsaharan_A Africa_N) ;
        -- WestAfrica = mkNP WestAfrica_N ;
        -- WestAsia = mkNP WestAsia_N ;
        -- WesternEurope = mkNP (mkCN Western_A Europe_N) ;
        -- WindwardIslands = mkNP aPl_Det WindwardIsland_N ;
}
