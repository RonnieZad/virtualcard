import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CardFrontLayout {
  String cardTitle;
  String? cardNumber;
  String? cardExpiry;
  String? cardHolderName;
  Widget? cardTypeIcon;
  double? cardWidth;
  double? cardHeight;
  Color? textColor;
  String cardLogo;
  String? textExpDate;
  String? textName;
  String? textExpiry;
  final String mask;

  CardFrontLayout({
    this.cardTitle = '',
    this.cardNumber = '',
    this.cardExpiry = '',
    this.cardHolderName = '',
    this.textExpDate = 'Exp. Date',
    this.textExpiry = 'MM/YY',
    this.textName = 'Card Holder',
    required this.mask,
    required this.cardLogo,
    this.cardTypeIcon,
    this.cardWidth = 0,
    this.cardHeight = 0,
    this.textColor,
  });

  Widget layout1() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 2),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            top: -25,
            right: -5.0,
            child: Image.asset(
              cardLogo,
              width: 80.0,
              height: 80.0,
              color: textColor,
            ),
          ),
          Positioned(
            top: 2.0,
            left: 0.0,
            child: Text(
              cardTitle,
              style: TextStyle(
                  color: textColor, fontSize: 17, fontWeight: FontWeight.w800),
            ),
          ),
              Positioned(
            bottom: 35.0,
            right: 0.0,
            child:
               Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'EXPIRES',
                          style: TextStyle(
                              package: 'awesome_card',
                              color: textColor,
                              fontFamily: 'MavenPro',
                              fontSize: 10),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          cardExpiry == null || cardExpiry!.isEmpty
                              ? textExpiry!
                              : cardExpiry!,
                          style: TextStyle(
                              package: 'awesome_card',
                              color: textColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'MavenPro',
                              fontSize: 12),
                        ),
                      ],
                    ),),

          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    QrImage(
                      foregroundColor: Colors.white,
                      data:
                          ' messagemessagemessagemessagemessagemessagemessagemessage',
                      version: QrVersions.auto,
                      size: 78,
                      gapless: true,
                    ),
                    Text(
                      cardNumber == null || cardNumber!.isEmpty
                          ? mask
                          : cardNumber!,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Post No Bills Colombo',
                        fontSize: 26,
                      ),
                    ),


                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 7, // 60% of space => (6/(6 + 4))
                          child: Text(
                            cardHolderName == null || cardHolderName!.isEmpty
                                ? textName!
                                : cardHolderName!,
                            style: TextStyle(
                              package: 'awesome_card',
                              color: textColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 2, // 40% of space
                            child: cardTypeIcon != null
                                ? cardTypeIcon!
                                : SizedBox(
                                    width: 10,
                                  )),
                      ],
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
