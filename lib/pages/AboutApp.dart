import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          InfoViewAppBar(),
          SliverList(delegate: SliverChildListDelegate([
            Center(
              child: Container(
                child: Image.asset(
                      'assets/images/pocash.jpeg',
                      width: 400,
                      height: 300,
                    ),
              ),
            ),
            // Center(child: InfoRating()),
            SizedBox(height: 0.0),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('About Us', style:TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'OpenSans'
                  )),
                  SizedBox(height: 10.0),
                  Wrap(
                    children: List.generate(1, (_) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0.0),
                          leading: Container(
                            width: 50.0,
                            height: 50.0,
                          ),
                          title: Text('POCASH'),
                          subtitle: Text('POCASH adalah aplikasi berbasis Flutter yang diciptakan dengan tujuan membantu pengguna dalam mengelola dan memantau keuangan pribadi mereka. Nama "POCASH" berasal dari kata "Pocket" dan "Cash", yang menggambarkan esensi aplikasi ini: membantu Anda mengelola uang. Aplikasi ini menampilkan tampilan yang sederhana dan berkesan imut, menciptakan pengalaman yang nyaman dan menyenangkan bagi penggunanya.'),
                        ),
                      );
                    }),
                  )
                ],
              ),
            )
          ])),
        ],
      ),
    );
  }
}

class InfoViewAppBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: 
            <Color>[
            Colors.brown,
            Colors.brown.shade200
            ]
          ),          
        ),
      ),
      leading: IconButton(
        icon : Icon(Icons.keyboard_arrow_left),
        onPressed: () {
        Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            child: Icon(Icons.star, color: Colors.white),
          ),
        ),
        SizedBox(width: 10.0)
      ],
    );
  }
}

