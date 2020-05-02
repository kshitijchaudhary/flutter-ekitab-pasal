// Widget customSlider(BuildContext context) {
//     return Swiper(
      
//       itemBuilder: (BuildContext context, int index) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             height: 200.0,
//             decoration: BoxDecoration(
//                 color: Colors.indigo,
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: AssetImage(bannerImage[index])
//                 ),
//                 borderRadius: BorderRadius.circular(20.0)),
//           ),
//         );
//       },
//       itemCount: bannerImage.length,
//       viewportFraction: 0.8,
//       autoplay: true,
//     );
//   }

//   Widget homeBuild(BuildContext context) {
//     deviceHeight = MediaQuery.of(context).size.height;
//     deviceWidth = MediaQuery.of(context).size.width;

//     return SafeArea(
//       top: true,
//       bottom: true,
//       child: Stack(
//         children: <Widget>[
//           CustomScrollView(
//             controller: _scrollController,
//             slivers: <Widget>[
//               SliverList(
//                 delegate: SliverChildListDelegate([
//                   Container(height: 200.0, child: customSlider(context)),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: <Widget>[
//                         Expanded(
//                           child: Text(
//                             'Browse By Categories',
//                             style: TextStyle(
//                                 fontSize: (deviceHeight / 100) + 10,
//                                 color: Color(0xFFFF900F),
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8.0),
//                           child: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(50.0),
//                                   border: Border.all(color: Color(0xFFFF900F))),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(3.0),
//                                 child: Icon(Icons.arrow_forward_ios,
//                                     size: (deviceHeight / 100) + 5),
//                               )),
//                         )
//                       ],
//                     ),
//                   ),
//                   FutureBuilder(
//                     //future: cats,
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         return Container(
//                           height: (deviceHeight + 370) * 0.1,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: snapshot.data.length,
//                             itemExtent: (deviceHeight + 190) * 0.1,
//                             itemBuilder: (context, i) {
//                               return Column(
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 4.0, right: 4.0),
//                                     child: GestureDetector(
//                                       child: Hero(
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(90.0),
//                                               border: Border.all(
//                                                   color: Colors.white),
//                                               color: Colors.transparent),
//                                           height: deviceHeight * 0.1,
//                                           width: deviceHeight * 0.1,
//                                           child: ClipRRect(
//                                             child: FadeInImage.assetNetwork(
//                                               placeholder:
//                                                   'assets/images/placeholder.png',
//                                               image: (snapshot.data[i].image !=
//                                                       null)
//                                                   ? snapshot.data[i].image.src
//                                                   : 'assets/images/loginbg.png',
//                                               fit: BoxFit.fill,
//                                             ),
//                                             borderRadius:
//                                                 BorderRadius.circular(90.0),
//                                           ),
//                                         ),
//                                         tag: snapshot.data[i].id.toString(),
//                                       ),
//                                       onTap: () {
//                                         // Navigator.push(
//                                         //     context,
//                                         //     MaterialPageRoute(
//                                         //         builder: (context) =>
//                                         //             CategoryScreen(
//                                         //               id: snapshot.data[i].id,
//                                         //               imgSrc: (snapshot.data[i]
//                                         //                           .image !=
//                                         //                       null)
//                                         /*                   ? snapshot*/
//                                         //                       .data[i].image.src
//                                         //                   : 'assets/images/loginbg.png',
//                                         //               categoryName:
//                                         //                   snapshot.data[i].name,
//                                         //             )));
//                                       },
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Container(
//                                       child: Text(
//                                         snapshot.data[i].name,
//                                         maxLines: 1,
//                                         softWrap: false,
//                                         overflow: TextOverflow.ellipsis,
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                       width: 90.0,
//                                     ),
//                                   )
//                                 ],
//                               );
//                             },
//                           ),
//                         );
//                       } else {
//                         return Column(
//                           children: <Widget>[
//                             Container(
//                               height: (deviceHeight + 370) * 0.1,
//                               child: ListView.builder(
//                                   itemCount: 10,
//                                   itemExtent: (deviceHeight + 190) * 0.1,
//                                   scrollDirection: Axis.horizontal,
//                                   // Important code
//                                   itemBuilder: (context, index) =>
//                                       Shimmer.fromColors(
//                                         baseColor: Colors.grey[400],
//                                         highlightColor: Colors.white,
//                                         child: Column(
//                                           children: <Widget>[
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 4.0, right: 4.0),
//                                               child: Container(
//                                                   height: deviceHeight * 0.1,
//                                                   width: deviceHeight * 0.1,
//                                                   decoration: BoxDecoration(
//                                                     color: Colors.black26,
//                                                     boxShadow: [BoxShadow()],
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             90.0),
//                                                   )),
//                                             ),
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: Container(
//                                                 height: 10,
//                                                 width: 90.0,
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       )),
//                             ),
//                           ],
//                         );
//                       }
//                     },
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: <Widget>[
//                         Expanded(
//                           child: Text(
//                             'Listing Popular Rentals',
//                             style: TextStyle(
//                                 fontSize: (deviceHeight / 100) + 10,
//                                 color: Color(0xFFFF900F),
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
//                           child: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(50.0),
//                                   border: Border.all(color: Color(0xFFFF900F))),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(3.0),
//                                 child: Icon(Icons.arrow_forward_ios,
//                                     size: (deviceHeight / 100) + 5),
//                               )),
//                         )
//                       ],
//                     ),
//                   ),
//                 ]
//                 ),
//             ),
//               // (productsList == null)
//               //     ? SliverGrid.count(
//               //         crossAxisCount: 3,
//               //         childAspectRatio: deviceHeight / (deviceHeight + 600),
//               //         mainAxisSpacing: 1.0,
//               //         crossAxisSpacing: 1.0,
//               //         children: bookShimmer.map((item) {
//               //           return item;
//               //         }).toList())
//               //     : SliverGrid.count(
//               //         crossAxisCount: 3,
//               //         mainAxisSpacing: 1.0,
//               //         crossAxisSpacing: 1.0,
//               //         childAspectRatio: deviceHeight / (deviceHeight + 600),
//               //         children: productsList.map((item) {
//               //           return Column(
//               //             children: <Widget>[
//               //               GestureDetector(
//               //                 onTap: () {
//               //                   Navigator.push(
//               //                       context,
//               //                       MaterialPageRoute(
//               //                           builder: (context) => DetailPage(
//               //                               id: item.id,
//               //                               bookAttributes: item.attri,
//               //                               avgRating: double.parse(
//               //                                   item.averageRating),
//               //                               sortDec: parse(item.sortDescription)
//               //                                   .body
//               //                                   .text,
//               //                               purchaseNote:
//               //                                   parse(item.purchaseNote)
//               //                                       .body
//               //                                       .text,
//               //                               bookName: item.name,
//               //                               bookDescription: item.description,
//               //                               bookImage: item.images[0].src,
//               //                               priceHtml: item.priceHtml)));
//               //                 },
//               //                 child: Column(
//               //                   children: <Widget>[
//               //                     Stack(
//               //                       children: <Widget>[
//               //                         Container(
//               //                           height: (deviceHeight / 10) + 100,
//               //                           child: Padding(
//               //                             padding: const EdgeInsets.all(8.0),
//               //                             child: Hero(
//               //                               tag: item.id,
//               //                               child: Stack(
//               //                                 children: <Widget>[
//               //                                   Container(
//               //                                     height:
//               //                                         (deviceHeight / 10) + 100,
//               //                                     child: ClipRRect(
//               //                                       child: FadeInImage
//               //                                           .assetNetwork(
//               //                                         placeholder:
//               //                                             'res/images/placeholder.png',
//               //                                         image: item.images[0].src,
//               //                                         width:
//               //                                             (deviceHeight / 10) +
//               //                                                 70,
//               //                                         fit: BoxFit.fill,
//               //                                       ),
//               //                                       borderRadius:
//               //                                           BorderRadius.circular(
//               //                                               10.0),
//               //                                     ),
//               //                                     decoration: BoxDecoration(
//               //                                       color: Colors.white,
//               //                                       boxShadow: [
//               //                                         BoxShadow(
//               //                                           color: Colors.black45,
//               //                                           offset:
//               //                                               Offset(1.0, 1.0),
//               //                                           blurRadius: 4.0,
//               //                                         )
//               //                                       ],
//               //                                       borderRadius:
//               //                                           BorderRadius.circular(
//               //                                               15.0),
//               //                                     ),
//               //                                   )
//               //                                   /*  Container(
//               //                                     width: (deviceHeight / 10) + 70,
//               //                                     decoration:   BoxDecoration(
//               //                                         color: Colors.black26,
//               //                                         boxShadow: [
//               //                                             BoxShadow(
//               //                                             color: Colors.black45,
//               //                                             offset:
//               //                                                   Offset(1.0, 1.0),
//               //                                             blurRadius: 4.0,
//               //                                           )
//               //                                         ],
//               //                                         borderRadius:
//               //                                               BorderRadius.circular(
//               //                                                 15.0),
//               //                                         image:   DecorationImage(
//               //                                             fit: BoxFit.cover,
//               //                                             image:   NetworkImage(
//               //                                                 item.images[0].src))),
//               //                                   ),*/
//               //                                 ],
//               //                               ),
//               //                             ),
//               //                           ),
//               //                         ),
//               //                       ],
//               //                     ),
//               //                     Padding(
//               //                       padding: const EdgeInsets.symmetric(
//               //                           horizontal: 10.0),
//               //                       child: Container(
//               //                           child: Text(
//               //                         item.name,
//               //                         maxLines: 1,
//               //                         softWrap: false,
//               //                         overflow: TextOverflow.ellipsis,
//               //                         style: TextStyle(
//               //                             fontWeight: FontWeight.w400,
//               //                             fontSize: 16.0),
//               //                       )),
//               //                     ),
//               //                     Padding(
//               //                       padding: const EdgeInsets.symmetric(
//               //                           horizontal: 10.0),
//               //                       child: Container(
//               //                           width: 140.0,
//               //                           child: Text(
//               //                             item.priceHtml,
//               //                             maxLines: 1,
//               //                             softWrap: false,
//               //                             overflow: TextOverflow.ellipsis,
//               //                             style: TextStyle(
//               //                                 color: Colors.black87,
//               //                                 fontWeight: FontWeight.bold,
//               //                                 fontSize: 13.0,
//               //                                 fontStyle: FontStyle.normal),
//               //                           )),
//               //                     ),
//               //                   ],
//               //                 ),
//               //               )
//               //             ],
//               //           );
//                     //  }).toList(),
//                    // ),
//               SliverList(
//                 delegate: SliverChildListDelegate([
//                   (dataAvailable)
//                       ? Container(
//                           height: 50.0,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: CupertinoActivityIndicator(),
//                           ))
//                       : Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.all(18.0),
//                               child: Text('No More Books To Display'),
//                             )
//                           ],
//                         )
//                 ]),
//               )
//             ],
//           ),
//          // headerbuilder(context),
//         ],
//       ),
//     );
//   }

//   Widget makeCard({context,startColor,endColor,image}){
//     return GestureDetector(
//       onTap: (){
//         Navigator.push(context, PageTransition(type:PageTransitionType.fade,child:BookDetails()));
//       },
//       child: AspectRatio(
//         aspectRatio: 4/5,
//         child: Container(
//           margin: EdgeInsets.only(right:20),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(13.0),
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               colors: [
//                 startColor,
//                 endColor
//               ],
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey[350],
//                 blurRadius: 10,
//                 offset: Offset(5,10)
//               ),
//             ]
//           ),
//           child:Padding(
//             padding: EdgeInsets.all(50),
//             child:Center(
//               child: Image.asset(image),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

    


//   /*_setDrawerItemWidget(int pos) {
//     switch (pos) {
//       case 0:
//         return new HomeFragment();
//       case 1:
//         return new AboutUs();
//       case 2:
//         return new OurMission();
//       case 3:
//         return new OurVision();
//       case 4:
//         return new ContactUs();
//       case 5:
//         return new PrivacyPolicy();
//       case 6:
//         return new RateUs();
//       case 7:
//         return new AboutApp();

//       default:
//         return new Text("Error");
//     }
//   }*/





//  Container(
//                height: 200,
//                width: double.infinity,
//                child:ListView(
//                  padding: EdgeInsets.only(bottom:20,left:20),
//                  scrollDirection: Axis.horizontal,
//                  children: <Widget>[
//                   FadeAnimation(1.3, makeCard(
//                      context:context,
//                      startColor:Color.fromRGBO(251, 121, 155, 1),
//                      endColor: Color.fromRGBO(251, 53, 105, 1),
//                      image: 'assets/logo.png'
                   
//                    )),
//                    FadeAnimation(1.4,makeCard(
//                      context:context,
//                      startColor:Color.fromRGBO(203, 251, 255, 1),
//                      endColor: Color.fromRGBO(81, 223, 234, 1),
//                      image: 'assets/logo.png'
                   
//                    )),
//                      FadeAnimation(1.4,makeCard(
//                      context:context,
//                      startColor:Color.fromRGBO(208, 90, 294, 1),
//                      endColor: Color.fromRGBO(23, 21, 80, 1),
//                      image: 'assets/logo.png'
                   
//                    )),
//                  ],
//                ),
//                ),





// Padding(
//              padding: EdgeInsets.all(25),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  FadeAnimation(1.2,Text('Choose \na category',style: TextStyle(
//                    fontWeight: FontWeight.bold,
//                    fontSize: 20,
//                    color:Color.fromRGBO(97, 90, 90, 1)
//                  )),
//                  ),
                 
                 
//                  Container(
//                    child: new Wrap(
//                     //spacing: 8.0, // gap between adjacent chips
//                    // runSpacing: 4.0,
//                     direction: Axis.horizontal, // main axis (rows or columns)

//                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        FadeAnimation(1.2,FlatButton(
//                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                          padding: EdgeInsets.all(5),
//                          onPressed: (){},
//                          color:Color.fromRGBO(251, 53, 105, 0.1),
//                          child: Text('Text Books',style: TextStyle(
//                            color: Color.fromRGBO(251, 53, 105, 1),
//                            fontSize: 16,
//                            fontWeight: FontWeight.bold
//                            ),
//                            ),
//                        )),
//                        SizedBox(width: 20.0,),
//                        FadeAnimation(1.3,FlatButton(
//                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                          padding: EdgeInsets.all(10),
//                          onPressed: (){},
//                          color:Color.fromRGBO(97, 90, 90, 0.1),
//                          child: Text('Crime and Detective',style: TextStyle(
//                            color: Color.fromRGBO(97, 90, 90, 0.6),
//                            fontSize: 16,
//                            fontWeight: FontWeight.bold
//                            ),
//                            ),
//                        )),
                       
//                        SizedBox(width: 20.0,),
//                        FadeAnimation(1.3,FlatButton(
//                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                          padding: EdgeInsets.all(10),
//                          onPressed: (){},
//                          color:Color.fromRGBO(97, 90, 90, 0.1),
//                          child: Text('Cosmic and Graphic Novel',style: TextStyle(
//                            color: Color.fromRGBO(97, 90, 90, 0.6),
//                            fontSize: 16,
//                            fontWeight: FontWeight.bold
//                            ),
//                            ),
//                        )),
//                      ],
//                    ),
//                  )
                 








//                ],
//              ),
//            ),