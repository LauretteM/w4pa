abstract Descriptions = {

    flags
        startcat = Description ;

    cat
        Description ;
        CountryKind ;
        CountryLocation ;

    fun
        KindDescription : CountryKind -> Description ;
        LocationDescription : CountryLocation -> Description ;
        FullDescription : CountryKind -> CountryLocation -> Description ;

        RealUnion : CountryKind ;
        IslandCountry : CountryKind ;
        DividedTerritory : CountryKind ;
        LandlockedCountry : CountryKind ;
        TranscontinentalCountry : CountryKind ;
        DevelopedCountry : CountryKind ;
        DevelopingCountry : CountryKind ;
        PersonalUnion : CountryKind ;
        SovereignState : CountryKind ;
        MediterraneanCountry : CountryKind ;
        AutonomousCountryDenmark : CountryKind ;

        Europe : CountryLocation ;
        Asia : CountryLocation ;
        WestAfrica : CountryLocation ;
        SubsaharanAfrica : CountryLocation ;
        Africa : CountryLocation ;
        ArabWorld : CountryLocation ;
        Australasia : CountryLocation ;
        AustraliaAndNewZealand : CountryLocation ;
        Balkans : CountryLocation ;
        BalticStates : CountryLocation ;
        Benelux : CountryLocation ;
        Caribbean : CountryLocation ;
        CatalanCountries : CountryLocation ;
        Caucasus : CountryLocation ;
        CentralAfrica : CountryLocation ;
        CentralAmerica : CountryLocation ;
        CentralAsia : CountryLocation ;
        CentralEurope : CountryLocation ;
        DutchCaribbean : CountryLocation ;
        EastAfrica : CountryLocation ;
        EastAsia : CountryLocation ;
        EasternEurope : CountryLocation ;
        Eurasia : CountryLocation ;
        Europe : CountryLocation ;
        EuropeanUnion : CountryLocation ;
        Fennoscandia : CountryLocation ;
        Ireland : CountryLocation ;
        KingdomOfDenmark : CountryLocation ;
        KingdomOfTheNetherlands : CountryLocation ;
        LatinAmerica : CountryLocation ;
        LowCountries : CountryLocation ;
        MainlandSoutheastAsia : CountryLocation ;
        MediterraneanBasin : CountryLocation ;
        Melanesia : CountryLocation ;
        Micronesia : CountryLocation ;
        MiddleAmerica : CountryLocation ;
        MiddleEast : CountryLocation ;
        NetherlandsAntilles : CountryLocation ;
        NordicCountries : CountryLocation ;
        NorthAfrica : CountryLocation ;
        NorthAmerica : CountryLocation ;
        NorthernEurope : CountryLocation ;
        Oceania : CountryLocation ;
        Palestine : CountryLocation ;
        Polynesia : CountryLocation ;
        RealmOfNewZealand : CountryLocation ;
        SaintMartin : CountryLocation ;
        Scandinavia : CountryLocation ;
        SouthAmerica : CountryLocation ;
        SouthAsia : CountryLocation ;
        SoutheastAfrica : CountryLocation ;
        SoutheastAsia : CountryLocation ;
        SoutheastEurope : CountryLocation ;
        SouthernAfrica : CountryLocation ;
        SouthernEurope : CountryLocation ;
        SouthWestEurope : CountryLocation ;
        SubSaharanAfrica : CountryLocation ;
        WestAfrica : CountryLocation ;
        WestAsia : CountryLocation ;
        WesternEurope : CountryLocation ;
        WindwardIslands : CountryLocation ;
}