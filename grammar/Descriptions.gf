abstract Descriptions = Countries, Languages, Cities, Currencies ** {

    flags
        startcat = Description ;

    cat
        Description ;
        CityFeature ;
        CurrencyFeature ;
        LanguageFeature ;
        NumberDet ;

    fun
        CountryKindDescription : CountryKind -> Description ;
        CountryRegionDescription : CountryRegion -> Description ;
        FullCountryDescription : CountryKind -> CountryRegion -> Description ;

        CityDescription : Country -> Description ;
        CityFeatureDescription : CityFeature -> Country -> Description ;

        LanguageFeatureDescription : LanguageFeature -> Description ;

        CurrencyFeatureDescription : CurrencyFeature -> Description ;

        LargestCity : CityFeature ;

        OfficialLanguage : Country -> LanguageFeature ;
        SpokenInCountry: Country -> LanguageFeature ;
        SpokenInTwoCountries : Country -> Country -> LanguageFeature ;
        NumberOfSpeakers : NumberDet -> LanguageFeature ;

        UsedInCountry : Country -> CurrencyFeature ;
        CentralBankFeature : CentralBank -> CurrencyFeature ;

        IntDet : Int -> NumberDet ;

}
