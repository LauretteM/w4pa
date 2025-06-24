abstract Descriptions = Countries, Languages, Cities, Currencies, SymbolSBantu ** {

    flags
        startcat = Description ;

    cat
        Description ;
        CityFeature ;
        CurrencyFeature ;
        LanguageFeature ;
        NumberMod ;
        SymbNumber ;

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
        SpokenCountriesNumber : NumberMod -> LanguageFeature ;
        NumberOfSpeakers : NumberMod -> LanguageFeature ;

        SpokenCountriesAndTheOfficial : Country -> NumberMod -> LanguageFeature ;
        -- SpokenCountriesAndAnOfficial : Country -> NumberMod -> LanguageFeature ;

        SpokenCountriesNumberOfSpeakers : NumberMod -> NumberMod -> LanguageFeature ;

        OfficialCurrency : Country -> CurrencyFeature ;
        CentralBankFeature : CentralBank -> CurrencyFeature ;

        SymbModA : SymbNumber -> NumberMod ; -- 2-5
        SymbModSmallN : SymbNumber -> NumberMod ; -- 6-9
        SymbModN10Sg : SymbNumber -> NumberMod ; -- 10-19
        SymbModN10Pl : SymbNumber -> NumberMod ; -- 20-99
        SymbModN100Sg : SymbNumber -> NumberMod ; -- 100-199
        SymbModN100Pl : SymbNumber -> NumberMod ; -- 200-999
        SymbModN1000Sg : SymbNumber -> NumberMod ; -- 1000-1999
        SymbModN1000Pl : SymbNumber -> NumberMod ; -- 2000-9999

        SymbNumb : Symb -> SymbNumber ;

}
