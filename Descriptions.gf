abstract Descriptions = Countries ** {

    flags
        startcat = Description ;

    cat
        Description ;

    fun
        CountryKindDescription : CountryKind -> Description ;
        CountryLocationDescription : CountryLocation -> Description ;
        FullCountryDescription : CountryKind -> CountryLocation -> Description ;

}
