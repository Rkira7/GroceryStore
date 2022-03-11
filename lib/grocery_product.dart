class GroceryProduct{
  final double? price;
  final String? name;
  final String? decription;
  final String? image;
  final String? weight;

  const GroceryProduct({
    this.price,
    this.name,
    this.decription,
    this.image,
    this.weight});
}

const groceryProducts = <GroceryProduct> [
   GroceryProduct(
      price: 14.11,
      name: "Banana",
      decription: "La banana, conocido también como plátano, guineo maduro, banano, cambur o gualele, es un · Es un fruto con cualidades variables en tamaño, color y firmeza",
      image: "https://www.soriana.com/dw/image/v2/BGBD_PRD/on/demandware.static/-/Sites-soriana-grocery-master-catalog/default/dwa126f46e/images/product/5203_A.jpg?sw=1000&sh=1000&sm=fit",
      weight: "1000g"
  ),
  GroceryProduct(
      price: 14.11,
      name: "Piña",
      decription: "Ananas comosus es una especie de la familia de las bromeliáceas, nativa de América del Sur. Planta de escaso porte y con hojas duras y lanceoladas de hasta 1 m de largo, fructifica una vez al año produciendo un único fruto fragante y dulce, muy apreciado en gastronomía.",
      image: "https://www.frutality.es/wp-content/uploads/pi%C3%B1a.png",
      weight: "1000g"
  ),
  GroceryProduct(
      price: 3.54,
      name: "Avocado",
      decription: "El aguacate (Persea americana Mill.) es un fruto exótico carnoso que se obtiene del árbol tropical del mismo nombre. En algunas partes de América del Sur",
      image: "https://learnenglishteens.britishcouncil.org/sites/teens/files/styles/article/public/rs7776_thinkstockphotos-856586464_1-low.jpg?itok=zHdfQ6Ij",
      weight: "1000g"
  ),
  GroceryProduct(
      price: 8.30,
      name: "Mango",
      decription: "El mango de la especie Mangifera indica es una fruta jugosa (más específicamente una drupa) y tiene numerosas variedades con formas, colores, texturas y sabores",
      image: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Mango_-_single.jpg/251px-Mango_-_single.jpg",
      weight: "1000g"
  ),
  GroceryProduct(
      price: 12.20,
      name: "Peach",
      decription: "Los duraznos pertenecen a la familia Rosaceae, lo que los hace parientes cercanos de la mayor parte de las frutas más comunes",
      image: "http://www.grupoalta.com/wp-content/uploads/2018/03/Productos_06.png",
      weight: "1000g"
  ),
  GroceryProduct(
      price: 7.99,
      name: "Apple",
      decription: "La manzana es el fruto comestible de la especie Malus domestica, el manzano común. Es una fruta pomácea de forma redonda y sabor muy dulce",
      image: "https://www.eluniversal.com.mx/sites/default/files/styles/f03-651x400/public/2016/09/07/manzana.jpg?itok=V5_501d_",
      weight: "1000g"
  ),
];