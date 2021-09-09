class CountryFlags
{
  static String getFlag(String countryName){
    
    var flagImage="999-default";

    switch(countryName?.toLowerCase()) {
      case "mauritius":
        flagImage="001-mauritius";
      break;
      case "cyprus":
        flagImage="002-cyprus";
      break;
      case "austria":
        flagImage="003-austria";
      break;
      case "oman":
        flagImage="004-oman";
      break;
      case "ethiopia":
        flagImage="005-ethiopia";
      break;
      case "tanzania":
        flagImage="006-tanzania";
      break;
      case "nicaragua":
        flagImage="007-nicaragua";
      break;
      case "estonia":
        flagImage="008-estonia";
      break;
      case "uganda":
        flagImage="009-uganda";
      break;
      case "slovenia":
        flagImage="010-slovenia";
      break;
      case "zimbabwe":
        flagImage="011-zimbabwe";
      break;
      case "sao tome and prince":
        flagImage="012-sao-tome-and-prince";
      break;
      case "italy":
        flagImage="013-italy";
      break;
      case "wales":
        flagImage="014-wales";
      break;
      case "el salvador":
        flagImage="015-el-salvador";
      break;
      case "nepal":
        flagImage="016-nepal";
      break;
      case "christmas island":
        flagImage="017-christmas-island";
      break;
      case "lebanon":
        flagImage="018-lebanon";
      break;
      case "ceuta":
        flagImage="019-ceuta";
      break;
      case "iraq":
        flagImage="020-iraq";
      break;
      case "cook islands":
        flagImage="021-cook-islands";
      break;
      case "syria":
        flagImage="022-syria";
      break;
      case "cocos island":
        flagImage="023-cocos-island";
      break;
      case "honduras":
        flagImage="024-honduras";
      break;
      case "anguilla":
        flagImage="025-anguilla";
      break;
      case "american samoa":
        flagImage="027-american-samoa";
      break;
      case "puerto rico":
        flagImage="028-puerto-rico";
      break;
      case "comoros":
        flagImage="029-comoros";
      break;
       case "north korea":
        flagImage="030-north-korea";
      break;
      case "zambia":
        flagImage="032-zambia";
      break;
       case "saint kitts and nevis":
        flagImage="033-saint-kitts-and-nevis";
      break;
      case "china":
        flagImage="034-china";
      break;
      case "luxembourg":
        flagImage="035-luxembourg";
      break;
      case "central african republic":
        flagImage="036-central-african-republic";
      break;
      case "jamaica":
        flagImage="037-jamaica";
      break;
      case "cape verde":
        flagImage="038-cape-verde";
      break;
      case "monaco":
        flagImage="039-monaco";
      break;
      case "bhutan":
        flagImage="040-bhutan";
      break;
      case "paraguay":
        flagImage="041-paraguay";
      break;
      case "aruba":
        flagImage="042-aruba";
      break;
      case "montserrat":
        flagImage="043-montserrat";
      break;
      case "latvia":
        flagImage="044-latvia";
      break;
      case "andorra":
        flagImage="045-andorra";
      break;
      case "micronesia":
        flagImage="046-micronesia";
      break;
      case "dominican republic":
        flagImage="047-dominican-republic";
      break;
      case "abkhazia":
        flagImage="048-abkhazia";
      break;
       case "tunisia":
        flagImage="049-tunisia";
      break;
      case "mauritania":
        flagImage="050-mauritania";
      break;
      case "cayman islands":
        flagImage="051-cayman-islands";
      break;
      case "kosovo":
        flagImage="052-kosovo";
      break;
      case "ghana":
        flagImage="053-ghana";
      break;
      case "canary islands":
        flagImage="054-canary-islands";
      break;
      case "scotland":
        flagImage="055-scotland";
      break;
      case "guinea bissau":
        flagImage="056-guinea-bissau";
      break;
      case "burundi":
        flagImage="057-burundi";
      break;
      case "myanmar":
        flagImage="058-myanmar";
      break;
      case "gabon":
        flagImage="059-gabon";
      break;
      case "benin":
        flagImage="060-benin";
      break;
      case "saba island":
        flagImage="061-saba-island";
      break;
      case "namibia":
        flagImage="062-namibia";
      break;
      case "japan":
        flagImage="063-japan";
      break;
       case "lithuania":
        flagImage="064-lithuania";
      break;
      case "eritrea":
        flagImage="065-eritrea";
      break;
      case "chad":
        flagImage="066-chad";
      break;
      case "kenya":
        flagImage="067-kenya";
      break;
      case "djibouti":
        flagImage="068-djibouti";
      break;
      case "british indian ocean territory":
        flagImage="069-british-indian-ocean-territory";
      break;
      case "tuvalu":
        flagImage="070-tuvalu-1";
      break;
      case "serbia":
        flagImage="071-serbia";
      break;
      case "bonaire":
        flagImage="072-bonaire";
      break;
      case "togo":
        flagImage="073-togo";
      break;
      case "kazakhstan":
        flagImage="074-kazakhstan";
      break;
      case "antigua and barbuda":
        flagImage="075-antigua-and-barbuda";
      break;
      case "suriname":
        flagImage="076-suriname";
      break;
      case "jordan":
        flagImage="077-jordan";
      break;
      case "belize":
        flagImage="078-belize";
      break;
      case "st barts":
        flagImage="079-st-barts";
      break;
      case "iceland":
        flagImage="080-iceland";
      break;
      case "bermuda":
        flagImage="081-bermuda";
      break;
      case "united nations":
        flagImage="082-united-nations";
      break;
      case "somalia":
        flagImage="083-somalia";
      break;
      case "barbados":
        flagImage="084-barbados";
      break;
      case "solomon islands":
        flagImage="085-solomon-islands";
      break;
      case "nigeria":
        flagImage="086-nigeria";
      break;
      case "aland islands":
        flagImage="087-aland-islands";
      break;
      case "uruguay":
        flagImage="088-uruguay";
      break;
      case "sint maarten":
        flagImage="089-sint-maarten";
      break;
      case "burkina faso":
        flagImage="090-burkina-faso";
      break;
      case "slovakia":
        flagImage="091-slovakia";
      break;
      case "sierra leone":
        flagImage="092-sierra-leone";
      break;
      case "basque country":
        flagImage="093-basque-country";
      break;
      case "south korea":
        flagImage="094-south-korea";
      break;
      case "pitcairn islands":
        flagImage="095-pitcairn-islands";
      break;
      case "mozambique":
        flagImage="096-mozambique";
      break;
      case "san marino":
        flagImage="097-san-marino";
      break;
      case "guatemala":
        flagImage="098-guatemala";
      break;
      case "albania":
        flagImage="099-albania";
      break;
      case "pakistan":
        flagImage="100-pakistan";
      break;
      case "northern cyprus":
        flagImage="101-northern-cyprus";
      break;
      case "balearic islands":
        flagImage="102-balearic-islands";
      break;
      case "marshall island":
        flagImage="103-marshall-island";
      break;
      case "ecuador":
        flagImage="104-ecuador";
      break;
      case "cameroon":
        flagImage="105-cameroon";
      break;
      case "panama":
        flagImage="106-panama";
      break;
      case "kwait":
        flagImage="107-kwait";
      break;
      case "armenia":
        flagImage="108-armenia";
      break;
      case "romania":
        flagImage="109-romania";
      break;
      case "guinea":
        flagImage="110-guinea";
      break;
      case "afghanistan":
        flagImage="111-afghanistan";
      break;
      case "laos":
        flagImage="112-laos";
      break;
      case "greenland":
        flagImage="113-greenland";
      break;
      case "british virgin islands":
        flagImage="114-british-virgin-islands";
      break;
      case "hungary":
        flagImage="115-hungary";
      break;
      case "curacao":
        flagImage="116-curacao";
      break;
      case "angola":
        flagImage="117-angola";
      break;
      case "malasya":
        flagImage="118-malasya";
      break;
      case "brunei":
        flagImage="119-brunei";
      break;
      case "bahamas":
        flagImage="120-bahamas";
      break;
      case "new zealand":
        flagImage="121-new-zealand";
      break;
      case "faroe islands":
        flagImage="122-faroe-islands";
      break;
      case "british columbia":
        flagImage="123-british-columbia";
      break;
      case "vatican city":
        flagImage="124-vatican-city";
      break;
      case "finland":
        flagImage="125-finland";
      break;
      case "botswana":
        flagImage="126-botswana";
      break;
      case "sri lanka":
        flagImage="127-sri-lanka";
      break;
      case "spain":
        flagImage="128-spain";
      break;
      case "ossetia":
        flagImage="129-ossetia";
      break;
      case "sicily":
        flagImage="130-sicily";
      break;
      case "chile":
        flagImage="131-chile";
      break;
      case "bosnia and herzegovina":
        flagImage="132-bosnia-and-herzegovina";
      break;
      case "saudi arabia":
        flagImage="133-saudi-arabia";
      break;
      case "liechtenstein":
        flagImage="134-liechtenstein";
      break;
      case "belarus":
        flagImage="135-belarus";
      break;
      case "iran":
        flagImage="136-iran";
      break;
      case "fiji":
        flagImage="137-fiji";
      break;
      case "bahrain":
        flagImage="138-bahrain";
      break;
      case "venezuela":
        flagImage="139-venezuela";
      break;
      case "east timor":
        flagImage="140-east-timor";
      break;
      case "azerbaijan":
        flagImage="141-azerbaijan";
      break;
      case "tibet":
        flagImage="142-tibet";
      break;
      case "norway":
        flagImage="143-norway";
      break;
      case "algeria":
        flagImage="144-algeria";
      break;
      case "ukraine":
        flagImage="145-ukraine";
      break;
      case "gambia":
        flagImage="146-gambia";
      break;
      case "bangladesh":
        flagImage="147-bangladesh";
      break;
      case "madeira":
        flagImage="148-madeira";
      break;
      case "czech republic":
        flagImage="149-czech-republic";
      break;
      case "bolivia":
        flagImage="150-bolivia";
      break;
      case "united arab emirates":
        flagImage="151-united-arab-emirates";
      break;
      case "kyrgyzstan":
        flagImage="152-kyrgyzstan";
      break;
      case "cuba":
        flagImage="153-cuba";
      break;
      case "swaziland":
        flagImage="154-swaziland";
      break;
      case "israel":
        flagImage="155-israel";
      break;
      case "costa rica":
        flagImage="156-costa-rica";
      break;
      case "republic of the congo":
        flagImage="157-republic-of-the-congo";
      break;
      case "egypt":
        flagImage="158-egypt";
      break;
      case "cambodia":
        flagImage="159-cambodia";
      break;
      case "northern marianas islands":
        flagImage="160-northern-marianas-islands";
      break;
      case "ivory coast":
        flagImage="161-ivory-coast";
      break;
      case "germany":
        flagImage="162-germany";
      break;
      case "papua new guinea":
        flagImage="163-papua-new-guinea";
      break;
      case "croatia":
        flagImage="164-croatia";
      break;
      case "belgium":
        flagImage="165-belgium";
      break;
      case "morocco":
        flagImage="166-morocco";
      break;
      case "macao":
        flagImage="167-macao";
      break;
      case "bulgaria":
        flagImage="168-bulgaria";
      break;
      case "liberia":
        flagImage="169-liberia";
      break;
      case "greece":
        flagImage="170-greece";
      break;
      case "galapagos islands":
        flagImage="171-galapagos-islands";
      break;
      case "st lucia":
        flagImage="172-st-lucia";
      break;
      case "mali":
        flagImage="173-mali";
      break;
      case "denmark":
        flagImage="174-denmark";
      break;
      case "rapa nui":
        flagImage="175-rapa-nui";
      break;
      case "lesotho":
        flagImage="176-lesotho";
      break;
      case "colombia":
        flagImage="177-colombia";
      break;
      case "palau":
        flagImage="178-palau";
      break;
      case "ireland":
        flagImage="179-ireland";
      break;
      case "french polynesia":
        flagImage="180-french-polynesia";
      break;
      case "trinidad and tobago":
        flagImage="181-trinidad-and-tobago";
      break;
      case "niue":
        flagImage="182-niue";
      break;
      case "hong kong":
        flagImage="183-hong-kong";
      break;
      case "sweden":
        flagImage="184-sweden";
      break;
      case "haiti":
        flagImage="185-haiti";
      break;
      case "dominica":
        flagImage="186-dominica";
      break;
      case "vanuatu":
        flagImage="187-vanuatu";
      break;
      case "peru":
        flagImage="188-peru";
      break;
      case "equatorial guinea":
        flagImage="189-equatorial-guinea";
      break;
      case "uzbekistan":
        flagImage="190-uzbekistn";
      break;
      case "tonga":
        flagImage="191-tonga";
      break;
      case "philippines":
        flagImage="192-philippines";
      break;
      case "norfolk island":
        flagImage="193-norfolk-island";
      break;
      case "malta":
        flagImage="194-malta";
      break;
      case "france":
        flagImage="195-france";
      break;
      case "tajikistan":
        flagImage="196-tajikistan";
      break;
      case "melilla":
        flagImage="197-melilla";
      break;
      case "argentina":
        flagImage="198-argentina";
      break;
      case "sudan":
        flagImage="199-sudan";
      break;
      case "south africa":
        flagImage="200-south-africa";
      break;
      case "martinique":
        flagImage="201-martinique";
      break;
      case "taiwan":
        flagImage="202-taiwan";
      break;
      case "sahrawi arab democratic republic":
        flagImage="203-sahrawi-arab-democratic-republic";
      break;
      case "guernsey":
        flagImage="204-guernsey";
      break;
      case "switzerland":
        flagImage="205-switzerland";
      break;
      case "rwanda":
        flagImage="206-rwanda";
      break;
      case "guam":
        flagImage="207-guam";
      break;
      case "palestine":
        flagImage="208-palestine";
      break;
      case "indonesia":
        flagImage="209-indonesia";
      break;
      case "grenada":
        flagImage="210-grenada";
      break;
      case "poland":
        flagImage="211-poland";
      break;
      case "moldova":
        flagImage="212-moldova";
      break;
      case "gibraltar":
        flagImage="213-gibraltar";
      break;
      case "malawi":
        flagImage="214-malawi";
      break;
      case "falkland islands":
        flagImage="215-falkland-islands";
      break;
      case "england":
        flagImage="216-england";
      break;
      case "virgin islands":
        flagImage="217-virgin-islands";
      break;
      case "turkey":
        flagImage="218-turkey";
      break;
      case "isle of man":
        flagImage="219-isle-of-man";
      break;
      case "vietnam":
        flagImage="220-vietnam";
      break;
      case "tuvalu":
        flagImage="221-tuvalu";
      break;
      case "niger":
        flagImage="222-niger";
      break;
      case "turks and caicos":
        flagImage="223-turks-and-caicos";
      break;
      case "portugal":
        flagImage="224-portugal";
      break;
      case "maldives":
        flagImage="225-maldives";
      break;
      case "senegal":
        flagImage="227-senegal";
      break;
      case "nauru":
        flagImage="228-nauru";
      break;
      case "turkmenistan":
        flagImage="229-turkmenistan";
      break;
      case "singapore":
        flagImage="230-singapore";
      break;
      case "libya":
        flagImage="231-libya";
      break;
      case "yemen":
        flagImage="232-yemen";
      break;
      case "transnistria":
        flagImage="233-transnistria";
      break;
      case "australia":
        flagImage="234-australia";
      break;
      case "tokelau":
        flagImage="235-tokelau";
      break;
      case "republic of macedonia":
        flagImage="236-republic-of-macedonia";
      break;
      case "netherlands":
        flagImage="237-netherlands";
      break;
      case "thailand":
        flagImage="238-thailand";
      break;
      case "montenegro":
        flagImage="239-montenegro";
      break;
      case "azores islands":
        flagImage="240-azores-islands";
      break;
      case "st vincent and the grenadines":
        flagImage="241-st-vincent-and-the-grenadines";
      break;
      case "madagascar":
        flagImage="242-madagascar";
      break;
      case "canada":
        flagImage="243-canada";
      break;
      case "south sudan":
        flagImage="244-south-sudan";
      break;
      case "jersey":
        flagImage="245-jersey";
      break;
      case "india":
        flagImage="246-india";
      break;
      case "somaliland":
        flagImage="247-somaliland";
      break;
      case "russia":
        flagImage="248-russia";
      break;
      case "democratic republic of congo":
        flagImage="249-democratic-republic-of-congo";
      break;
      case "saint eustatius":
        flagImage="250-sint-eustatius";
      break;
      case "samoa":
        flagImage="251-samoa";
      break;
      case "mexico":
        flagImage="252-mexico";
      break;
      case "seychelles":
        flagImage="253-seychelles";
      break;
      case "nato":
        flagImage="254-nato";
      break;
      case "brazil":
        flagImage="255-brazil";
      break;
      case "georgia":
        flagImage="256-georgia";
      break;
      case "sardinia":
        flagImage="257-sardinia";
      break;
      case "mongolia":
        flagImage="258-mongolia";
      break;
      case "european union":
        flagImage="259-european-union";
      break;
      case "united kingdom":
        flagImage="260-united-kingdom";
      break;
      case "kiribati":
        flagImage="261-kiribati";
      break;
      case "hawaii":
        flagImage="262-hawaii";
      break;
      case "united states":
        flagImage="263-united-states";
      break;
      default:
        flagImage="263-united-states";
      break;
      
    }
    
    var flagImagePath="assets/images/flags/$flagImage.png";
    return flagImagePath;
  }
}