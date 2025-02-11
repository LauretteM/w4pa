abstract Descriptions = Countries, Languages, Cities, Currencies ** {

    flags
        startcat = Description ;

    cat
        Description ;
        CityFeature ;
        CurrencyFeature ;
        LanguageFeature ;

    fun
        CountryKindDescription : CountryKind -> Description ;
        CountryRegionDescription : CountryRegion -> Description ;
        FullCountryDescription : CountryKind -> CountryRegion -> Description ;

        CityDescription : CapitalCity -> Country -> Description ;
        CityFeatureDescription : CapitalCity -> CityFeature -> Country -> Description ;

        LanguageDescription : Language -> LanguageFeature -> Description ;

        CurrencyDescription : Currency -> CurrencyFeature -> Description ;

        BigCity : CityFeature ;
        LargestCity : CityFeature ;

        OfficialLanguage : Country -> LanguageFeature ;
        SpokenInCountry: Country -> LanguageFeature ;
        SpokenInTwoCountries : Country -> Country -> LanguageFeature ;
        NumberOfSpeakers : String -> LanguageFeature ;

        UsedInCountry : Country -> CurrencyFeature ;
        CentralBankFeature : CentralBank -> CurrencyFeature ;

        

}
