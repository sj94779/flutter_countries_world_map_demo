import 'dart:convert';
import 'package:countries_world_map/countries_world_map.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  final String country;

  const CountryPage({required this.country, Key? key}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  late String state;
  late String instruction;

  final tooltipkey = GlobalKey<State<Tooltip>>();

  List<GlobalKey> tooltipkeys = List<GlobalKey>.generate(
      12, (index) => GlobalKey(debugLabel: 'key_$index'),
      growable: false);

  late List<Map<String, dynamic>> properties;

  late Map<String, Color?> keyValuesPaires;

  @override
  void initState() {
    instruction = getInstructions(widget.country);
    if (instruction != "NOT SUPPORTED") {
      properties = getProperties(instruction);
      print("total state: ${properties.length}");
      print(properties);
      properties.sort((a, b) => a['name'].compareTo(b['name']));
      keyValuesPaires = {};
      properties.forEach((element) {
        keyValuesPaires.addAll({element['id']: element['color']});
      });

      var listOfColors = [
        Colors.indigo,
        Colors.indigo[100],
        Colors.indigo[900],
        Colors.indigo[200],
        Colors.indigo[400],
        Colors.indigo[500],
        Colors.indigo[600],
        Colors.indigo[300],
        Colors.indigo[700],
        Colors.indigo[300],
        Colors.indigo[900],
        Colors.blue,
        Colors.blue[700],
        Colors.blue[100],
        Colors.blue[200],
        Colors.indigo[500],
        Colors.blue[300],
        Colors.blue[400],
        Colors.blue[500],
        Colors.blue[600],
        Colors.indigo[100],
        Colors.blue[900],
        Colors.blue[500],
        Colors.indigo,
        Colors.indigo[200],
        Colors.indigo[400],
        Colors.indigo[600],
        Colors.blue,
        Colors.blue[700],
        Colors.blue[100],
        Colors.blue[200],
        Colors.indigo[700],
        Colors.blue[300],
        Colors.blue[400],
        Colors.blue[600],
        Colors.blue[900],
        Colors.indigo[100],
        Colors.blue[900],
        Colors.blue[500],
        Colors.indigo,
        Colors.indigo[200],
        Colors.indigo[400],
        Colors.indigo[600],
        Colors.indigo[100],
        Colors.indigo[900],
        Colors.indigo[200],
        Colors.indigo[400],
        Colors.indigo[500],
        Colors.blue[100],
        Colors.indigo[600],
        Colors.indigo[300],
        Colors.indigo[700],
        Colors.indigo[300],
        Colors.indigo[900],
        Colors.blue,
        Colors.blue[700],
        Colors.blue[200],
      ];
      for (int i = 0; i < properties.length; i++) {
        keyValuesPaires.update(keyValuesPaires.keys.toList()[i],
            (value) => value = listOfColors[i]);
      }

      state = 'Tap a state, prefecture or province';
    } else {
      state = 'This country is not supported';
    }

    showAndCloseTooltip();
    super.initState();
  }

  Future showAndCloseTooltip() async {
    await Future.delayed(const Duration(milliseconds: 10));

    var tooltip = [];

    for (int i = 0; i < tooltipkeys.length; i++) {
      tooltip.add(tooltipkeys[i].currentState);

      tooltip[i]?.ensureTooltipVisible();
    }

    await Future.delayed(const Duration(seconds: 4));
    // tooltipkey.currentState.deactivate();
    // tooltip?.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.blue),
          title: Text(
            '${widget.country.toUpperCase()} - $state',
            style: const TextStyle(color: Colors.blue),
          ),
        ),
        body: instruction == "NOT SUPPORTED"
            ? const Center(child: Text("This country is not supported"))
            : Transform.scale(
                scale: 1,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  // //  color: Colors.red,
                  width: 300,
                  height: 300,
                  // width: 130,
                  // height: 100,
                  child: SimpleMap(
                    fit: BoxFit.cover,
                    countryBorder:
                        const CountryBorder(color: Colors.white, width: 4),
                    markers: [
                      // // for Styria  //at  // not working   //ne
                      // getMarker(47.2649, 14.8939, "Styria", 322, ),
                      //
                      // // for Madrid  //es  // not working   //nw
                      // getMarker(40.4637, 3.7492, "Madrid", 322),
                      //
                      // // for Buenos Aries  //ar  //not working  //sw
                      // getMarker(34.6037, 58.3816, "Buenos Aries", 322),
                      //
                      // // for kansas  //us  //not working  //nw
                      // getMarker(40.4258686, -86.9080655, "Kansas", 342),
                      //
                      // // for Canberra  //au  //working  //se
                      // getMarker(-35.473469, 149.012375, "Canberra", 322),
                      //
                      // //for abuja  //ng  //working  //ne
                      // getMarker(9.0563, 7.4985, "Abuja", 220),

                      //for delhi  //in  //working  //se
                      getMarker(28.7041, 77.1025, "Delhi", 348, tooltipkeys[0]),

                      //for mumbai
                      getMarker(
                          19.0760, 72.8777, "Mumbai", 342, tooltipkeys[1]),

                      //for bangalore
                      getMarker(
                          12.971599, 77.5946, "Bangalore", 358, tooltipkeys[2]),

                      //for bhopal
                      getMarker(
                          23.2599, 77.4126, "Bhopal", 523, tooltipkeys[3]),

                      //for bhubaneswar
                      getMarker(
                          20.2960, 85.8246, "Bhubaneswar", 220, tooltipkeys[4]),
                    ],
                    onHover: (String id, String name, bool isHovering) {},
                    defaultColor: Colors.grey.shade300,
                    key: Key(properties.toString()),
                    colors: keyValuesPaires,
                    instructions: instruction,
                    callback: (
                      id,
                      name,
                      tapDetails,
                    ) {
                      showAndCloseTooltip();
                      print("id $id");
                      print("name $name");
                      print("tapDetails $tapDetails");
                      print("tapDetails ${tapDetails.globalPosition}");
                      setState(() {
                        state = name;
                      });
                    },
                  ),
                ),
              ));
  }

  List<Map<String, dynamic>> getProperties(String input) {
    Map<String, dynamic> instructions = json.decode(input);

    List paths = instructions['i'];

    List<Map<String, dynamic>> properties = [];

    paths.forEach((element) {
      properties.add({
        'name': element['n'],
        'id': element['u'],
        'color': null,
      });
    });

    return properties;
  }

  String getInstructions(String id) {
    switch (id) {
      case 'ar':
        return SMapArgentina.instructions;

      case 'at':
        return SMapAustria.instructions;

      case 'ad':
        return SMapAndorra.instructions;

      case 'ao':
        return SMapAngola.instructions;

      case 'am':
        return SMapArmenia.instructions;

      case 'au':
        return SMapAustralia.instructions;

      case 'az':
        return SMapAzerbaijan.instructions;

      case 'bs':
        return SMapBahamas.instructions;

      case 'bh':
        return SMapBahrain.instructions;

      case 'bd':
        return SMapBangladesh.instructions;

      case 'by':
        return SMapBelarus.instructions;

      case 'be':
        return SMapBelgium.instructions;

      case 'bt':
        return SMapBhutan.instructions;

      case 'bo':
        return SMapBolivia.instructions;

      case 'bw':
        return SMapBotswana.instructions;

      case 'br':
        return SMapBrazil.instructions;

      case 'bn':
        return SMapBrunei.instructions;

      case 'bg':
        return SMapBulgaria.instructions;

      case 'bf':
        return SMapBurkinaFaso.instructions;

      case 'bi':
        return SMapBurundi.instructions;

      case 'ca':
        return SMapCanada.instructions;

      case 'cm':
        return SMapCameroon.instructions;

      case 'cf':
        return SMapCentralAfricanRepublic.instructions;

      case 'cv':
        return SMapCapeVerde.instructions;

      case 'td':
        return SMapChad.instructions;

      case 'cn':
        return SMapChina.instructions;

      case 'ch':
        return SMapSwitzerland.instructions;

      case 'cd':
        return SMapCongoDR.instructions;

      case 'cg':
        return SMapCongoBrazzaville.instructions;

      case 'co':
        return SMapColombia.instructions;

      case 'cr':
        return SMapCostaRica.instructions;

      case 'hr':
        return SMapCroatia.instructions;

      case 'cu':
        return SMapCuba.instructions;

      case 'cl':
        return SMapChile.instructions;

      case 'ci':
        return SMapIvoryCoast.instructions;

      case 'cy':
        return SMapCyprus.instructions;

      case 'cz':
        return SMapCzechRepublic.instructions;

      case 'dk':
        return SMapDenmark.instructions;

      case 'dj':
        return SMapDjibouti.instructions;

      case 'do':
        return SMapDominicanRepublic.instructions;

      case 'ec':
        return SMapEcuador.instructions;

      case 'es':
        return SMapSpain.instructions;

      case 'eg':
        return SMapEgypt.instructions;

      case 'et':
        return SMapEthiopia.instructions;

      case 'sv':
        return SMapElSalvador.instructions;

      case 'ee':
        return SMapEstonia.instructions;

      case 'fo':
        return SMapFaroeIslands.instructions;

      case 'fi':
        return SMapFinland.instructions;

      case 'fr':
        return SMapFrance.instructions;

      case 'gb':
        return SMapUnitedKingdom.instructions;

      case 'ge':
        return SMapGeorgia.instructions;

      case 'de':
        return SMapGermany.instructions;

      case 'gr':
        return SMapGreece.instructions;

      case 'gt':
        return SMapGuatemala.instructions;

      case 'gn':
        return SMapGuinea.instructions;

      case 'hi':
        return SMapHaiti.instructions;

      case 'hk':
        return SMapHongKong.instructions;

      case 'hn':
        return SMapHonduras.instructions;

      case 'hu':
        return SMapHungary.instructions;

      case 'in':
        return SMapIndia.instructions;

      case 'id':
        return SMapIndonesia.instructions;

      case 'il':
        return SMapIsrael.instructions;

      case 'ir':
        return SMapIran.instructions;

      case 'iq':
        return SMapIraq.instructions;

      case 'ie':
        return SMapIreland.instructions;

      case 'it':
        return SMapItaly.instructions;

      case 'jm':
        return SMapJamaica.instructions;

      case 'jp':
        return SMapJapan.instructions;

      case 'kz':
        return SMapKazakhstan.instructions;

      case 'ke':
        return SMapKenya.instructions;

      case 'xk':
        return SMapKosovo.instructions;

      case 'kg':
        return SMapKyrgyzstan.instructions;

      case 'la':
        return SMapLaos.instructions;

      case 'lv':
        return SMapLatvia.instructions;

      case 'li':
        return SMapLiechtenstein.instructions;

      case 'lt':
        return SMapLithuania.instructions;

      case 'lu':
        return SMapLuxembourg.instructions;

      case 'mk':
        return SMapMacedonia.instructions;

      case 'ml':
        return SMapMali.instructions;

      case 'mt':
        return SMapMalta.instructions;

      case 'mz':
        return SMapMozambique.instructions;

      case 'mx':
        return SMapMexico.instructions;

      case 'md':
        return SMapMoldova.instructions;

      case 'me':
        return SMapMontenegro.instructions;

      case 'ma':
        return SMapMorocco.instructions;

      case 'mm':
        return SMapMyanmar.instructions;

      case 'my':
        return SMapMalaysia.instructions;

      case 'na':
        return SMapNamibia.instructions;

      case 'np':
        return SMapNepal.instructions;

      case 'nl':
        return SMapNetherlands.instructions;

      case 'nz':
        return SMapNewZealand.instructions;

      case 'ni':
        return SMapNicaragua.instructions;

      case 'ng':
        return SMapNigeria.instructions;

      case 'no':
        return SMapNorway.instructions;

      case 'om':
        return SMapOman.instructions;

      case 'ps':
        return SMapPalestine.instructions;

      case 'pk':
        return SMapPakistan.instructions;

      case 'ph':
        return SMapPhilippines.instructions;

      case 'pa':
        return SMapPanama.instructions;

      case 'pe':
        return SMapPeru.instructions;

      case 'pr':
        return SMapPuertoRico.instructions;

      case 'py':
        return SMapParaguay.instructions;

      case 'pl':
        return SMapPoland.instructions;

      case 'pt':
        return SMapPortugal.instructions;

      case 'qa':
        return SMapQatar.instructions;

      case 'ro':
        return SMapRomania.instructions;

      case 'ru':
        return SMapRussia.instructions;

      case 'rw':
        return SMapRwanda.instructions;

      case 'sa':
        return SMapSaudiArabia.instructions;

      case 'rs':
        return SMapSerbia.instructions;

      case 'sd':
        return SMapSudan.instructions;

      case 'sg':
        return SMapSingapore.instructions;

      case 'sl':
        return SMapSierraLeone.instructions;

      case 'sk':
        return SMapSlovakia.instructions;

      case 'si':
        return SMapSlovenia.instructions;

      case 'kr':
        return SMapSouthKorea.instructions;

      case 'lk':
        return SMapSriLanka.instructions;

      case 'se':
        return SMapSweden.instructions;

      case 'sy':
        return SMapSyria.instructions;

      case 'tw':
        return SMapTaiwan.instructions;

      case 'tj':
        return SMapTajikistan.instructions;

      case 'th':
        return SMapThailand.instructions;

      case 'tr':
        return SMapTurkey.instructions;

      case 'ug':
        return SMapUganda.instructions;

      case 'ua':
        return SMapUkraine.instructions;

      case 'ae':
        return SMapUnitedArabEmirates.instructions;

      case 'us':
        return SMapUnitedStates.instructions;

      case 'uy':
        return SMapUruguay.instructions;

      case 'uz':
        return SMapUzbekistan.instructions;

      case 've':
        return SMapVenezuela.instructions;

      case 'vn':
        return SMapVietnam.instructions;

      case 'ye':
        return SMapYemen.instructions;

      case 'za':
        return SMapSouthAfrica.instructions;

      case 'zm':
        return SMapZambia.instructions;

      case 'zw':
        return SMapZimbabwe.instructions;

      default:
        return 'NOT SUPPORTED';
    }
  }

  SimpleMapMarker getMarker(double lat, double long, String text, int value,
      GlobalKey<State<StatefulWidget>> tooltipkey) {
    return SimpleMapMarker(
      markerSize: const Size(16, 16),
      latLong: LatLong(latitude: lat, longitude: long),
      marker: Tooltip(
        triggerMode: TooltipTriggerMode.manual,
        key: tooltipkey,
        //  triggerMode: TooltipTriggerMode.tap,
        richMessage: WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: Text(value.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 12))))
            ],
          ),
        ),
        //   textStyle: const TextStyle(color: Colors.white),
        padding: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(50)),
        child: Container(
          width: 20,
          height: 20, // or ClipRRect if you need to clip the content
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.black,
              borderRadius: BorderRadius.circular(50) // inner circle color
              ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          // inner content
        ),
      ),
    );
  }
}
