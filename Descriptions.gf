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

        Africa : CountryLocation ;
        Europe : CountryLocation ;
        Asia : CountryLocation ;
        WestAfrica : CountryLocation ;
        SubsaharanAfrica : CountryLocation ;

}