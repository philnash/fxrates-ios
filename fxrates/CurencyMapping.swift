//
//  CurrencyMapping.swift
//  fxrates
//
//  Created by Phil Nash on 8/12/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

struct CurrencyDetail {
    let name: String
    let flag: String
    let code: String
}

struct CurrencyMapping {
    static let mapping: [String: CurrencyDetail] = {
        var mapping = [String: CurrencyDetail]()
        mapping["AED"] = CurrencyDetail(name: "United Arab Emirates Dirham", flag: "🇦🇪", code: "AED")
        mapping["AFN"] = CurrencyDetail(name: "Afghan Afghani", flag: "🇦🇫", code: "AFN")
        mapping["ALL"] = CurrencyDetail(name: "Albanian Lek", flag: "🇦🇱", code: "ALL")
        mapping["AMD"] = CurrencyDetail(name: "Armenian Dram", flag: "🇦🇲", code: "AMD")
        mapping["ANG"] = CurrencyDetail(name: "Netherlands Antillean Guilder", flag: "🇨🇼🇸🇽", code: "ANG")
        mapping["AOA"] = CurrencyDetail(name: "Angolan Kwanza", flag: "🇦🇴", code: "AOA")
        mapping["ARS"] = CurrencyDetail(name: "Argentine Peso", flag: "🇦🇷", code: "ARS")
        mapping["AUD"] = CurrencyDetail(name: "Australian Dollar", flag: "🇦🇺", code: "AUD")
        mapping["AWG"] = CurrencyDetail(name: "Aruban Florin", flag: "🇦🇼", code: "AWG")
        mapping["AZN"] = CurrencyDetail(name: "Azerbaijani New Manat", flag: "🇦🇿", code: "AZN")
        mapping["BAM"] = CurrencyDetail(name: "Bosnian Convertible Marka", flag: "🇧🇦", code: "BAM")
        mapping["BBD"] = CurrencyDetail(name: "Barbados Dollar", flag: "🇧🇧", code: "BBD")
        mapping["BDT"] = CurrencyDetail(name: "Bangladeshi Taka", flag: "🇧🇩", code: "BDT")
        mapping["BGN"] = CurrencyDetail(name: "Bulgarian Lev", flag: "🇧🇬", code: "BGN")
        mapping["BHD"] = CurrencyDetail(name: "Bahraini Dinar", flag: "🇧🇭", code: "BHD")
        mapping["BIF"] = CurrencyDetail(name: "Burundian Franc", flag: "🇧🇮", code: "BIF")
        mapping["BMD"] = CurrencyDetail(name: "Bermuda Dollar", flag: "🇧🇲", code: "BMD")
        mapping["BND"] = CurrencyDetail(name: "Brunei Dollar", flag: "🇧🇳", code: "BND")
        mapping["BOB"] = CurrencyDetail(name: "Boliviano", flag: "🇧🇴", code: "BOB")
        mapping["BRL"] = CurrencyDetail(name: "Brazilian Real", flag: "🇧🇷", code: "BRL")
        mapping["BSD"] = CurrencyDetail(name: "Bahamian Dollar", flag: "🇧🇸", code: "BSD")
        mapping["BTN"] = CurrencyDetail(name: "Bhutanese Ngultrum", flag: "🇧🇹", code: "BTN")
        mapping["BWP"] = CurrencyDetail(name: "Botswana Pula", flag: "🇧🇼", code: "BWP")
        mapping["BYR"] = CurrencyDetail(name: "Belarusian Ruble", flag: "🇧🇾", code: "BYR")
        mapping["BZD"] = CurrencyDetail(name: "Belize Dollar", flag: "🇧🇿", code: "BZD")
        mapping["CAD"] = CurrencyDetail(name: "Canadian Dollar", flag: "🇨🇦", code: "CAD")
        mapping["CDF"] = CurrencyDetail(name: "Congolese Franc", flag: "🇨🇩", code: "CDF")
        mapping["CHF"] = CurrencyDetail(name: "Swiss Franc", flag: "🇨🇭", code: "CHF")
        mapping["CLF"] = CurrencyDetail(name: "Chile Unidades de Fomento", flag: "🇨🇱", code: "CLF")
        mapping["CLP"] = CurrencyDetail(name: "Chilean Peso", flag: "🇨🇱", code: "CLP")
        mapping["CNY"] = CurrencyDetail(name: "Chinese Yuan", flag: "🇨🇱", code: "CNY")
        mapping["COP"] = CurrencyDetail(name: "Colombian Peso", flag: "🇨🇴", code: "COP")
        mapping["CRC"] = CurrencyDetail(name: "Costa Rican Colón", flag: "🇨🇷", code: "CRC")
        mapping["CUP"] = CurrencyDetail(name: "Cuban Peso", flag: "🇨🇺", code: "CUP")
        mapping["CVE"] = CurrencyDetail(name: "Cape Verdean Escudo", flag: "🇨🇻", code: "CVE")
        mapping["CZK"] = CurrencyDetail(name: "Czech Koruna", flag: "🇨🇿", code: "CZK")
        mapping["DJF"] = CurrencyDetail(name: "Djiboutian Franc", flag: "🇩🇯", code: "DJF")
        mapping["DKK"] = CurrencyDetail(name: "Danish Krone", flag: "🇩🇰", code: "DKK")
        mapping["DOP"] = CurrencyDetail(name: "Dominican Peso", flag: "🇩🇴", code: "DOP")
        mapping["DZD"] = CurrencyDetail(name: "Algerian Dinar", flag: "🇩🇿", code: "DZD")
        mapping["EEK"] = CurrencyDetail(name: "Estonian Kroon", flag: "🇪🇪", code: "EEK")
        mapping["EGP"] = CurrencyDetail(name: "Egyptian Pound", flag: "🇪🇬", code: "EGP")
        mapping["ETB"] = CurrencyDetail(name: "Ethiopian Birr", flag: "🇪🇹", code: "ETB")
        mapping["EUR"] = CurrencyDetail(name: "Euro", flag: "🇪🇺", code: "EUR")
        mapping["FJD"] = CurrencyDetail(name: "Fiji Dollar", flag: "🇫🇯", code: "FJD")
        mapping["FKP"] = CurrencyDetail(name: "Falkland Island Pound", flag: "🇫🇰", code: "FKP")
        mapping["GBP"] = CurrencyDetail(name: "British Pound", flag: "🇬🇧", code: "GBP")
        mapping["GEL"] = CurrencyDetail(name: "Georgian Lari", flag: "🇬🇪", code: "GEL")
        mapping["GHS"] = CurrencyDetail(name: "Ghanaian Cedi", flag: "🇬🇭", code: "GHS")
        mapping["GIP"] = CurrencyDetail(name: "Gibraltar Pound", flag: "🇬🇮", code: "GIP")
        mapping["GMD"] = CurrencyDetail(name: "Gambian Dalasi", flag: "🇬🇲", code: "GMD")
        mapping["GNF"] = CurrencyDetail(name: "Guinean Franc", flag: "🇬🇳", code: "GNF")
        mapping["GTQ"] = CurrencyDetail(name: "Guatemalan Quetzal", flag: "🇬🇹", code: "GTQ")
        mapping["GYD"] = CurrencyDetail(name: "Guyanese Dollar", flag: "🇬🇾", code: "GYD")
        mapping["HKD"] = CurrencyDetail(name: "Hong Kong Dollar", flag: "🇭🇰", code: "HKD")
        mapping["HNL"] = CurrencyDetail(name: "Honduran Lempira", flag: "🇭🇳", code: "HNL")
        mapping["HRK"] = CurrencyDetail(name: "Croatian Kuna", flag: "🇭🇷", code: "HRK")
        mapping["HTG"] = CurrencyDetail(name: "Haitian Gourde", flag: "🇭🇹", code: "HTG")
        mapping["HUF"] = CurrencyDetail(name: "Hungarian Forint", flag: "🇭🇺", code: "HUF")
        mapping["IDR"] = CurrencyDetail(name: "Indonesian Rupiah", flag: "🇮🇩", code: "IDR")
        mapping["ILS"] = CurrencyDetail(name: "Israeli Sheqel", flag: "🇮🇱", code: "ILS")
        mapping["INR"] = CurrencyDetail(name: "Indian Rupee", flag: "🇮🇳", code: "INR")
        mapping["IQD"] = CurrencyDetail(name: "Iraqi Dinar", flag: "🇮🇶", code: "IQD")
        mapping["IRR"] = CurrencyDetail(name: "Iranian Rial", flag: "🇮🇷", code: "IRR")
        mapping["ISK"] = CurrencyDetail(name: "Icelandic Krona", flag: "🇮🇸", code: "ISK")
        mapping["JMD"] = CurrencyDetail(name: "Jamaican Dollar", flag: "🇯🇲", code: "JMD")
        mapping["JOD"] = CurrencyDetail(name: "Jordanian Dinar", flag: "🇯🇴", code: "JOD")
        mapping["JPY"] = CurrencyDetail(name: "Japanese Yen", flag: "🇯🇵", code: "JPY")
        mapping["KES"] = CurrencyDetail(name: "Kenyan Shilling", flag: "🇰🇪", code: "KES")
        mapping["KGS"] = CurrencyDetail(name: "Kyrgyzstani Som", flag: "🇰🇬", code: "KGS")
        mapping["KHR"] = CurrencyDetail(name: "Cambodian Riel", flag: "🇰🇭", code: "KHR")
        mapping["KMF"] = CurrencyDetail(name: "Comoro Franc", flag: "🇰🇲", code: "KMF")
        mapping["KPW"] = CurrencyDetail(name: "North Korean Won", flag: "🇰🇵", code: "KPW")
        mapping["KRW"] = CurrencyDetail(name: "South Korean Won", flag: "🇰🇷", code: "KRW")
        mapping["KWD"] = CurrencyDetail(name: "Kuwaiti Dinar", flag: "🇰🇼", code: "KWD")
        mapping["KYD"] = CurrencyDetail(name: "Cayman Islands Dollar", flag: "🇰🇾", code: "KYD")
        mapping["KZT"] = CurrencyDetail(name: "Kazakhstani Tenge", flag: "🇰🇿", code: "KZT")
        mapping["LAK"] = CurrencyDetail(name: "Lao Kip", flag: "🇱🇦", code: "LAK")
        mapping["LBP"] = CurrencyDetail(name: "Lebanese Pound", flag: "🇱🇧", code: "LBP")
        mapping["LKR"] = CurrencyDetail(name: "Sri Lanka Rupee", flag: "🇱🇰", code: "LKR")
        mapping["LRD"] = CurrencyDetail(name: "Liberian Dollar", flag: "🇱🇷", code: "LRD")
        mapping["LSL"] = CurrencyDetail(name: "Lesotho Loti", flag: "🇱🇸", code: "LSL")
        mapping["LTL"] = CurrencyDetail(name: "Lithuanian Litas", flag: "🇱🇹", code: "LTL")
        mapping["LVL"] = CurrencyDetail(name: "Latvian Lats", flag: "🇱🇻", code: "LVL")
        mapping["LYD"] = CurrencyDetail(name: "Libyan Dinar", flag: "🇱🇾", code: "LYD")
        mapping["MAD"] = CurrencyDetail(name: "Moroccan Dirham", flag: "🇲🇦", code: "MAD")
        mapping["MDL"] = CurrencyDetail(name: "Moldovan Leu", flag: "🇲🇩", code: "MDL")
        mapping["MGA"] = CurrencyDetail(name: "Malagasy Ariary", flag: "🇲🇬", code: "MGA")
        mapping["MKD"] = CurrencyDetail(name: "Macedonian Denar", flag: "🇲🇰", code: "MKD")
        mapping["MMK"] = CurrencyDetail(name: "Burmese Kyat", flag: "🇲🇲", code: "MMK")
        mapping["MNT"] = CurrencyDetail(name: "Mongolian Tugrik", flag: "🇲🇳", code: "MNT")
        mapping["MOP"] = CurrencyDetail(name: "Macau Pataca", flag: "🇲🇴", code: "MOP")
        mapping["MRO"] = CurrencyDetail(name: "Mauritanian Ougulya", flag: "🇲🇷", code: "MRO")
        mapping["MUR"] = CurrencyDetail(name: "Mauritian Rupee", flag: "🇲🇺", code: "MUR")
        mapping["MVR"] = CurrencyDetail(name: "Maldivian Rufiyaa", flag: "🇲🇻", code: "MVR")
        mapping["MWK"] = CurrencyDetail(name: "Malawian Kwacha", flag: "🇲🇼", code: "MWK")
        mapping["MXN"] = CurrencyDetail(name: "Mexican Peso", flag: "🇲🇽", code: "MXN")
        mapping["MYR"] = CurrencyDetail(name: "Malaysian Ringgit", flag: "🇲🇾", code: "MYR")
        mapping["MZN"] = CurrencyDetail(name: "Mozambican Metical", flag: "🇲🇿", code: "MZN")
        mapping["NAD"] = CurrencyDetail(name: "Namibian Dollar", flag: "🇳🇦", code: "NAD")
        mapping["NGN"] = CurrencyDetail(name: "Nigerian Naira", flag: "🇳🇬", code: "NGN")
        mapping["NIO"] = CurrencyDetail(name: "Nicaragua Cordoba", flag: "🇳🇮", code: "NIO")
        mapping["NOK"] = CurrencyDetail(name: "Norwegian Krone", flag: "🇳🇴", code: "NOK")
        mapping["NPR"] = CurrencyDetail(name: "Nepalese Rupee", flag: "🇳🇵", code: "NPR")
        mapping["NZD"] = CurrencyDetail(name: "New Zealand Dollar", flag: "🇳🇿", code: "NZD")
        mapping["OMR"] = CurrencyDetail(name: "Omani Rial", flag: "🇴🇲", code: "OMR")
        mapping["PAB"] = CurrencyDetail(name: "Panamanian Balboa", flag: "🇵🇦", code: "PAB")
        mapping["PEN"] = CurrencyDetail(name: "Peruvian Nuevo Sol", flag: "🇵🇪", code: "PEN")
        mapping["PGK"] = CurrencyDetail(name: "Papua New Guinean Kina", flag: "🇵🇬", code: "PGK")
        mapping["PHP"] = CurrencyDetail(name: "Philippine Peso", flag: "🇵🇭", code: "PHP")
        mapping["PKR"] = CurrencyDetail(name: "Pakistani Rupee", flag: "🇵🇰", code: "PKR")
        mapping["PLN"] = CurrencyDetail(name: "Polish Zloty", flag: "🇵🇱", code: "PLN")
        mapping["PYG"] = CurrencyDetail(name: "Paraguayan Guarani", flag: "🇵🇾", code: "PYG")
        mapping["QAR"] = CurrencyDetail(name: "Qatari Riyal", flag: "🇶🇦", code: "QAR")
        mapping["RON"] = CurrencyDetail(name: "Romanian Leu", flag: "🇷🇴", code: "RON")
        mapping["RSD"] = CurrencyDetail(name: "Serbian Dinar", flag: "🇷🇸", code: "RSD")
        mapping["RUB"] = CurrencyDetail(name: "Russian Rouble", flag: "🇷🇺", code: "RUB")
        mapping["RWF"] = CurrencyDetail(name: "Rwandan Franc", flag: "🇷🇼", code: "RWF")
        mapping["SAR"] = CurrencyDetail(name: "Saudi Riyal", flag: "🇸🇦", code: "SAR")
        mapping["SBD"] = CurrencyDetail(name: "Solomon Islands Dollar", flag: "🇸🇧", code: "SBD")
        mapping["SCR"] = CurrencyDetail(name: "Seychelles Rupee", flag: "🇸🇨", code: "SCR")
        mapping["SDG"] = CurrencyDetail(name: "Sudanese Pound", flag: "🇸🇩", code: "SDG")
        mapping["SEK"] = CurrencyDetail(name: "Swedish Krona", flag: "🇸🇪", code: "SEK")
        mapping["SGD"] = CurrencyDetail(name: "Singapore Dollar", flag: "🇸🇬", code: "SGD")
        mapping["SHP"] = CurrencyDetail(name: "Saint Helenian Pound", flag: "🇸🇭", code: "SHP")
        mapping["SKK"] = CurrencyDetail(name: "Slovak Koruna", flag: "🇸🇰", code: "SKK")
        mapping["SLL"] = CurrencyDetail(name: "Sierra Leone Leone", flag: "🇸🇱", code: "SLL")
        mapping["SOS"] = CurrencyDetail(name: "Somali Shilling", flag: "🇸🇴", code: "SOS")
        mapping["SRD"] = CurrencyDetail(name: "Surinamese Dollar", flag: "🇸🇷", code: "SRD")
        mapping["STD"] = CurrencyDetail(name: "Sao Tomean Dobra", flag: "🇸🇹", code: "STD")
        mapping["SVC"] = CurrencyDetail(name: "El Salvador Colón", flag: "🇸🇻", code: "SVC")
        mapping["SYP"] = CurrencyDetail(name: "Syrian Pound", flag: "🇸🇾", code: "SYP")
        mapping["SZL"] = CurrencyDetail(name: "Swaziland Lilageni", flag: "🇸🇿", code: "SZL")
        mapping["THB"] = CurrencyDetail(name: "Thai Baht", flag: "🇹🇭", code: "THB")
        mapping["TJS"] = CurrencyDetail(name: "Tajikistani Somoni", flag: "🇹🇯", code: "TJS")
        mapping["TMT"] = CurrencyDetail(name: "Turkmenistani Manat", flag: "🇹🇲", code: "TMT")
        mapping["TND"] = CurrencyDetail(name: "Tunisian Dinar", flag: "🇹🇳", code: "TND")
        mapping["TOP"] = CurrencyDetail(name: "Tonga Paanga", flag: "🇹🇴", code: "TOP")
        mapping["TRY"] = CurrencyDetail(name: "Turkish Lira", flag: "🇹🇷", code: "TRY")
        mapping["TTD"] = CurrencyDetail(name: "Trinidad and Tobago Dollar", flag: "🇹🇹", code: "TTD")
        mapping["TWD"] = CurrencyDetail(name: "New Taiwan Dollar", flag: "🇹🇼", code: "TWD")
        mapping["TZS"] = CurrencyDetail(name: "Tanzanian Shilling", flag: "🇹🇿", code: "TZS")
        mapping["UAH"] = CurrencyDetail(name: "Ukrainian Hryvnia", flag: "🇺🇦", code: "UAH")
        mapping["UGX"] = CurrencyDetail(name: "Ugandan Shilling", flag: "🇺🇬", code: "UGX")
        mapping["USD"] = CurrencyDetail(name: "United States Dollar", flag: "🇺🇸", code: "USD")
        mapping["UYU"] = CurrencyDetail(name: "Uruguayan Peso", flag: "🇺🇾", code: "UYU")
        mapping["UZS"] = CurrencyDetail(name: "Uzbekistani Som", flag: "🇺🇿", code: "UZS")
        mapping["VEF"] = CurrencyDetail(name: "Venezuelan Bolivar Fuerte", flag: "🇻🇪", code: "VEF")
        mapping["VND"] = CurrencyDetail(name: "Vietnamese Dong", flag: "🇻🇳", code: "VND")
        mapping["VUV"] = CurrencyDetail(name: "Vanuatu Vatu", flag: "🇻🇺", code: "VUV")
        mapping["WST"] = CurrencyDetail(name: "Samoan Tala", flag: "🇼🇸", code: "WST")
        mapping["XAF"] = CurrencyDetail(name: "Central African CFA Franc", flag: "🇨🇲🇨🇫🇹🇩🇨🇬🇬🇶🇬🇦", code: "XAF")
        mapping["XCD"] = CurrencyDetail(name: "East Caribbean Dollar", flag: "🇦🇬🇩🇲🇬🇩🇰🇳🇱🇨🇻🇨🇦🇮🇲🇸", code: "XCD")
        mapping["XDR"] = CurrencyDetail(name: "IMF Special Drawing Rights", flag: "", code: "XDR")
        mapping["XOF"] = CurrencyDetail(name: "West African CFA Franc", flag: "🇧🇯🇧🇫🇬🇼🇨🇮🇲🇱🇳🇪🇸🇳🇹🇬", code: "XOF")
        mapping["XPF"] = CurrencyDetail(name: "Pacific Franc", flag: "🇵🇫🇳🇨🇼🇫", code: "XPF")
        mapping["YER"] = CurrencyDetail(name: "Yemeni Riyal", flag: "🇾🇪", code: "YER")
        mapping["ZAR"] = CurrencyDetail(name: "South African Rand", flag: "🇿🇦", code: "ZAR")
        mapping["ZMK"] = CurrencyDetail(name: "Zambian Kwacha", flag: "🇿🇲", code: "ZMK")
        mapping["ZWD"] = CurrencyDetail(name: "Zimbabwean Dollar", flag: "🇿🇼", code: "ZWD")
        mapping["ZWL"] = CurrencyDetail(name: "Zimbabwean Dollar", flag: "🇿🇼", code: "ZWL")
        mapping["ZWR"] = CurrencyDetail(name: "Zimbabwean Dollar", flag: "🇿🇼", code: "ZWR")

        return mapping
    }()
}

