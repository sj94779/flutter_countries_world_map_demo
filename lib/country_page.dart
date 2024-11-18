import 'dart:convert';

import 'package:countries_world_map/countries_world_map.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as test;
import 'package:zoom_widget/zoom_widget.dart';
import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

class CountryPage extends StatefulWidget {
  final String country;

  const CountryPage({required this.country, Key? key}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  late String state;
  late String instruction;

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
        Colors.amber,
        Colors.cyan,
        Colors.amber[100],
        Colors.red[100],
        Colors.purple[100],
        Colors.lightGreenAccent[100],
        Colors.indigo[100],
        Colors.lightBlue[100],
        Colors.amber,
        Colors.cyan,
        Colors.amber[400],
        Colors.red[400],
        Colors.purple[400],
        Colors.lightGreenAccent[400],
        Colors.indigo[400],
        Colors.lightBlue[400],
        Colors.amber,
        Colors.cyan,
        Colors.amber[200],
        Colors.red[200],
        Colors.purple[200],
        Colors.lightGreenAccent[200],
        Colors.indigo[200],
        Colors.lightBlue[200],
        Colors.amber[600],
        Colors.cyan[600],
        Colors.amber[600],
        Colors.red[600],
        Colors.purple[600],
        Colors.lightGreenAccent[600],
        Colors.indigo[600],
        Colors.lightBlue[600],
        Colors.amber[200],
        Colors.cyan[50],
        Colors.amber[400],
        Colors.red[400],
        Colors.lightBlue[100],
        Colors.amber[100],
        Colors.cyan[100],
        Colors.amber[400],
        Colors.red[400],
        Colors.lightBlue[50],
        Colors.amber[100],
        Colors.cyan[100],
        Colors.amber[400],
        Colors.red[400],
        Colors.lightBlue[100],
        Colors.amber,
        Colors.cyan,
        Colors.amber[900],
        Colors.red[50],
        Colors.lightGreenAccent[900],
        Colors.indigo[900],
        Colors.lightBlue[900],
      ];
      for (int i = 0; i < properties.length; i++) {
        keyValuesPaires.update(keyValuesPaires.keys.toList()[i],
            (value) => value = listOfColors[i]);
      }

      state = 'Tap a state, prefecture or province';
    } else {
      state = 'This country is not supported';
    }
    super.initState();
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
          scale: 5.0,
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.red,
                width: 140,
                height: 100,
                child: SimpleMap(
                  fit: BoxFit.cover,
                  countryBorder:
                      const CountryBorder(color: Colors.black, width: 4),
                  markers: [
                    const SimpleMapMarker(
                        markerSize: Size(50, 50),
                        latLong:
                            LatLong(latitude: 47.7511, longitude: 120.7401),
                        marker: Icon(
                          Icons.circle_outlined,
                          color: Colors.green,
                          size: 16,
                        )),
                    SimpleMapMarker(
                      markerSize: const Size(50, 50),
                      latLong:
                          const LatLong(latitude: 28.7041, longitude: 77.1025),
                      marker: Tooltip(
                        message: state,
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(color: Colors.black),
                        child: const Icon(
                          Icons.info,
                          size: 20,
                        ),
                      ),
                    )
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
                    print("id $id");
                    print("name $name");
                    print("tapDetails $tapDetails");
                    setState(() {
                      state = name;

                      int i = properties
                          .indexWhere((element) => element['id'] == id);

                      // properties[i]['color'] =
                      //     properties[i]['color'] == Colors.green
                      //         ? null
                      //         : Colors.green;
                      // keyValuesPaires[properties[i]['id']] =
                      //     properties[i]['color'];
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
}


class ZoomableWidget extends StatefulWidget {
  final Widget child;

  const ZoomableWidget({ required this.child}) ;
  @override
  _ZoomableWidgetState createState() => _ZoomableWidgetState();
}

class _ZoomableWidgetState extends State<ZoomableWidget> {
  double _scale = 1.5;
  late double _previousScale;
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: GestureDetector(
        onScaleStart: (ScaleStartDetails details) {
          _previousScale = _scale;
        },
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            _scale = _previousScale * details.scale;
          });
        },
        onScaleEnd: (ScaleEndDetails details) {
          _previousScale = 0.0;
        },
        child: Transform(
          transform: Matrix4.diagonal3(test.Vector3(_scale.clamp(1.0, 5.0),
              _scale.clamp(1.0, 5.0), _scale.clamp(1.0, 5.0))),
          alignment: FractionalOffset.center,
          child: widget.child,
        ),
      ),
    );
  }
}
