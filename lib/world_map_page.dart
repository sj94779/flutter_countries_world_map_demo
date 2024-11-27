import 'dart:math';
import 'package:countries_world_map/countries_world_map.dart';
import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:flutter/material.dart';

class WorldMapPage extends StatefulWidget {
  WorldMapPage({Key? key}) : super(key: key);

  @override
  _WorldMapPageState createState() => _WorldMapPageState();
}

class _WorldMapPageState extends State<WorldMapPage> {
  List<Color> colors = [
    Colors.indigo.shade900,
    Colors.blue,
    Colors.blue[900]!,
    Colors.blueAccent,
    Colors.blue[50]!,
    Colors.blue[200]!,
    Colors.blue[500]!,
    Colors.blue[600]!,
  ];

  final _random = Random();

  late String country;

  final tooltipkey = GlobalKey<State<Tooltip>>();

  List<GlobalKey> tooltipkeys = List<GlobalKey>.generate(
      12, (index) => GlobalKey(debugLabel: 'key_$index'),
      growable: false);

  @override
  void initState() {
    super.initState();
    country = 'Tap a see country code';
    showAndCloseTooltip();
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
          country,
          style: const TextStyle(color: Colors.blue),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Center(
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.92,
                    // Actual widget from the Countries_world_map package.
                    child: SimpleMap(
                      countryBorder: const CountryBorder(color: Colors.white),
                      instructions: SMapWorld.instructionsMercator,
                      callback: (id, name, tabDetails) {
                        print(id + name);
                        showAndCloseTooltip();
                        setState(() {
                          country = id;
                        });
                      },
                      markers: [
                        // for Kansas
                        getMarker(39.019350, -96.310872, "Kansas", 342,
                            tooltipkeys[5]),
                      ],
                      colors: SMapWorldColors(
                        aD: Colors.indigo[300],
                        aE: colors[_random.nextInt(8)],
                        aF: colors[_random.nextInt(8)],
                        aG: colors[_random.nextInt(8)],
                        aI: colors[_random.nextInt(8)],
                        aL: colors[_random.nextInt(8)],
                        aM: colors[_random.nextInt(8)],
                        aN: colors[_random.nextInt(8)],
                        aO: colors[_random.nextInt(8)],
                        aQ: colors[_random.nextInt(8)],
                        aR: colors[_random.nextInt(8)],
                        aS: colors[_random.nextInt(8)],
                        aT: colors[_random.nextInt(8)],
                        aU: colors[_random.nextInt(8)],
                        aW: colors[_random.nextInt(8)],
                        aX: colors[_random.nextInt(8)],
                        aZ: colors[_random.nextInt(8)],
                        bA: colors[_random.nextInt(8)],
                        bB: colors[_random.nextInt(8)],
                        bD: colors[_random.nextInt(8)],
                        bE: colors[_random.nextInt(8)],
                        bF: colors[_random.nextInt(8)],
                        bG: colors[_random.nextInt(8)],
                        bH: colors[_random.nextInt(8)],
                        bI: colors[_random.nextInt(8)],
                        bJ: colors[_random.nextInt(8)],
                        bL: colors[_random.nextInt(8)],
                        bM: colors[_random.nextInt(8)],
                        bN: colors[_random.nextInt(8)],
                        bO: colors[_random.nextInt(8)],
                        bQ: colors[_random.nextInt(8)],
                        bR: colors[_random.nextInt(8)],
                        bS: colors[_random.nextInt(8)],
                        bT: colors[_random.nextInt(8)],
                        bV: colors[_random.nextInt(8)],
                        bW: colors[_random.nextInt(8)],
                        bY: colors[_random.nextInt(8)],
                        bZ: colors[_random.nextInt(8)],
                        cA: colors[_random.nextInt(8)],
                        cC: colors[_random.nextInt(8)],
                        cD: colors[_random.nextInt(8)],
                        cF: colors[_random.nextInt(8)],
                        cG: colors[_random.nextInt(8)],
                        cH: colors[_random.nextInt(8)],
                        cI: colors[_random.nextInt(8)],
                        cK: colors[_random.nextInt(8)],
                        cL: colors[_random.nextInt(8)],
                        cM: colors[_random.nextInt(8)],
                        cN: colors[_random.nextInt(8)],
                        cO: colors[_random.nextInt(8)],
                        cR: colors[_random.nextInt(8)],
                        cU: colors[_random.nextInt(8)],
                        cV: colors[_random.nextInt(8)],
                        cW: colors[_random.nextInt(8)],
                        cX: colors[_random.nextInt(8)],
                        cY: colors[_random.nextInt(8)],
                        cZ: colors[_random.nextInt(8)],
                        dE: colors[_random.nextInt(8)],
                        dJ: colors[_random.nextInt(8)],
                        dK: colors[_random.nextInt(8)],
                        dM: colors[_random.nextInt(8)],
                        dO: colors[_random.nextInt(8)],
                        dZ: colors[_random.nextInt(8)],
                        eC: colors[_random.nextInt(8)],
                        eE: colors[_random.nextInt(8)],
                        eG: colors[_random.nextInt(8)],
                        eH: colors[_random.nextInt(8)],
                        eR: colors[_random.nextInt(8)],
                        eS: colors[_random.nextInt(8)],
                        eT: colors[_random.nextInt(8)],
                        fI: colors[_random.nextInt(8)],
                        fJ: colors[_random.nextInt(8)],
                        fK: colors[_random.nextInt(8)],
                        fM: colors[_random.nextInt(8)],
                        fO: colors[_random.nextInt(8)],
                        fR: colors[_random.nextInt(8)],
                        gA: colors[_random.nextInt(8)],
                        gB: colors[_random.nextInt(8)],
                        gD: colors[_random.nextInt(8)],
                        gE: colors[_random.nextInt(8)],
                        gF: colors[_random.nextInt(8)],
                        gG: colors[_random.nextInt(8)],
                        gH: colors[_random.nextInt(8)],
                        gI: colors[_random.nextInt(8)],
                        gL: colors[_random.nextInt(8)],
                        gM: colors[_random.nextInt(8)],
                        gN: colors[_random.nextInt(8)],
                        gP: colors[_random.nextInt(8)],
                        gQ: colors[_random.nextInt(8)],
                        gR: colors[_random.nextInt(8)],
                        gS: colors[_random.nextInt(8)],
                        gT: colors[_random.nextInt(8)],
                        gU: colors[_random.nextInt(8)],
                        gW: colors[_random.nextInt(8)],
                        gY: colors[_random.nextInt(8)],
                        hK: colors[_random.nextInt(8)],
                        hM: colors[_random.nextInt(8)],
                        hN: colors[_random.nextInt(8)],
                        hR: colors[_random.nextInt(8)],
                        hT: colors[_random.nextInt(8)],
                        hU: colors[_random.nextInt(8)],
                        iD: colors[_random.nextInt(8)],
                        iE: colors[_random.nextInt(8)],
                        iL: colors[_random.nextInt(8)],
                        iM: colors[_random.nextInt(8)],
                        iN: colors[_random.nextInt(8)],
                        iO: colors[_random.nextInt(8)],
                        iQ: colors[_random.nextInt(8)],
                        iR: colors[_random.nextInt(8)],
                        iS: colors[_random.nextInt(8)],
                        iT: colors[_random.nextInt(8)],
                        jE: colors[_random.nextInt(8)],
                        jM: colors[_random.nextInt(8)],
                        jO: colors[_random.nextInt(8)],
                        jP: colors[_random.nextInt(8)],
                        kE: colors[_random.nextInt(8)],
                        kG: colors[_random.nextInt(8)],
                        kH: colors[_random.nextInt(8)],
                        kI: colors[_random.nextInt(8)],
                        kM: colors[_random.nextInt(8)],
                        kN: colors[_random.nextInt(8)],
                        kP: colors[_random.nextInt(8)],
                        kR: colors[_random.nextInt(8)],
                        kW: colors[_random.nextInt(8)],
                        kY: colors[_random.nextInt(8)],
                        kZ: colors[_random.nextInt(8)],
                        lA: colors[_random.nextInt(8)],
                        lB: colors[_random.nextInt(8)],
                        lC: colors[_random.nextInt(8)],
                        lI: colors[_random.nextInt(8)],
                        lK: colors[_random.nextInt(8)],
                        lR: colors[_random.nextInt(8)],
                        lS: colors[_random.nextInt(8)],
                        lT: colors[_random.nextInt(8)],
                        lU: colors[_random.nextInt(8)],
                        lV: colors[_random.nextInt(8)],
                        lY: colors[_random.nextInt(8)],
                        mA: colors[_random.nextInt(8)],
                        mC: colors[_random.nextInt(8)],
                        mD: colors[_random.nextInt(8)],
                        mE: colors[_random.nextInt(8)],
                        mF: colors[_random.nextInt(8)],
                        mG: colors[_random.nextInt(8)],
                        mH: colors[_random.nextInt(8)],
                        mK: colors[_random.nextInt(8)],
                        mL: colors[_random.nextInt(8)],
                        mM: colors[_random.nextInt(8)],
                        mN: colors[_random.nextInt(8)],
                        mO: colors[_random.nextInt(8)],
                        mP: colors[_random.nextInt(8)],
                        mQ: colors[_random.nextInt(8)],
                        mR: colors[_random.nextInt(8)],
                        mS: colors[_random.nextInt(8)],
                        mT: colors[_random.nextInt(8)],
                        mU: colors[_random.nextInt(8)],
                        mV: colors[_random.nextInt(8)],
                        mW: colors[_random.nextInt(8)],
                        mX: colors[_random.nextInt(8)],
                        mY: colors[_random.nextInt(8)],
                        mZ: colors[_random.nextInt(8)],
                        nA: colors[_random.nextInt(8)],
                        nC: colors[_random.nextInt(8)],
                        nE: colors[_random.nextInt(8)],
                        nF: colors[_random.nextInt(8)],
                        nG: colors[_random.nextInt(8)],
                        nI: colors[_random.nextInt(8)],
                        nL: colors[_random.nextInt(8)],
                        nO: colors[_random.nextInt(8)],
                        nP: colors[_random.nextInt(8)],
                        nR: colors[_random.nextInt(8)],
                        nU: colors[_random.nextInt(8)],
                        nZ: colors[_random.nextInt(8)],
                        oM: colors[_random.nextInt(8)],
                        pA: colors[_random.nextInt(8)],
                        pE: colors[_random.nextInt(8)],
                        pF: colors[_random.nextInt(8)],
                        pG: colors[_random.nextInt(8)],
                        pH: colors[_random.nextInt(8)],
                        pK: colors[_random.nextInt(8)],
                        pL: colors[_random.nextInt(8)],
                        pM: colors[_random.nextInt(8)],
                        pN: colors[_random.nextInt(8)],
                        pR: colors[_random.nextInt(8)],
                        pS: colors[_random.nextInt(8)],
                        pT: colors[_random.nextInt(8)],
                        pW: colors[_random.nextInt(8)],
                        pY: colors[_random.nextInt(8)],
                        qA: colors[_random.nextInt(8)],
                        rE: colors[_random.nextInt(8)],
                        rO: colors[_random.nextInt(8)],
                        rS: colors[_random.nextInt(8)],
                        rU: colors[_random.nextInt(8)],
                        rW: colors[_random.nextInt(8)],
                        sA: colors[_random.nextInt(8)],
                        sB: colors[_random.nextInt(8)],
                        sC: colors[_random.nextInt(8)],
                        sD: colors[_random.nextInt(8)],
                        sE: colors[_random.nextInt(8)],
                        sG: colors[_random.nextInt(8)],
                        sH: colors[_random.nextInt(8)],
                        sI: colors[_random.nextInt(8)],
                        sJ: colors[_random.nextInt(8)],
                        sK: colors[_random.nextInt(8)],
                        sL: colors[_random.nextInt(8)],
                        sM: colors[_random.nextInt(8)],
                        sN: colors[_random.nextInt(8)],
                        sO: colors[_random.nextInt(8)],
                        sR: colors[_random.nextInt(8)],
                        sS: colors[_random.nextInt(8)],
                        sT: colors[_random.nextInt(8)],
                        sV: colors[_random.nextInt(8)],
                        sX: colors[_random.nextInt(8)],
                        sY: colors[_random.nextInt(8)],
                        sZ: colors[_random.nextInt(8)],
                        tC: colors[_random.nextInt(8)],
                        tD: colors[_random.nextInt(8)],
                        tF: colors[_random.nextInt(8)],
                        tG: colors[_random.nextInt(8)],
                        tH: colors[_random.nextInt(8)],
                        tJ: colors[_random.nextInt(8)],
                        tK: colors[_random.nextInt(8)],
                        tL: colors[_random.nextInt(8)],
                        tM: colors[_random.nextInt(8)],
                        tN: colors[_random.nextInt(8)],
                        tO: colors[_random.nextInt(8)],
                        tR: colors[_random.nextInt(8)],
                        tT: colors[_random.nextInt(8)],
                        tV: colors[_random.nextInt(8)],
                        tW: colors[_random.nextInt(8)],
                        tZ: colors[_random.nextInt(8)],
                        uA: colors[_random.nextInt(8)],
                        uG: colors[_random.nextInt(8)],
                        uM: colors[_random.nextInt(8)],
                        uS: colors[_random.nextInt(8)],
                        uY: colors[_random.nextInt(8)],
                        uZ: colors[_random.nextInt(8)],
                        vA: colors[_random.nextInt(8)],
                        vC: colors[_random.nextInt(8)],
                        vE: colors[_random.nextInt(8)],
                        vG: colors[_random.nextInt(8)],
                        vI: colors[_random.nextInt(8)],
                        vN: colors[_random.nextInt(8)],
                        vU: colors[_random.nextInt(8)],
                        wF: colors[_random.nextInt(8)],
                        wS: colors[_random.nextInt(8)],
                        xK: colors[_random.nextInt(8)],
                        yE: colors[_random.nextInt(8)],
                        yT: colors[_random.nextInt(8)],
                        zA: colors[_random.nextInt(8)],
                        zM: colors[_random.nextInt(8)],
                        zW: colors[_random.nextInt(8)],
                      ).toMap(),
                    ),
                  ),
                  // Creates 8% from right side so the map looks more centered.
                  Container(width: MediaQuery.of(context).size.width * 0.08),
                ],
              ),
            ),
            const Positioned(
                bottom: 36,
                left: 0,
                right: 0,
                child: Text('Tap / click the dice to change the colors',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center)),
            Positioned(
              bottom: 36,
              right: 36,
              child: FloatingActionButton(
                  tooltip: 'Randomize',
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Icon(Icons.casino)),
            ),
          ],
        ),
      ),
    );
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
