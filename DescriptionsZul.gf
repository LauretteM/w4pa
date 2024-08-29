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
        -- DividedTerritory = mkNP aSg_Det (mkCN (mkA "divided") (mkN "territory")) ;
        LandlockedCountry = RelNP (DetCN (DetNum NumSg) (UseN (mkN "zwe" C5_6))) (UseRCl TPresTemp PNeg (RelVP IdRP (CopNPAssoc (DetCN (DetNum NumSg) (UseN (mkN "lwandle" C11_10)))))) ;
        -- TranscontinentalCountry : CountryKind ;
        -- DevelopedCountry : CountryKind ;
        -- DevelopingCountry : CountryKind ;
        -- PersonalUnion : CountryKind ;
        -- SovereignState : CountryKind ;
        -- MediterraneanCountry : CountryKind ;
        -- AutonomousCountryDenmark : CountryKind ;

        -- Africa = mkNP (mkN "Africa") ;
       -- Europe : CountryLocation ;
        -- Asia : CountryLocation ;
        -- WestAfrica : CountryLocation ;
        -- SubsaharanAfrica : CountryLocation ;
        -- Africa : CountryLocation ;
        -- ArabWorld : CountryLocation ;
        -- Australasia : CountryLocation ;
        -- AustraliaAndNewZealand : CountryLocation ;
        -- Balkans : CountryLocation ;
        -- BalticStates : CountryLocation ;
        -- Benelux : CountryLocation ;
        -- Caribbean : CountryLocation ;
        -- CatalanCountries : CountryLocation ;
        -- Caucasus : CountryLocation ;
        -- CentralAfrica : CountryLocation ;
        -- CentralAmerica : CountryLocation ;
        -- CentralAsia : CountryLocation ;
        -- CentralEurope : CountryLocation ;
        -- DutchCaribbean : CountryLocation ;
        -- EastAfrica : CountryLocation ;
        -- EastAsia : CountryLocation ;
        -- EasternEurope : CountryLocation ;
        -- Eurasia : CountryLocation ;
        -- Europe : CountryLocation ;
        -- EuropeanUnion : CountryLocation ;
        -- Fennoscandia : CountryLocation ;
        -- Ireland : CountryLocation ;
        -- KingdomOfDenmark : CountryLocation ;
        -- KingdomOfTheNetherlands : CountryLocation ;
        -- LatinAmerica : CountryLocation ;
        -- LowCountries : CountryLocation ;
        -- MainlandSoutheastAsia : CountryLocation ;
        -- MediterraneanBasin : CountryLocation ;
        -- Melanesia : CountryLocation ;
        -- Micronesia : CountryLocation ;
        -- MiddleAmerica : CountryLocation ;
        -- MiddleEast : CountryLocation ;
        -- NetherlandsAntilles : CountryLocation ;
        -- NordicCountries : CountryLocation ;
        -- NorthAfrica : CountryLocation ;
        -- NorthAmerica : CountryLocation ;
        -- NorthernEurope : CountryLocation ;
        -- Oceania : CountryLocation ;
        -- Palestine : CountryLocation ;
        -- Polynesia : CountryLocation ;
        -- RealmOfNewZealand : CountryLocation ;
        -- SaintMartin : CountryLocation ;
        -- Scandinavia : CountryLocation ;
        -- SouthAmerica : CountryLocation ;
        -- SouthAsia : CountryLocation ;
        -- SoutheastAfrica : CountryLocation ;
        -- SoutheastAsia : CountryLocation ;
        -- SoutheastEurope : CountryLocation ;
        -- SouthernAfrica : CountryLocation ;
        -- SouthernEurope : CountryLocation ;
        -- SouthWestEurope : CountryLocation ;
        -- SubSaharanAfrica : CountryLocation ;
        -- WestAfrica : CountryLocation ;
        -- WestAsia : CountryLocation ;
        -- WesternEurope : CountryLocation ;
        -- WindwardIslands : CountryLocation ;
}