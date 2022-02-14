import 'package:flutter/material.dart';

class CardWindow extends StatelessWidget {
  final Map<String, dynamic> windows;
  const CardWindow({Key? key, required this.windows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String address = windows['address'] as String;
    final String subr = windows['suburb'] as String;
    final card = Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      margin: const EdgeInsets.only(left: 50.0),
      height: 220,
      width: double.maxFinite,
      child: const Card(
        elevation: 5,
        color: Colors.white70,
        shadowColor: Colors.black45,
      ),
    );
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0, 0),
                blurRadius: 1.0,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    "https://phantom-expansion.unidadeditorial.es/7a01447f134fa1a4baadf1c5174644cf/resize/640/assets/multimedia/imagenes/2021/03/16/16158875126483.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Divider(height: 1, color: Colors.grey.shade400),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      windows['name_real_estate'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Color(0xFF9634FF),
                          size: 20,
                        ),
                        Text(
                          "$address, $subr",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 25,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.star_border,
              color: Color(0xFF7C01FF),
            ),
          ),
        ),
      ],
    );
  }
}
