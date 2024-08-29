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
        IslandCountry = mkNP aSg_Det (mkCN island_N (mkNP country_N)) ;
        DividedTerritory = mkNP aSg_Det (mkCN divided_A territory_N) ;
        LandlockedCountry = mkNP aSg_Det (mkCN landlocked_A country_N) ;
        -- TranscontinentalCountry : CountryKind ;
        -- DevelopedCountry : CountryKind ;
        -- DevelopingCountry : CountryKind ;
        -- PersonalUnion : CountryKind ;
        -- SovereignState : CountryKind ;
        -- MediterraneanCountry : CountryKind ;
        -- AutonomousCountryDenmark : CountryKind ;

        Africa = mkNP Africa_N ;
        Europe = mkNP Europe_N ;
        Asia = mkNP Asia_N ;
        
        
        Africa = mkNP Africa_N ;
        -- * ArabWorld = mkNP ArabWorld_N ;
        Australasia = mkNP Australasia_N ;
        -- AustraliaAndNewZealand = mkNP AustraliaAndNewZealand_N
        Balkans = mkNP thePl_Det Balkan_N ;
        -- BalticStates = mkNP BalticStates_N
        Benelux = mkNP Benelux_N ;
        Caribbean = mkNP theSg_Det Caribbean_N ;
        -- CatalanCountries = mkNP CatalanCountries_N
        Caucasus = mkNP theSg_Det Caucasus_N ;
        -- CentralAfrica = mkNP CentralAfrica_N
        -- CentralAmerica = mkNP CentralAmerica_N
        -- CentralAsia = mkNP CentralAsia_N
        -- CentralEurope = mkNP CentralEurope_N
        -- * DutchCaribbean = mkNP DutchCaribbean_N ;
        -- * EastAfrica = mkNP EastAfrica_N ;
        -- * EastAsia = mkNP EastAsia_N ;
        --EasternEurope = mkNP EasternEurope_N
        Eurasia = mkNP Eurasia_N ;
        Europe = mkNP Europe_N ;
        -- EuropeanUnion = mkNP EuropeanUnion_N
        Fennoscandia = mkNP Fennoscandia_N ;
        Ireland = mkNP Ireland_N ;
        -- KingdomOfDenmark = mkNP KingdomOfDenmark_N
        -- KingdomOfTheNetherlands = mkNP KingdomOfTheNetherlands_N
        -- * LatinAmerica = mkNP LatinAmerica_N ;
        -- LowCountries = mkNP LowCountries_N
        -- * MainlandSoutheastAsia = mkNP MainlandSoutheastAsia_N ;
        -- MediterraneanBasin = mkNP MediterraneanBasin_N
        Melanesia = mkNP Melanesia_N ;
        Micronesia = mkNP Micronesia_N ;
        -- * MiddleAmerica = mkNP MiddleAmerica_N ;
        -- * MiddleEast = mkNP MiddleEast_N ;
        -- * NetherlandsAntilles = mkNP NetherlandsAntilles_N ;
        -- NordicCountries = mkNP NordicCountries_N
        -- * NorthAfrica = mkNP NorthAfrica_N ;
        -- * NorthAmerica = mkNP NorthAmerica_N ;
        -- NorthernEurope = mkNP NorthernEurope_N
        Oceania = mkNP Oceania_N ;
        Palestine = mkNP Palestine_N ;
        Polynesia = mkNP Polynesia_N ;
        -- RealmOfNewZealand = mkNP RealmOfNewZealand_N
        --SaintMartin = mkNP SaintMartin_N
        Scandinavia = mkNP Scandinavia_N ;
        -- * SouthAmerica = mkNP SouthAmerica_N ;
        -- * SouthAsia = mkNP SouthAsia_N ;
        -- * SoutheastAfrica = mkNP SoutheastAfrica_N ;
        -- * SoutheastAsia = mkNP SoutheastAsia_N ;
        -- * SoutheastEurope = mkNP SoutheastEurope_N ;
        -- SouthernAfrica = mkNP SouthernAfrica_N
        -- SouthernEurope = mkNP SouthernEurope_N
        -- * SouthWestEurope = mkNP SouthWestEurope_N ;
        SubsaharanAfrica = mkNP SubsaharanAfrica_CN ;
        WestAfrica = mkNP WestAfrica_N ;
        -- * WestAsia = mkNP WestAsia_N ;
        -- WesternEurope = mkNP WesternEurope_N
        -- WindwardIslands = mkNP WindwardIslands_N
}