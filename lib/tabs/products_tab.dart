import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/tiles/category_tile.dart';

class ProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("products").getDocuments(),
      builder: (context,snapshot){
        if(!snapshot.hasData)
          return Center(child: CircularProgressIndicator(),);
        else{
          var dividedTiles = ListTile.divideTiles(
            tiles: snapshot.data.documents.map(
                    (doc){
                  return CategoryTile(doc);
                }
            ).toList(),
            color: Colors.grey[500]
          ).toList();
          return ListView(
            children: dividedTiles,
          );
        }
      },
    );
  }
}


// https://cdn.awsli.com.br/800x800/44/44273/produto/29989858/b28e079baa.jpg
// https://cdn.awsli.com.br/800x800/527/527197/produto/56943081/82cb39864c.jpg

// https://canary.contestimg.wish.com/api/webimage/5d4e93967319d64ca786cbc6-large.jpg?cache_buster=b804d27c344b8621c64d983e0993b6b4
// https://canary.contestimg.wish.com/api/webimage/5d4e93967319d64ca786cbc6-1-large.jpg

// https://www.cz10.com.br/media/catalog/product/cache/1/image/390x390/9df78eab33525d08d6e5fb8d27136e95/m/a/madrugawalking-masculina-marinho_copy_.jpg
// https://www.cz10.com.br/media/catalog/product/cache/1/image/390x390/9df78eab33525d08d6e5fb8d27136e95/m/a/madruga_walking-vetor-marinho_copy__1.png