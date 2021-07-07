import 'package:feater_flutter_app/Users/model/user.dart';
import 'package:feater_flutter_app/gql/base_gql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductGQl extends BaseGQL{

  ProductGQl() : super();

  final _getProducts = '''
    query GetProducts{
      products{
        id,
        nombre,
        descripcion,
        precio,
        imagen{
          url
        },
        slug,
        status,
        precioVenta,
        cantidad,
        precioMayoreo,
        subcategorias{
          name
        },
        productores{
          email,
          storyLife,
          username,
        },
        distribuidores{
          alias
        },
        categorias{
          nombre
        }
      }
    }
  ''';

  final _getFavoriteProducts = '''
  
    query FavoriteProducts(\$id: ID!){
      user(
        id: \$id
      ){
        favoriteProducts{
          id,
          nombre,
          descripcion,
          precio,
          imagen{
            url
          },
          slug,
          status,
          precioVenta,
          cantidad,
          precioMayoreo,
          subcategorias{
            name
          },
          productores{
            email,
            storyLife,
            username,
            
          },
          distribuidores{
            alias
          },
          categorias{
            nombre
          }
        }
      }
    
    }
  
  ''';

  queryProductOptions(){
    return QueryOptions(
      document: gql(_getProducts),
      fetchPolicy: FetchPolicy.networkOnly,
    );
  }

  queryFavoriteProducts(){

    User user =  getUser();
    return QueryOptions(
        document: gql(_getFavoriteProducts),
      variables: {
          'id': user.id
      },
      fetchPolicy: FetchPolicy.networkOnly,
    );
  }

}