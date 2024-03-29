import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:intl/intl.dart' as intl;

import 'package:form_validation/src/utils/selloria_icon_icons.dart';
import 'package:form_validation/src/models/product_model.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;
  final Function onDelete;
  final Function onTap;

  ProductWidget({
    Key key,
    @required this.product,
    @required this.onDelete,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = intl.NumberFormat('#,##0.00', 'en_US');
    final price = currencyFormat.format(product.price);

    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
              child: (product.photoUrl == null)
                ? Image(image: AssetImage('assets/no-image.png'))
                : Hero(
                  tag: product.id,
                  child: CachedNetworkImage(
                    imageUrl: product.photoUrl,
                    height: 250.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) {
                      return FadeInImage(
                        image: imageProvider,
                        placeholder: AssetImage('assets/jar-loading.gif'),
                        height: 250.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    } 
                  )
                )
            ),
            ListTile(
                title: Text('${product.title}'),
                subtitle: Text('\$ $price'),
                trailing: IconButton(
                  icon: Icon(SelloriaIcon.garbage),
                  onPressed: onDelete,
                )
            ),
          ],
        ),
      ),
    );
  }
}
